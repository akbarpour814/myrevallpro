import 'package:customer_club/core/utils/extentions.dart';
import 'package:customer_club/core/utils/my_icons.dart';
import 'package:customer_club/core/utils/validators.dart';
import 'package:customer_club/core/widgets/custom_drop_down.dart';
import 'package:customer_club/features/login/data/models/city_model.dart';
import 'package:customer_club/features/login/presentation/widgets/city/bloc/city_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CityListDrobDown extends StatefulWidget {
  final void Function(CityModel selectedCity) onSelected;
  final String? selectCityId;
  const CityListDrobDown(
      {required this.onSelected, this.selectCityId, super.key});

  @override
  State<CityListDrobDown> createState() => _CityListDrobDownState();
}

class _CityListDrobDownState extends State<CityListDrobDown> {
  CityModel? _selectedCity;
  List<CityModel> _cityList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = CityListBloc();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          bloc.add(CityListRequestEvent());
        });
        return bloc;
      },
      child: BlocConsumer<CityListBloc, CityListState>(
        listenWhen: (previous, current) => previous != current,
        buildWhen: (previous, current) => previous != current,
        listener: (context, state) {
          if (state is CityListLoaded) {
            setState(() {
              _selectedCity = null;
              _cityList = [];
              _cityList = state.cityList;
              if (widget.selectCityId.isNotNullOrEmpty &&
                  state.cityList.any((element) =>
                      element.id.toString() == widget.selectCityId)) {
                _selectedCity = state.cityList.firstWhere(
                    (element) => element.id.toString() == widget.selectCityId);
                widget.onSelected(state.cityList.firstWhere(
                    (element) => element.id.toString() == widget.selectCityId));
              }
            });
          }
        },
        builder: (context, state) {
          return CustomDropDown<CityModel>(
              lable: '',
              hint: 'شهر',
              isBold: true,
              dropdownSelectedValue: _selectedCity,
              prefixIcon: SizedBox(
                width: 20,
                child: Center(
                  child: SvgPicture.string(
                    MyIcons.locationSelected,
                    width: 20,
                  ),
                ),
              ),
              dropdownItemList: _cityList.map(
                (e) {
                  return DropdownMenuItem<CityModel>(
                    value: e,
                    alignment: Alignment.centerRight,
                    child: Text(
                      e.name ?? '',
                      textDirection: TextDirection.rtl,
                    ),
                  );
                },
              ).toList(),
              validator: (value) => dropdownValidator(value, 'شهر'),
              onChanged: (value) => widget.onSelected(value));
        },
      ),
    );
  }
}
