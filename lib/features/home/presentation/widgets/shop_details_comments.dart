import 'package:customer_club/configs/color_palette.dart';
import 'package:customer_club/core/widgets/my_loading.dart';
import 'package:customer_club/features/home/presentation/blocs/get_shop_rating/get_shop_rating_bloc.dart';
import 'package:customer_club/features/home/presentation/screens/main_screen.dart';
import 'package:customer_club/features/home/presentation/widgets/add_comment_bs.dart';
import 'package:customer_club/features/home/presentation/widgets/comment_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopDetailsComments extends StatefulWidget {
  final int shopId;
  final bool canAddComment;
  final void Function()? onCommentAdd;
  const ShopDetailsComments(
      {super.key,
      required this.shopId,
      required this.canAddComment,
      this.onCommentAdd});

  @override
  State<ShopDetailsComments> createState() => _ShopDetailsCommentsState();
}

class _ShopDetailsCommentsState extends State<ShopDetailsComments>
    with TickerProviderStateMixin {
  AnimationController? _bsController;
  bool _commentAdded = false;

  @override
  void initState() {
    super.initState();
    _bsController = BottomSheet.createAnimationController(this);
    _bsController?.duration = const Duration(milliseconds: 600);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4, left: 4, right: 4),
      padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      child: Column(
        children: [
          if (widget.canAddComment && !_commentAdded) ...[
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(ColorPalette.primaryColor)),
                onPressed: () {
                  showModalBottomSheet(
                      context: MainScreen.scaffoldKey.currentContext!,
                      isScrollControlled: true,
                      transitionAnimationController: _bsController,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16))),
                      builder: (ctx) => AddCommentBottomSheet(
                            shopId: widget.shopId,
                            onAdd: () {
                              if (widget.onCommentAdd != null) {
                                widget.onCommentAdd!();
                              } else {
                                setState(() {
                                  _commentAdded = true;
                                });
                                BlocProvider.of<GetShopRatingBloc>(context).add(
                                    GetShopRatingStartEvent(
                                        shopId: widget.shopId));
                                Navigator.pop(ctx);
                              }
                            },
                          ));
                },
                child: Text('نظر خود را از تجربه خرید عنوان کنید')),
            Divider(),
          ],
          Expanded(
            child: BlocBuilder<GetShopRatingBloc, GetShopRatingState>(
              builder: (context, state) {
                return state is GetShopRatingLoaded &&
                        state.commentList.isNotEmpty
                    ? ListView(
                        padding: EdgeInsets.only(bottom: 140),
                        physics: BouncingScrollPhysics(),
                        children: state.commentList
                            .map((e) => CommentItem(
                                  comment: e,
                                ))
                            .toList(),
                      )
                    : state is GetShopRatingLoading
                        ? Center(
                            child: MyLoading(),
                          )
                        : Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                'برای این فروشگاه تاکنون نظری ثبت نشده است',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
              },
            ),
          ),
        ],
      ),
    );
  }
}
