// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter/material.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/widgets/navigation_button.dart';

class HomeWorkNavigationMainScreen extends StatelessWidget {
  const HomeWorkNavigationMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home work navigation main screen')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          NavigationButton(
            title: 'Simple transition to new screen',
            onTap: () {
              Navigator.pushNamed(context, '/home_work_simple_screen');
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(builder: (context) => HomeScreen()),
              //   (Route<dynamic> route) => false, // Видаляє всі попередні
              // );
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => HomeScreen()),
              // );
            },
          ),
          NavigationButton(
            title: 'Simple transition to new screen with data',
            onTap: () {
              Navigator.pushNamed(
                context,
                '/home_work_simple_screen_with_arguments',
                arguments: Arguments(
                  name: 'Renat',
                  age: 39,
                  profession: 'Flutter dev',
                  salary: 7000,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Arguments {
  Arguments({
    required this.name,
    required this.age,
    required this.profession,
    required this.salary,
  });

  final String name;
  final int age;
  final String profession;
  final double salary;
}

// 🔹 pushAndRemoveUntil()
// Що робить: Додає новий маршрут (екран), а потім видаляє попередні маршрути, 
// поки не буде виконана умова.

// Navigator.pushAndRemoveUntil(
//   context,
//   MaterialPageRoute(builder: (context) => HomeScreen()),
//   (Route<dynamic> route) => false, // Видаляє всі попередні
// );
// 📌 Приклад: використовується при виході з логіну, коли не хочемо, 
// щоб користувач міг повернутися на сторінку входу.

// 🔹 pushReplacement()
// Що робить: Заміщує поточний маршрут новим. Немає можливості повернутись назад

// Navigator.pushReplacement(
//   context,
//   MaterialPageRoute(builder: (context) => Dashboard()),
// );
// 📌 Використовується при завершенні реєстрації або логіну — 
// поточний екран вже не потрібен.

// 🔹 replace()
// Що робить: Замінює вказаний маршрут на новий. Не обов’язково той, 
// що на вершині стеку.

// Navigator.of(context).replace(
//   oldRoute: oldRoute,
//   newRoute: MaterialPageRoute(builder: (_) => NewScreen()),
// );
// 📌 Це рідше використовується, але дуже корисне при складному керуванні стеком

// 🔹 replaceRouteBelow()
// Що робить: Замінює маршрут, який знаходиться під заданим у стеку.

// Navigator.of(context).replaceRouteBelow(
//   anchorRoute: someRoute,
//   newRoute: MaterialPageRoute(builder: (_) => NewScreen()),
// );
// 📌 Важливо при вкладеній навігації або глибоких переходах, коли треба  
// оновити історію навігації без видимого переходу.

// 🔹 popUntil()
// Що робить: Закриває маршрути до тих пір, поки не буде знайдений маршрут, 
// який задовольняє умову.

// Navigator.popUntil(context, ModalRoute.withName('/home'));
// 📌 Добре для повернення до головного екрана, незалежно від глибини стеку.

// 🔹 removeRoute()
// Що робить: Видаляє конкретний маршрут зі стеку, без анімації чи переходу.

// Navigator.of(context).removeRoute(someRoute);
// 📌 Можна використовувати для очищення історії або контролю доступу.

// 🔹 removeRouteBelow()
// Що робить: Видаляє маршрут, що знаходиться під вказаним.

// Navigator.of(context).removeRouteBelow(someRoute);
// 📌 Приклад: коли хочете замінити або видалити попередній крок 
// без зміни поточного екрана.

// 🔹 restorablePush()
// Що робить: Додає маршрут, з можливістю відновлення навігаційного стану 
// після перезапуску програми.

// Navigator.restorablePush(
//   context,
//   (context, arguments) => MaterialPageRoute(
//     builder: (_) => SomeRestorableScreen(),
//   ),
// );
// 📌 Використовується для State Restoration — підтримки навігації 
// після закриття/перезапуску додатку (особливо на Android) //
