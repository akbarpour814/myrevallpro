import 'package:customer_club/features/home/presentation/blocs/get_home_data/get_home_data_bloc.dart';
import 'package:customer_club/features/home/presentation/widgets/grid_shop_item.dart';
import 'package:customer_club/features/home/presentation/widgets/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetHomeDataBloc, GetHomeDataState>(
        builder: (context, state) {
          return SafeArea(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(6, 6, 6, 80),
              children: [
                HomeSlider(
                    (state as GetHomeDataLoaded).homeDataModel.slides ?? []),
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  children: (state.homeDataModel.shops ?? [])
                      .map((e) => GridShopItem(e))
                      .toList(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
