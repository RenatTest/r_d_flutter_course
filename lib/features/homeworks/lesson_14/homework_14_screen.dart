import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Homework14Screen extends StatefulWidget {
  const Homework14Screen({super.key});

  @override
  State<Homework14Screen> createState() => _Homework14ScreenState();
}

class _Homework14ScreenState extends State<Homework14Screen> {
  final ScrollController _scrollController = ScrollController();
  bool _scrolled = false;

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
        scrolledUnderElevation: 0,
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
          SingleChildScrollView(
            controller: _scrollController,
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
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: List.generate(5, (index) => StarImage()),
                  ),
                ),
                SizedBox(height: 16),
                TextWidget(
                  text: 'Яку оціночку поставите відділам?',
                  size: 18,
                  weight: FontWeight.w600,
                  color: HexColor('#13131e'),
                ),
                SizedBox(height: 16),
                ItemContainer(title: 'Овочі, Фрукти', isDesc: false),
                ItemContainer(title: 'Випічка', isDesc: true),
                ItemContainer(title: 'Лавка традицій', isDesc: true),
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
                    labelText: 'Поділіться загальним враженням',
                  ),
                ),
              ],
            ),
          ),
          Positioned(bottom: 0, child: ButtonContainer()),
        ],
      ),
    );
  }
}

class StarImage extends StatelessWidget {
  const StarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/star.png',
      width: 48,
      height: 48,
      color: HexColor('#ff8200'),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    required this.text,
    required this.size,
    required this.weight,
    required this.color,
    super.key,
  });

  final String text;
  final double size;
  final FontWeight weight;
  final HexColor color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, fontWeight: weight, color: color),
    );
  }
}

class ItemContainer extends StatelessWidget {
  const ItemContainer({required this.title, required this.isDesc, super.key});

  final String title;
  final bool isDesc;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Container(
      padding: EdgeInsets.only(top: 0, left: 16, right: 16),
      height: isDesc ? 270 : 198,
      width: screenWidth,
      decoration: BoxDecoration(
        color: HexColor('#ffffff'),
        borderRadius: BorderRadius.circular(24),
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
              ? CustomTextFormField(labelText: 'Розкажіть докладніше')
              : Container(),
        ],
      ),
    );
  }
}

class ItemRowContainer extends StatelessWidget {
  const ItemRowContainer({required this.rowTitle, super.key});

  final String rowTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: HexColor('#f6f8fd'),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          TextWidget(
            text: rowTitle,
            size: 16,
            weight: FontWeight.w400,
            color: HexColor('#13131e'),
          ),
          Expanded(child: SizedBox(height: 40)),
          Image.asset(
            'assets/images/dislike-not-active.png',
            width: 40,
            height: 40,
          ),
          SizedBox(width: 12),
          Image.asset(
            'assets/images/like-not-active.png',
            width: 40,
            height: 40,
          ),
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({required this.labelText, super.key});

  final String labelText;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: TextFormField(
        controller: _descController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(32, 33, 36, 0.24),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(32, 33, 36, 0.54),
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          labelText: widget.labelText,
          labelStyle: TextStyle(color: Color.fromRGBO(32, 33, 36, 0.54)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Будь-ласка введіть повідомлення';
          }
          return null;
        },
      ),
    );
  }
}

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Container(
      padding: EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 34),
      color: Colors.white,
      height: 94,
      width: screenWidth,
      child: ElevatedButton(
        onPressed: () {
          print('Sended');
        },
        style: ElevatedButton.styleFrom(backgroundColor: HexColor('#1135ba')),
        child: TextWidget(
          text: 'Надіслати',
          size: 16,
          weight: FontWeight.w600,
          color: HexColor('#ffffff'),
        ),
      ),
    );
  }
}
