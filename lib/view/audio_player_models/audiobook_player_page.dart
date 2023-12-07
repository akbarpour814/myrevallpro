//------/dart and flutter packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//------/packages
import 'package:sizer/sizer.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:intl/intl.dart' as INTL;
import 'package:audio_service/audio_service.dart';

//------/controller
import '/controller/custom_dio.dart';
import '/controller/internet_connection.dart';
import '/controller/load_data_from_api.dart';

//------/model
import '/model/book_introduction.dart';

//------/view/audio_player_models/progress_bar
import '/view/audio_player_models/progress_bar/custom_progress_bar.dart';

//------/view/audio_player_models
import '/view/audio_player_models/audio_player_handler.dart';
import '/view/audio_player_models/queue_state.dart';
import '/view/audio_player_models/show_slider_dialog.dart';

//------/view/view_models
import '/view/view_models/book_introduction_page.dart';
import '/view/view_models/custom_circular_progress_indicator.dart';
import '/view/view_models/no_internet_connection.dart';

//------/main
import '/main.dart';

List<MediaItem> mediaItems = [];

// ignore: must_be_immutable
class AudiobookPlayerPage extends StatefulWidget {
  late BookIntroduction audiobook;

  AudiobookPlayerPage({
    Key? key,
    required this.audiobook,
  }) : super(key: key);

  @override
  State<AudiobookPlayerPage> createState() => _AudiobookPlayerPageState();
}

class _AudiobookPlayerPageState extends State<AudiobookPlayerPage>
    with InternetConnection, LoadDataFromAPI {
  @override
  void initState() {
    super.initState();

    dataIsLoading = widget.audiobook.id != previousAudiobookInPlayId;

    audiobookIsPlaying.$ = true;
  }

  Future _initMediaItems() async {
    customDio = await CustomDio.dio
        .post('dashboard/books/${widget.audiobook.slug}/audio');

    if (customDio.statusCode == 200) {
      if (widget.audiobook.id != previousAudiobookInPlayId) {
        setState(() {
          for (Map<String, dynamic> mediaItem in customDio.data['data']) {
            mediaItems.add(
              MediaItem(
                id: '${storage}book-files/${mediaItem['url']}',
                album: widget.audiobook.name,
                title: mediaItem['name'] ?? '',
                artist: widget.audiobook.author,
                duration: Duration(
                  milliseconds: INTL.DateFormat('HH:mm:ss')
                      .parse(
                        mediaItem['timer'],
                        true,
                      )
                      .millisecondsSinceEpoch,
                ),
                artUri: Uri.parse(widget.audiobook.bookCoverPath),
              ),
            );
          }

          previousAudiobookInPlayId = widget.audiobook.id;

          dataIsLoading = false;

          audioPlayerHandler.audioPlayer.seek(Duration(microseconds: 0), index: 0);

        });

        await audioPlayerHandler.updateQueue(mediaItems);

      }
    }

    return customDio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: const Divider(
        height: 0.0,
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(widget.audiobook.name),
      automaticallyImplyLeading: false,
      leading: InkWell(
        onTap: () {
          setState(() {
            Navigator.of(context).pop();
          });
        },
        child: const Icon(
          Ionicons.chevron_down_outline,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            setState(() {
              audiobookInPlayId = -1;
              audiobookIsPlaying.$ = false;

              audioPlayerHandler.stop();

              audioPlayerHandler.onTaskRemoved();

              audioPlayerHandler.seek(Duration(microseconds: 0));

              previousAudiobookInPlayId = -1;
              mediaItems.clear();

              _close();

              Navigator.of(context).pop();
            });
          },
          child: const Padding(
            padding: EdgeInsets.all(18.0),
            child: Icon(
              Ionicons.close_outline,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _close() async {
    await audioPlayerHandler.updateQueue([]);


    await audioPlayerHandler.dispose();
  }

  Widget _body() {
    if ((dataIsLoading) && (widget.audiobook.id != previousAudiobookInPlayId)) {
      return FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return _innerBody();
          } else {
            return Center(child: CustomCircularProgressIndicator());
          }
        },
        future: _initMediaItems(),
      );
    } else {
      if (demoOfBookIsPlaying.of(context)) {
        return _innerBody();
      } else {
        audioPlayerHandler.play();

        return _innerBody();

        // try {
        //   return FutureBuilder(
        //     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        //       return _innerBody();
        //     },
        //     future: ,
        //   );
        // } catch(e) {
        //
        // }
      }
    }
  }

  Widget _innerBody() {
    Widget _body = Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _upperPart(),
            _bookIntroduction(),
            _progressBar(),
            _cycleModesAndSpeedPlay(),
            _lowerPart(),
          ],
        ),
        _bookIndex(),
      ],
    );

    if (connectionStatus == ConnectivityResult.none) {
      audioPlayerHandler.stop();

      setState(() {
        dataIsLoading = true;
      });

      return const Center(
        child: NoInternetConnection(),
      );
    } else {
      if (MediaQuery.of(context).orientation == Orientation.landscape) {
        return SingleChildScrollView(child: _body);
      } else {
        return _body;
      }
    }
  }

  Padding _upperPart() {
    return Padding(
      padding: EdgeInsets.only(
        left: 5.0.w,
        top: 16.0,
        right: 5.0.w,
        bottom: 0.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _bookCover(),
          Expanded(
            child: StreamBuilder<MediaItem?>(
              stream: audioPlayerHandler.mediaItem,
              builder: (context, snapshot) {
                MediaItem? snapshotTemp = snapshot.data;

                if (snapshotTemp == null) {
                  return const SizedBox();
                } else {
                  return _controlButtons();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  InkWell _bookCover() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(
          builder: (context) {
            return BookIntroductionPage(book: widget.audiobook);
          },
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          shape: BoxShape.rectangle,
        ),
        width: 40.0.w,
        height: 20.0.h,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          child: FadeInImage.assetNetwork(
            placeholder: defaultBookCover,
            image: widget.audiobook.bookCoverPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _bookIntroduction() {
    return StreamBuilder<MediaItem?>(
      stream: audioPlayerHandler.mediaItem,
      builder: (context, snapshot) {
        MediaItem? snapshotTemp = snapshot.data;

        if (snapshotTemp == null) {
          return const SizedBox();
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 5.0.w),
            child: Center(
              child: Text(
                snapshotTemp.title,
                style: TextStyle(color: Theme.of(context).primaryColor),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
      },
    );
  }

  Row _controlButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _nextButton(),
        _playButton(),
        _previousButton(),
      ],
    );
  }

  Widget _nextButton() {

    return StreamBuilder<QueueState>(
      stream: audioPlayerHandler.queueState,
      builder: (context, snapshot) {
        final queueState = snapshot.data ?? QueueState.empty;
        return InkWell(
          child: Icon(
            Ionicons.play_forward_outline,
            color: queueState.hasNext
                ? Theme.of(context).primaryColor
                : Colors.grey,
          ),
          onTap: queueState.hasNext ? audioPlayerHandler.skipToNext : null,
        );
      },
    );
  }

  StreamBuilder<PlaybackState> _playButton() {
    return StreamBuilder<PlaybackState>(

      stream: audioPlayerHandler.playbackState,

      builder: (context, snapshot) {
        final playbackState = snapshot.data;
        final processingState = playbackState?.processingState;

        final playing = playbackState?.playing;



        if (processingState == AudioProcessingState.loading ||
            processingState == AudioProcessingState.buffering) {
          return FloatingActionButton(
            onPressed: null,
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else if (playing != true) {
          return FloatingActionButton(
            child: const Icon(Ionicons.play_outline),
            onPressed: () {
              setState(() {
                demoPlayer.stop();
                demoOfBookIsPlaying.$ = false;
                demoInPlayId = -1;
              });

              audioPlayerHandler.play();
            },
          );
        } else {
          return FloatingActionButton(
            child: const Icon(Ionicons.pause_outline),
            onPressed: audioPlayerHandler.pause,
          );
        }
      },
    );
  }

  Widget _previousButton() {

    return StreamBuilder<QueueState>(
      stream: audioPlayerHandler.queueState,
      builder: (context, snapshot) {
        final queueState = snapshot.data ?? QueueState.empty;
        return InkWell(
          child: Icon(
            Ionicons.play_back_outline,
            color: queueState.hasPrevious
                ? Theme.of(context).primaryColor
                : Colors.grey,
          ),
          onTap:
              queueState.hasPrevious ? audioPlayerHandler.skipToPrevious : null,
        );
      },
    );
  }

  Padding _progressBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0.w),
      child: CustomProgressBar(
        audioPlayer: audioPlayerHandler.audioPlayer,
        timeLabelLocation: TimeLabelLocation.below,
        baseBarColor: Colors.grey.shade300,
      ),
    );
  }

  Padding _cycleModesAndSpeedPlay() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 5.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _cycleModes(),
          _speedPlay(),
        ],
      ),
    );
  }

  Widget _cycleModes() {

    return StreamBuilder<AudioServiceRepeatMode>(
      stream: audioPlayerHandler.playbackState
          .map((state) => state.repeatMode)
          .distinct(),
      builder: (context, snapshot) {
        AudioServiceRepeatMode repeatMode =
            snapshot.data ?? AudioServiceRepeatMode.none;

        List<Icon> icons = [
          Icon(
            Icons.repeat_rounded,
            color: Colors.grey,
          ),
          Icon(
            Icons.repeat_rounded,
            color: Theme.of(context).primaryColor,
          ),
          Icon(
            Icons.repeat_one_rounded,
            color: Theme.of(context).primaryColor,
          ),
        ];

        const List<AudioServiceRepeatMode> cycleModes = [
          AudioServiceRepeatMode.none,
          AudioServiceRepeatMode.all,
          AudioServiceRepeatMode.one,
        ];

        int index = cycleModes.indexOf(repeatMode);

        return InkWell(
          child: icons[index],
          onTap: () {
            audioPlayerHandler.setRepeatMode(
              cycleModes[
                  (cycleModes.indexOf(repeatMode) + 1) % cycleModes.length],
            );
          },
        );
      },
    );
  }

  Widget _speedPlay() {

    return StreamBuilder<double>(
      stream: audioPlayerHandler.speed,
      builder: (context, snapshot) => InkWell(
        child: Text(
          "${snapshot.data?.toStringAsFixed(1)}x",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        onTap: () {
          showSliderDialog(
            context: context,
            title: 'سرعت پخش',
            divisions: 10,
            min: 0.5,
            max: 1.5,
            value: audioPlayerHandler.speed.value,
            stream: audioPlayerHandler.speed,
            onChanged: audioPlayerHandler.setSpeed,
          );
        },
      ),
    );
  }

  Column _lowerPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 5.0.w,
            top: 0.0,
            right: 5.0.w,
            bottom: 8.0,
          ),
          child: Text(
            'فهرست کتاب',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Divider(
          height: 0.0,
        ),
      ],
    );
  }

  Widget _bookIndex() {

    StreamBuilder _bookIndex = StreamBuilder<QueueState>(
      stream: audioPlayerHandler.queueState,
      builder: (context, snapshot) {
        final queueState = snapshot.data ?? QueueState.empty;
        final queue = queueState.queue;
        return SingleChildScrollView(
          child: Column(
            children: [
              for (var i = 0; i < queue.length; i++)
                Card(
                  elevation: 0.0,
                  shape: Theme.of(context).cardTheme.shape,
                  color: i == queueState.queueIndex
                      ? Theme.of(context).primaryColor
                      : null,
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            queue[i].title,
                            style: TextStyle(
                              color: i == queueState.queueIndex
                                  ? Colors.white
                                  : null,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Text(
                          queue[i].duration.toString().substring(
                                0,
                                queue[i].duration.toString().indexOf('.'),
                              ),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    onTap: () => audioPlayerHandler.skipToQueueItem(i),
                  ),
                ),
            ],
          ),
        );
      },
    );

    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return _bookIndex;
    } else {
      return Expanded(
        child: _bookIndex,
      );
    }
  }
}
