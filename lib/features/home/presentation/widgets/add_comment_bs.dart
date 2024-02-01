import 'package:customer_club/configs/color_palette.dart';
import 'package:customer_club/core/utils/custom_modals.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:customer_club/core/widgets/my_icon_button.dart';
import 'package:customer_club/features/home/data/models/comment_request_model.dart';
import 'package:customer_club/features/home/presentation/blocs/add_comment/add_comment_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class AddCommentBottomSheet extends StatefulWidget {
  final int shopId;
  final void Function() onAdd;
  const AddCommentBottomSheet(
      {super.key, required this.shopId, required this.onAdd});

  @override
  State<AddCommentBottomSheet> createState() => _AddCommentBottomSheetState();
}

class _AddCommentBottomSheetState extends State<AddCommentBottomSheet> {
  int _selectedScore = 0;
  final TextEditingController _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCommentBloc(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyIconButton(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 20,
                        )),
                    Text('نظر شما'),
                    MyIconButton(
                        child: SizedBox(
                      width: 20,
                    )),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'امتیاز',
                      style: TextStyle(fontSize: 12),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6, bottom: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300)),
                      padding: EdgeInsets.fromLTRB(8, 4, 8, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                            5,
                            (index) => _StarItem(
                                index: index + 1,
                                selected: (index + 1) <= _selectedScore,
                                onSelect: () {
                                  setState(() {
                                    _selectedScore = index + 1;
                                  });
                                })),
                      ),
                    ),
                    TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: 'نظر خود را بنویسید',
                        focusedBorder: _border(),
                        border: _border(),
                        enabledBorder: _border(),
                        errorBorder: _border(),
                        disabledBorder: _border(),
                        focusedErrorBorder: _border(),
                      ),
                      maxLength: 300,
                      maxLines: 3,
                    ),
                    16.hsb(),
                    BlocConsumer<AddCommentBloc, AddCommentState>(
                      listener: (context, state) {
                        if (state is AddCommentSuccess) {
                          CustomModal.showSuccess(
                              context, 'نظر شما با موفقیت ثبت شد');
                          widget.onAdd();
                        }
                        if (state is AddCommentError) {
                          CustomModal.showError(context, state.message);
                        }
                      },
                      builder: (context, state) {
                        return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        ColorPalette.primaryColor)),
                                onPressed: () {
                                  if (state is! AddCommentLoading) {
                                    if (_selectedScore < 1) {
                                      CustomModal.showInfo(context,
                                          'ابتدا میزان امتیاز را مشخص کنید');
                                      return;
                                    }
                                    BlocProvider.of<AddCommentBloc>(context)
                                        .add(AddCommentRequestEvent(
                                            requestModel: CommentRequestModel(
                                                comment: _commentController.text
                                                    .trim(),
                                                rating: _selectedScore,
                                                shopId: widget.shopId)));
                                  }
                                },
                                child: state is AddCommentLoading
                                    ? CupertinoActivityIndicator(
                                        color: Colors.white)
                                    : Text('ثبت نظر')));
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ));
  }
}

class _StarItem extends StatelessWidget {
  final int index;
  final bool selected;
  final void Function() onSelect;
  const _StarItem(
      {required this.index, required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MyIconButton(
          onTap: onSelect,
          child: Icon(
            selected ? Icons.star_rate_rounded : Icons.star_border_rounded,
            color: ColorPalette.goldColor,
            size: 36,
          ),
        ),
        Text(
          index.toString().toPersianDigit(),
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
