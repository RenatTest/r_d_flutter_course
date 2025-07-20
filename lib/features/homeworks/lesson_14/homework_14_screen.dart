import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_14/widgets/custom_text_form_field.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_14/widgets/item_container.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_14/widgets/my_button.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_14/widgets/star_image.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_14/widgets/text_widget.dart';

class Homework14Screen extends StatefulWidget {
  const Homework14Screen({super.key});

  @override
  State<Homework14Screen> createState() => _Homework14ScreenState();
}

class _Homework14ScreenState extends State<Homework14Screen> {
  final _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  bool _scrolled = false;
  final _focus = FocusNode();
  final TextEditingController _textController1 = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();
  final TextEditingController _generalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 5 && !_scrolled) {
        setState(() => _scrolled = true);
      } else if (_scrollController.offset <= 5 && _scrolled) {
        setState(() => _scrolled = false);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: HexColor('#eef2fc'),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _scrolled
                  ? [HexColor('#f8d9a0'), HexColor('#FFFFFF')]
                  : [HexColor('#FFFFFF'), HexColor('#FFFFFF')],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        title: Row(
          spacing: 16,
          children: [
            GestureDetector(
              onTap: Navigator.of(context).pop,
              child: Image.asset(
                'assets/images/arrow-back.png',
                width: 9,
                height: 16,
                color: Color.fromRGBO(32, 33, 36, 0.72),
              ),
            ),
            TextWidget(
              text: 'Оцінка візиту до магазину',
              size: 20,
              weight: FontWeight.w600,
              color: HexColor('#202124'),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusScope.of(context).requestFocus(_focus);
            },
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: HexColor('#ffffff'),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.06),
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: StarImage(),
                    ),
                    SizedBox(height: 16),
                    TextWidget(
                      text: 'Яку оціночку поставите відділам?',
                      size: 18,
                      weight: FontWeight.w600,
                      color: HexColor('#13131e'),
                    ),
                    SizedBox(height: 11),
                    ItemContainer(title: 'Овочі, Фрукти', isDesc: false),
                    ItemContainer(
                      title: 'Випічка',
                      isDesc: true,
                      controller: _textController1,
                    ),
                    ItemContainer(
                      title: 'Лавка традицій',
                      isDesc: true,
                      controller: _textController2,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 16, left: 16),
                        child: TextWidget(
                          text: 'Є що додати?',
                          size: 18,
                          weight: FontWeight.w600,
                          color: HexColor('#202124'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: CustomTextFormField(
                        controller: _generalController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Будь-ласка введіть повідомлення';
                          }
                          return null;
                        },
                        labelText: 'Поділіться загальним враженням',
                      ),
                    ),
                    SizedBox(height: 94),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                top: 12,
                left: 16,
                right: 16,
                bottom: 34,
              ),
              color: Colors.white,
              height: 94,
              width: screenWidth,
              child: MyButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    final value1 = _textController1.text;
                    final value2 = _textController2.text;
                    final valueGeneral = _generalController.text;
                    print('Про випічку: $value1');
                    print('Про лавку традицій: $value2');
                    print('Поділіться загальним враженням: $valueGeneral');
                    FocusScope.of(context).requestFocus(_focus);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Відправлено!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
