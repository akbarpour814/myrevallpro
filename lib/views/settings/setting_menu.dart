import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_file_saver/flutter_file_saver.dart';
import 'package:revallpro/utils/custom_modals.dart';
import 'package:revallpro/views/home/tag_list_tab/bloc/tag_list_bloc.dart';
import 'package:revallpro/views/home/text_list_tab/bloc/text_list_bloc.dart';
import 'package:revallpro/views/settings/bloc/sign_out_bloc.dart';

class SettingMenu extends StatelessWidget {
  const SettingMenu({
    super.key,
    required SignOutBloc bloc,
  }) : _bloc = bloc;

  final SignOutBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      surfaceTintColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onSelected: (value) async {
        switch (value) {
          case 0:
            _getExcelReport(context);
            break;
          default:
            BlocProvider.of<TextListBloc>(context).add(TextListClearEvent());
            BlocProvider.of<TagListBloc>(context).add(TagListClearEvent());
            _bloc.add(SignOutRequestEvent());
        }
      },
      itemBuilder: (BuildContext bc) {
        return [
          PopupMenuItem(
            child: Text(
              "Download Data as EXCEL",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(fontSize: 14),
            ),
            value: 0,
          ),
          PopupMenuItem(
            child: Text(
              "Sign Out",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: Colors.red, fontSize: 14),
            ),
            value: 1,
          ),
        ];
      },
    );
  }

  _getExcelReport(BuildContext context) async {
    try {
      final bloc = BlocProvider.of<TextListBloc>(context);
      if (bloc.state is TextListLoaded &&
          (bloc.state as TextListLoaded).textList.isNotEmpty) {
        final textList = (bloc.state as TextListLoaded).textList;
        var excel = Excel.createExcel();
        Sheet sheetObject = excel['RevAll Pro'];

        CellStyle cellStyle = CellStyle(
            horizontalAlign: HorizontalAlign.Center,
            fontFamily: getFontFamily(FontFamily.Calibri));

        CellStyle headerCellStyle = CellStyle(
            fontColorHex: '#EEEEEE',
            horizontalAlign: HorizontalAlign.Center,
            backgroundColorHex: "#217ed9",
            fontFamily: getFontFamily(FontFamily.Calibri));

        var cellA1 = sheetObject.cell(CellIndex.indexByString("A1"));
        cellA1.value = 'No.';
        cellA1.cellStyle = headerCellStyle;

        var cellB1 = sheetObject.cell(CellIndex.indexByString("B1"));
        cellB1.value = 'Texts';
        cellB1.cellStyle = headerCellStyle;

        var cellC1 = sheetObject.cell(CellIndex.indexByString("C1"));
        cellC1.value = 'Tags';
        cellC1.cellStyle = headerCellStyle;

        for (var element in textList) {
          var cellA = sheetObject.cell(
              CellIndex.indexByString("A${textList.indexOf(element) + 2}"));
          cellA.cellStyle = cellStyle;
          var cellB = sheetObject.cell(
              CellIndex.indexByString("B${textList.indexOf(element) + 2}"));
          cellB.cellStyle = cellStyle;
          var cellC = sheetObject.cell(
              CellIndex.indexByString("C${textList.indexOf(element) + 2}"));
          cellC.cellStyle = cellStyle;

          cellA.value = (textList.indexOf(element) + 1).toString();
          cellB.value = (element.title ?? '');
          if (element.tagsList != null && element.tagsList!.isNotEmpty) {
            String tags = '';
            for (var item in element.tagsList!) {
              tags += '${item.title} ';
            }
            cellC.value = tags;
          }
        }
        excel.delete('Sheet1');
        var excelData = excel.encode();
        await FlutterFileSaver().writeFileAsBytes(
          fileName: 'RevAllPro.xlsx',
          bytes: Uint8List.fromList(excelData!),
        );
        CustomModal.showSuccess(context, 'Saved Successfully.');
      }
    } catch (e) {}
  }
}
