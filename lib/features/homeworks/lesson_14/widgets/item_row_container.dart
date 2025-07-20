import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_14/widgets/text_widget.dart';

class ItemRowContainer extends StatefulWidget {
  const ItemRowContainer({required this.rowTitle, super.key});

  final String rowTitle;

  @override
  State<ItemRowContainer> createState() => _ItemRowContainerState();
}

class _ItemRowContainerState extends State<ItemRowContainer> {
  bool isLikePushed = false;
  bool isDislikePushed = false;

  void _addLike() {
    setState(() {
      isLikePushed = !isLikePushed;
      if (isLikePushed) {
        isDislikePushed = false;
      }
    });
  }

  void _addDislike() {
    setState(() {
      isDislikePushed = !isDislikePushed;
      if (isDislikePushed) {
        isLikePushed = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: HexColor('#f6f8fd'),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color.fromRGBO(19, 19, 30, 0.04), width: 1),
      ),
      child: Row(
        children: [
          TextWidget(
            text: widget.rowTitle,
            size: 16,
            weight: FontWeight.w400,
            color: HexColor('#13131e'),
          ),
          Expanded(child: SizedBox(height: 40)),
          GestureDetector(
            onTap: _addDislike,
            child: Image.asset(
              isDislikePushed
                  ? 'assets/images/dislike-active.png'
                  : 'assets/images/dislike-not-active.png',
              width: 40,
              height: 40,
            ),
          ),
          SizedBox(width: 12),
          GestureDetector(
            onTap: _addLike,
            child: Image.asset(
              isLikePushed
                  ? 'assets/images/like-active.png'
                  : 'assets/images/like-not-active.png',
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }
}
