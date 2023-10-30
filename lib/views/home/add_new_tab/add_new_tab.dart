import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_trigger_autocomplete/multi_trigger_autocomplete.dart';
import 'package:revallpro/data/model/text_model.dart';
import 'package:revallpro/gen/fonts.gen.dart';
import 'package:revallpro/utils/assist.dart';
import 'package:revallpro/utils/custom_modals.dart';
import 'package:revallpro/utils/extentions.dart';
import 'package:revallpro/utils/user_infos.dart';
import 'package:revallpro/utils/validators.dart';
import 'package:revallpro/views/components/are_you_sure_alert.dart';
import 'package:revallpro/views/home/add_new_tab/bloc/add_new_bloc.dart';
import 'package:revallpro/views/home/add_new_tab/hashtag_auto_complate/hashtag_auto_complate.dart';

class AddNewTab extends StatefulWidget {
  final void Function() onTextAdded;
  final TextModel? initEditModel;
  const AddNewTab({required this.onTextAdded, this.initEditModel, super.key});

  @override
  State<AddNewTab> createState() => AddNewTabState();
}

class AddNewTabState extends State<AddNewTab> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();
  final FocusNode _tagFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextModel? _editModel;
  bool _goDelete = false;

  @override
  void initState() {
    super.initState();
    if (widget.initEditModel != null) {
      loadEditModel(widget.initEditModel!);
    }
  }

  void loadEditModel(TextModel editTextModel) {
    _textController.text = editTextModel.title ?? '';
    _tagController.clear();
    if (editTextModel.tagsList != null) {
      for (var element in editTextModel.tagsList!) {
        _tagController.text += '#${element.title} ';
      }
    }
    _editModel = editTextModel;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Portal(
        child: BlocProvider(
          create: (context) => AddNewBloc(),        
          child: BlocConsumer<AddNewBloc, AddNewState>(
            buildWhen: (previous, current) => previous != current,
            listenWhen: (previous, current) => previous != current,
            listener: (context, state) {
              if (state is AddNewSuccess) {
                CustomModal.showSuccess(
                    context,
                    '${_editModel != null ? _goDelete ? 'Deleted' : 'Updated' : 'New text saved'} successfully.');
                _textController.clear();
                _tagController.clear();
                _editModel = null;
                _goDelete = false;
                widget.onTextAdded();
              }
              if (state is AddNewError) {
                CustomModal.showError(context, state.message);
              }
            },
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    12.hsb(),
                    Text(
                      'Text:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    4.hsb(),
                    TextFormField(
                      maxLines: 6,
                      minLines: 6,
                      controller: _textController,
                      onChanged: (value) => setState(() {}),
                      style: TextStyle(
                          fontFamily: isPersian(_textController.text)
                              ? FontFamily.iranSans
                              : null),
                      onFieldSubmitted: (value) =>
                          setState(() => _tagFocusNode.requestFocus()),
                      validator: (value) => generalValidator(value, 'Text'),
                    ),
                    20.hsb(),
                    Text(
                      'Tags:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    4.hsb(),
                    MultiTriggerAutocomplete(
                      optionsAlignment: OptionsAlignment.topStart,
                      textEditingController: _tagController,
                      focusNode: _tagFocusNode,
                      autocompleteTriggers: [
                        AutocompleteTrigger(
                          trigger: '#',
                          optionsViewBuilder:
                              (context, autocompleteQuery, controller) {
                            return HashtagAutocompleteOptions(
                              query: autocompleteQuery.query
                                  .trim()
                                  .replaceAll(' ', '')
                                  .split('#')
                                  .last,
                              onHashtagTap: (hashtag) {
                                final autocomplete =
                                    MultiTriggerAutocomplete.of(context);
                                autocomplete
                                    .acceptAutocompleteOption(hashtag.name);
                              },
                            );
                          },
                        ),
                      ],
                      fieldViewBuilder: (context, controller, focusNode) {
                        return TextFormField(
                          maxLines: 4,
                          minLines: 4,
                          focusNode: focusNode,
                          controller: controller,
                          onChanged: (value) => setState(() {}),
                          style: TextStyle(
                              fontFamily:
                                  isPersian(controller.text.replaceAll('#', ''))
                                      ? FontFamily.iranSans
                                      : null),
                          decoration: InputDecoration(
                            helperText: 'separate with #',
                          ),
                          validator: (value) {
                            if ((value != null && value.isNotEmpty)) {
                              if (value == '#' ||
                                  !value.contains('#') ||
                                  value
                                      .split(' ')
                                      .where((element) => element.isNotEmpty)
                                      .any((element) =>
                                          !element.startsWith('#') ||
                                          element.length < 2)) {
                                return 'Tags is not valid!';
                              }

                              if (value.contains(' ') && value.contains('#')) {
                                var valList = value.split(' ');
                                for (var item in valList) {
                                  var ss = item.replaceFirst('#', '');
                                  if (ss.contains('#') || ss.contains(' ')) {
                                    return 'Tags is not valid!';
                                  }
                                }
                              }

                              if (!value.contains(' ') &&
                                  value.replaceFirst('#', '').contains('#')) {
                                return 'Tags is not valid!';
                              }
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    30.hsb(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                    Size(40.w(context), 40))),
                            onPressed: state is AddNewLoading
                                ? null
                                : () async {
                                    if (_formKey.currentState!.validate()) {
                                      String? userId = await UserInfos.getId();
                                      BlocProvider.of<AddNewBloc>(context)
                                          .add(AddNewTextRequestEvent(
                                        textModel: TextModel(
                                            key: _editModel?.key,
                                            createAt: DateTime.now()
                                                .toIso8601String(),
                                            issuer: userId,
                                            title: _textController.text.trim()),
                                        tags: _tagController.text.trim(),
                                      ));
                                    }},
                            child: state is AddNewLoading && !_goDelete
                                ? CupertinoActivityIndicator(
                                    color: Colors.white,
                                  )
                                : Text('Save')),
                      ],
                    ),
                    if (_editModel != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  side: MaterialStateProperty.all(BorderSide(
                                      color: Theme.of(context).primaryColor)),
                                  elevation: MaterialStateProperty.all(0),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  minimumSize: MaterialStateProperty.all(
                                      Size(40.w(context), 40))),
                              onPressed: () => showDialog(
                                    context: context,
                                    builder: (ctx) =>
                                        AreYouSureAlert(onSurePressed: () {
                                      Navigator.pop(context);
                                      _goDelete = true;
                                      setState(() {});
                                      BlocProvider.of<AddNewBloc>(context)
                                          .add(AddNewTextRequestEvent(
                                        textModel: _editModel!,
                                        tags: '',
                                        goDelete: true,
                                      ));
                                    }),
                                  ),
                              child: state is AddNewLoading && _goDelete
                                  ? CupertinoActivityIndicator(
                                      color: Theme.of(context).primaryColor,
                                    )
                                  : Text(
                                      'Delete',
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ))
                        ],
                      )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
