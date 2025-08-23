import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_14/widgets/text_widget.dart';

class ItemRowContainer extends StatefulWidget {
  const ItemRowContainer({
    required this.rowTitle,
    this.onFeedbackChanged,
    super.key,
  });

  final String rowTitle;
  final void Function(String feedback)? onFeedbackChanged;

  @override
  State<ItemRowContainer> createState() => _ItemRowContainerState();
}

class _ItemRowContainerState extends State<ItemRowContainer>
    with TickerProviderStateMixin {
  late final AnimationController _likeController;
  late final AnimationController _dislikeController;

  late final Animation<double> _likeRotation;
  late final Animation<double> _dislikeRotation;

  bool isLikePushed = false;
  bool isDislikePushed = false;
  String feedBack = 'Не вибрано';

  void _addLike() {
    setState(() {
      isLikePushed = !isLikePushed;
      if (isLikePushed) {
        isDislikePushed = false;
        feedBack = 'Добре';
      } else {
        feedBack = 'Не вибрано';
      }
    });
    widget.onFeedbackChanged?.call(feedBack);
  }

  void _addDislike() {
    setState(() {
      isDislikePushed = !isDislikePushed;
      if (isDislikePushed) {
        isLikePushed = false;
        feedBack = 'Погано';
      } else {
        feedBack = 'Не вибрано';
      }
    });
    widget.onFeedbackChanged?.call(feedBack);
  }

  @override
  void initState() {
    _likeController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _dislikeController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _likeRotation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0.0, end: 0.5), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 0.5, end: 1.0), weight: 1),
    ]).animate(_likeController);

    _dislikeRotation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 1.0, end: 0.5), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 0.5, end: 0.0), weight: 1),
    ]).animate(_dislikeController);
    super.initState();
  }

  @override
  void dispose() {
    _likeController.dispose();
    _dislikeController.dispose();
    super.dispose();
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
            onTap: () {
              _addDislike();
              _dislikeController.forward(from: 0);
            },
            child: RotationTransition(
              turns: _dislikeRotation,
              child: Image.asset(
                isDislikePushed
                    ? 'assets/images/dislike-active.png'
                    : 'assets/images/dislike-not-active.png',
                width: 40,
                height: 40,
              ),
            ),
          ),
          SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              _addLike();
              _likeController.forward(from: 0);
            },
            child: RotationTransition(
              turns: _likeRotation,
              child: Image.asset(
                isLikePushed
                    ? 'assets/images/like-active.png'
                    : 'assets/images/like-not-active.png',
                width: 40,
                height: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
