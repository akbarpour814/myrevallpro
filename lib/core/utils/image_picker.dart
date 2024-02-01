import 'dart:io';
import 'package:customer_club/configs/color_palette.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

imagePicker(BuildContext context, TapDownDetails details,
    {required void Function(File? file) onPick, bool isAlreadyPicked = false}) {
  final renderObject = context.findRenderObject();
  final translation = renderObject?.getTransformTo(null).getTranslation();
  if (translation != null && renderObject?.paintBounds != null) {
    var rect = renderObject!.paintBounds.shift(details.globalPosition);
    showMenu(
      context: context,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: ColorPalette.primaryColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      position:
          RelativeRect.fromLTRB(rect.left, rect.top, rect.right, rect.bottom),
      items: [
        PopupMenuItem<int>(
            onTap: () async {
              final ImagePicker picker = ImagePicker();
              XFile? xfile =
                  await picker.pickImage(source: ImageSource.gallery);
              if (xfile != null) {
                onPick((await (await File(xfile.path).cropImage())
                    .compressImage()));
              }
            },
            value: 0,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'انتخاب از گالری',
                  style: TextStyle(),
                ),
              ],
            )),
        PopupMenuItem<int>(
          onTap: () async {
            final ImagePicker picker = ImagePicker();
            XFile? xfile = await picker.pickImage(source: ImageSource.camera);
            if (xfile != null) {
              onPick(
                  (await (await File(xfile.path).cropImage()).compressImage()));
            }
          },
          value: 1,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'انتخاب از دوربین',
                style: TextStyle(),
              ),
            ],
          ),
        ),
        // if (isAlreadyPicked)
        //   PopupMenuItem<int>(
        //     onTap: (() {
        //       onPick(null);
        //     }),
        //     value: 1,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.end,
        //       children: [
        //         Text(
        //           'حذف تصویر',
        //           style: TextStyle(
        //             color: Colors.red.shade700,
        //           ),
        //         ),
        //       ],
        //     ),
        //   )
      ],
    );
  }
}
