import 'package:customer_club/configs/color_palette.dart';
import 'package:customer_club/core/utils/my_icons.dart';
import 'package:customer_club/core/widgets/my_loading.dart';
import 'package:customer_club/features/home/presentation/blocs/get_guild/get_guild_bloc.dart';
import 'package:customer_club/features/home/presentation/widgets/guild_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class GuildListScreen extends StatefulWidget {
  const GuildListScreen({super.key});

  @override
  State<GuildListScreen> createState() => _GuildListScreenState();
}

class _GuildListScreenState extends State<GuildListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetGuildBloc()
        ..add(
          GetGuildStartEvent(),
        ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Center(child: SvgPicture.string(MyIcons.categoryWhie)),
          title: const Text(
            'اصناف',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          backgroundColor: ColorPalette.primaryColor,
        ),
        body: SafeArea(
          child: BlocBuilder<GetGuildBloc, GetGuildState>(
            builder: (context, state) {
              return state is GetGuildLoading
                  ? MyLoading()
                  : state is GetGuildLoaded && state.guildList.isNotEmpty
                      ? GridView.count(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 3,
                          childAspectRatio: 1,
                          padding: const EdgeInsets.only(bottom: 80),
                          children: state.guildList
                              .map((e) => GuildItemWidget(e))
                              .toList(),
                        )
                      : const Center(
                          child: Text('موردی یافت نشده است!'),
                        );
            },
          ),
        ),
      ),
    );
  }
}
