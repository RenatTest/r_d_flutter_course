import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_d_flutter_course/features/alerts_info/check_my_region/presentation/cubit/check_my_region_cubit.dart';
import 'package:r_d_flutter_course/features/alerts_info/check_my_region/presentation/cubit/check_my_region_state.dart';

const regions = [
  'Автономна Республіка Крим',
  'Волинська область',
  'Вінницька область',
  'Дніпропетровська область',
  'Донецька область',
  'Житомирська область',
  'Закарпатська область',
  'Запорізька область',
  'Івано-Франківська область',
  'м. Київ',
  'Київська область',
  'Кіровоградська область',
  'Луганська область',
  'Львівська область',
  'Миколаївська область',
  'Одеська область',
  'Полтавська область',
  'Рівненська область',
  'м. Севастополь',
  'Сумська область',
  'Тернопільська область',
  'Харківська область',
  'Херсонська область',
  'Хмельницька область',
  'Черкаська область',
  'Чернівецька область',
  'Чернігівська область',
];

class CheckMyRegionScreen extends StatefulWidget {
  const CheckMyRegionScreen({super.key});

  @override
  State<CheckMyRegionScreen> createState() => _CheckMyRegionScreenState();
}

class _CheckMyRegionScreenState extends State<CheckMyRegionScreen> {
  String selectedRegion = regions.first;
  int index = regions.indexOf('Автономна Республіка Крим');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check My Region'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: BlocBuilder<CheckMyRegionCubit, CheckMyRegionState>(
          builder: (context, state) {
            final alertData =
                state.regionsAlerts?.regionsAlerts.toString()[index + 1] ??
                'Немає даних';
            String alertMessage;
            Color alertColor;
            if (alertData == 'A') {
              alertMessage = 'Повітряна тривога активна в усій області';
              alertColor = Colors.red;
            } else if (alertData == 'P') {
              alertMessage = 'Часткова тривога в районах чи громадах';
              alertColor = Colors.deepOrangeAccent;
            } else {
              alertMessage = 'Немає інформації про повітряну тривогу';
              alertColor = Colors.green;
            }

            return switch (state.status) {
              // Initial state
              CheckMyRegionStatus.initial => const Center(
                child: Text('Alerts Regions', style: TextStyle(fontSize: 24)),
              ),

              // Loading state
              CheckMyRegionStatus.loading => const Center(
                child: CircularProgressIndicator(),
              ),

              // Loaded state
              CheckMyRegionStatus.loaded => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Text(
                      'Мій регіон:',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropdownButton<String>(
                      hint: const Text('Оберіть регіон'),
                      value: selectedRegion,
                      items: regions.map((String region) {
                        return DropdownMenuItem<String>(
                          value: region,
                          child: Text(region),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            selectedRegion = value;
                            index = regions.indexOf(selectedRegion);
                          });
                        }
                      },
                    ),

                    Text(
                      alertMessage,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: alertColor,
                      ),
                    ),
                  ],
                ),
              ),

              // Error state
              CheckMyRegionStatus.error => Center(
                child: Text(
                  state.errorMessage ?? 'Error',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            };
          },
        ),
      ),
    );
  }
}
