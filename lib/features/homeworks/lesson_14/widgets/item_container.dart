import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_14/widgets/custom_text_form_field.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_14/widgets/item_row_container.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_14/widgets/text_widget.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer({
    required this.title,
    required this.isDesc,
    this.controller,
    super.key,
  });

  final String title;
  final bool isDesc;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Container(
      padding: EdgeInsets.only(top: 0, left: 16, right: 16),
      height: isDesc ? 275 : 198,
      width: screenWidth,
      decoration: BoxDecoration(
        color: HexColor('#ffffff'),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.06), offset: Offset(0, 1)),
        ],
      ),
      child: Column(
        spacing: 8,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 12, top: 24, bottom: 8),
              child: TextWidget(
                text: title,
                size: 16,
                weight: FontWeight.w600,
                color: HexColor('#13131e'),
              ),
            ),
          ),
          ItemRowContainer(rowTitle: 'Обслуговування'),
          ItemRowContainer(rowTitle: 'Асортимент'),
          isDesc
              ? CustomTextFormField(
                  controller: controller,
                  labelText: 'Розкажіть докладніше',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Будь-ласка введіть повідомлення';
                    }
                    return null;
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}
