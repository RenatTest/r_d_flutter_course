// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_d_flutter_course/features/alerts_info/active_alerts_regions/presentation/cubit/active_alerts_regions_cubit.dart';
import 'package:r_d_flutter_course/features/alerts_info/active_alerts_regions/presentation/cubit/active_alerts_regions_state.dart';

class ActiveAlertsRegionsScreen extends StatelessWidget {
  const ActiveAlertsRegionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Active Alerts Regions'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: BlocBuilder<ActiveAlertsRegionsCubit, ActiveAlertsRegionsState>(
          builder: (context, state) {
            return switch (state.status) {
              // Initial state
              ActiveAlertsRegionsStatus.initial => const Center(
                child: Text(
                  'Active Alerts Regions',
                  style: TextStyle(fontSize: 24),
                ),
              ),

              // Loading state
              ActiveAlertsRegionsStatus.loading => const Center(
                child: CircularProgressIndicator(),
              ),

              // Loaded state
              ActiveAlertsRegionsStatus.loaded => Center(
                child: Column(
                  spacing: 10,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      'Cписок регіонів в яких оголошена\nповітряна тривога',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state
                            .activeAlertsRegions
                            ?.activeAlertsRegionsList
                            ?.length,
                        itemBuilder: (context, index) {
                          final dateTime = state
                              .activeAlertsRegions
                              ?.activeAlertsRegionsList?[index]['alertStarted']
                              .toString();

                          final region =
                              state
                                  .activeAlertsRegions
                                  ?.activeAlertsRegionsList?[index]['region']
                                  .toString() ??
                              'область';

                          final district =
                              state
                                  .activeAlertsRegions
                                  ?.activeAlertsRegionsList?[index]['district']
                                  .toString() ??
                              'район';

                          return Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              title: Text(region),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 10,
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    district == region
                                        ? 'вся область'
                                        : district,
                                  ),
                                  Text(
                                    'Початок тривоги: ${dateTime?.substring(0, dateTime.length - 5) ?? '2022-02-24 5:00:00'}',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Error state
              ActiveAlertsRegionsStatus.error => Center(
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
