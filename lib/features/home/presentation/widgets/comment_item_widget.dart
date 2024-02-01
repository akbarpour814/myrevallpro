import 'package:cached_network_image/cached_network_image.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:customer_club/features/home/data/models/comment_model.dart';
import 'package:customer_club/features/home/presentation/widgets/star_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class CommentItem extends StatelessWidget {
  final CommentModel comment;
  const CommentItem({
    super.key,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.grey.shade100),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: 36.whsb(
                        child: CachedNetworkImage(
                      imageUrl: comment.userImg ?? '',
                      fit: BoxFit.cover,
                      errorWidget: (_, __, ___) => Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            CupertinoIcons.person,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )),
                  ),
                  8.wsb(),
                  Text(
                    comment.userFamily ?? 'بدون نام',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (comment.created.isNotNullOrEmpty)
                    Text(
                      DateTime.parse(comment.created!)
                          .toPersianDateStr(strMonth: false, seprator: ' /'),
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  4.hsb(),
                  StarWidget(
                    star: comment.rating ?? 1,
                    secondColor: true,
                    size: 12,
                  )
                ],
              )
            ],
          ),
          if (comment.comment.isNotNullOrEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      comment.comment!,
                      textAlign: TextAlign.justify,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
