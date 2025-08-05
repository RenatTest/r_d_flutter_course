import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:r_d_flutter_course/features/app/screens/home_screen.dart';
import 'package:r_d_flutter_course/features/app/screens/page_names.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_13/homework_13_screen.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_14/homework_14_screen.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_15/homework_15_screen.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_16/screens/home_work_16_screen.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_16/screens/home_work_simple_screen.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_16/screens/home_work_simple_screen_with_arguments.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_17/home_work_17_screen_home.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_17/home_work_17_screen_main.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_17/home_work_17_screen_profile.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_17/home_work_17_screen_settings.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_%D1%81ubit/homework_cubit_screen.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_bloc/homework_bloc_screen.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_cubit_auth/homework_cubit_auth.screen.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/screens/base_navigation/base_navigation_section_screen.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/screens/base_navigation/simple_empty_screen.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/screens/base_navigation/simple_screen_with_data.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/screens/base_navigation/simple_screen_with_returning_data.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/screens/named_navigation/named_routes_navigation.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/screens/navigation_main_screen.dart';
import 'package:r_d_flutter_course/features/state_managment/simple_example.dart/simple_state_management_screen.dart';
import 'package:r_d_flutter_course/features/state_managment/state_management_main_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/screens/widgets_first_part_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/screens/widgets_main_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/screens/widgets_second_part_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/screens/widgets_third_part_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/widgets/part1/align_example_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/widgets/part1/buttons_example_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/widgets/part1/center_example_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/widgets/part1/column_example_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/widgets/part1/container_example_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/widgets/part1/expanded_example_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/widgets/part1/padding_example_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/widgets/part1/progress_indicators_example_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/widgets/part1/row_example_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/widgets/part1/scroll_example_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/widgets/part1/sized_box_example_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/widgets/part1/stack_example_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/widgets/part1/text_example_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/widgets/part2/custom_widgets_example_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/widgets/part2/gesture_example_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/widgets/part2/images_example_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/widgets/part2/text_field_example_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/widgets/part2/widget_types_example_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/widgets/part3/example_1.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/widgets/part3/example_2.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/widgets/part3/example_3.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/widgets/part3/example_4.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/widgets/part3/example_5.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: ScreenNames.home,
      builder: (context, state) => const HomeScreen(),
      routes: [
        // Widgets
        GoRoute(
          path: 'widgets',
          name: ScreenNames.widgets,
          builder: (context, state) => const WidgetsScreen(),
          routes: [
            GoRoute(
              path: 'widgets-first-part',
              name: ScreenNames.widgetsFirstPart,
              builder: (context, state) => const WidgetsFirstPartScreen(),
              onExit: (context, state) async {
                final result = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Unsaved changes'),
                    content: const Text(
                      'Do you want to discard changes and leave?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => context.pop(false),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => context.pop(true),
                        child: const Text('Leave'),
                      ),
                    ],
                  ),
                );
                return result ?? false;
              },
              routes: [
                GoRoute(
                  path: 'container',
                  name: ScreenNames.containerExample,
                  builder: (context, state) => const ContainerExampleScreen(),
                ),
                GoRoute(
                  path: 'row',
                  name: ScreenNames.rowExample,
                  builder: (context, state) => const RowExampleScreen(),
                ),
                GoRoute(
                  path: 'column',
                  name: ScreenNames.columnExample,
                  builder: (context, state) => const ColumnExampleScreen(),
                ),
                GoRoute(
                  path: 'expanded',
                  name: ScreenNames.expandedExample,
                  builder: (context, state) => const ExpandedExampleScreen(),
                ),
                GoRoute(
                  path: 'stack',
                  name: ScreenNames.stackExample,
                  builder: (context, state) => const StackExampleScreen(),
                ),
                GoRoute(
                  path: 'sized-box',
                  name: ScreenNames.sizedBoxExample,
                  builder: (context, state) => const SizedBoxExampleScreen(),
                ),
                GoRoute(
                  path: 'padding',
                  name: ScreenNames.paddingExample,
                  builder: (context, state) => const PaddingExampleScreen(),
                ),
                GoRoute(
                  path: 'align',
                  name: ScreenNames.alignExample,
                  builder: (context, state) => const AlignExampleScreen(),
                ),
                GoRoute(
                  path: 'center',
                  name: ScreenNames.centerExample,
                  builder: (context, state) => const CenterExampleScreen(),
                ),
                GoRoute(
                  path: 'text',
                  name: ScreenNames.textExample,
                  builder: (context, state) => const TextExampleScreen(),
                ),
                GoRoute(
                  path: 'buttons',
                  name: ScreenNames.buttonsExample,
                  builder: (context, state) => const ButtonsExampleScreen(),
                ),
                GoRoute(
                  path: 'scroll',
                  name: ScreenNames.scrollExample,
                  builder: (context, state) => const ScrollExampleScreen(),
                ),
                GoRoute(
                  path: 'progress-indicators',
                  name: ScreenNames.progressIndicatorsExample,
                  builder: (context, state) =>
                      const ProgressIndicatorsExampleScreen(),
                ),
              ],
            ),
            GoRoute(
              path: 'widgets-second-part',
              name: ScreenNames.widgetsSecondPart,
              builder: (context, state) => const WidgetsSecondPartScreen(),
              routes: [
                GoRoute(
                  path: 'custom-widgets',
                  name: ScreenNames.customWidgetsExample,
                  builder: (context, state) =>
                      const CustomWidgetsExampleScreen(),
                ),
                GoRoute(
                  path: 'widget-types',
                  name: ScreenNames.widgetTypesExample,
                  builder: (context, state) => const WidgetTypesExampleScreen(),
                ),
                GoRoute(
                  path: 'gesture',
                  name: ScreenNames.gestureExample,
                  builder: (context, state) => const GestureExampleScreen(),
                ),
                GoRoute(
                  path: 'text-field',
                  name: ScreenNames.textFieldExample,
                  builder: (context, state) => const TextFieldExampleScreen(),
                ),
                GoRoute(
                  path: 'images',
                  name: ScreenNames.imagesExample,
                  builder: (context, state) => const ImageExampleScreen(),
                ),
              ],
            ),
            GoRoute(
              path: 'understanding-constraints',
              name: ScreenNames.understandingConstraints,
              builder: (context, state) => const WidgetsThirdPartScreen(),
              routes: [
                GoRoute(
                  path: 'understanding-constraints-example-1',
                  name: ScreenNames.understandingConstraintsExample1,
                  builder: (context, state) =>
                      const UnderstandingConstraintsExample1(),
                ),
                GoRoute(
                  path: 'understanding-constraints-example-2',
                  name: ScreenNames.understandingConstraintsExample2,
                  builder: (context, state) =>
                      const UnderstandingConstraintsExample2(),
                ),
                GoRoute(
                  path: 'understanding-constraints-example-3',
                  name: ScreenNames.understandingConstraintsExample3,
                  builder: (context, state) =>
                      const UnderstandingConstraintsExample3(),
                ),
                GoRoute(
                  path: 'understanding-constraints-example-4',
                  name: ScreenNames.understandingConstraintsExample4,
                  builder: (context, state) =>
                      const UnderstandingConstraintsExample4(),
                ),
                GoRoute(
                  path: 'understanding-constraints-example-5',
                  name: ScreenNames.understandingConstraintsExample5,
                  builder: (context, state) =>
                      const UnderstandingConstraintsExample5(),
                ),
              ],
            ),
            GoRoute(
              path: 'homework-13',
              name: ScreenNames.homework13,
              builder: (context, state) => const Homework13Screen(),
            ),
            GoRoute(
              path: 'homework-14',
              name: ScreenNames.homework14,
              builder: (context, state) => const Homework14Screen(),
            ),
            GoRoute(
              path: 'homework-15',
              name: ScreenNames.homework15,
              builder: (context, state) => const Homework15Screen(),
            ),
          ],
        ),
        // Navigation
        GoRoute(
          path: 'navigation',
          name: ScreenNames.navigation,
          builder: (context, state) => const NavigationMainScreen(),
          routes: <RouteBase>[
            GoRoute(
              path: 'base-navigation',
              name: ScreenNames.baseNavigation,
              builder: (context, state) => const BaseNavigationSectionScreen(),
              routes: [
                GoRoute(
                  path: 'simple-empty',
                  name: ScreenNames.simpleEmptyScreen,
                  builder: (context, state) => const SimpleEmptyScreen(),
                ),
                GoRoute(
                  path: 'simple-empty-with-custom-transition',
                  name: ScreenNames.simpleEmptyScreenWithCustomTransition,
                  pageBuilder: (context, state) {
                    return CustomTransitionPage(
                      child: const SimpleEmptyScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            // return RotationTransition(
                            //   turns: animation,
                            //   child: child,
                            // );
                            // return FadeTransition(
                            //   opacity: animation,
                            //   child: child,
                            // );
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 1),
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            );
                          },
                    );
                  },
                ),
                GoRoute(
                  path: 'simple-with-data',
                  name: ScreenNames.simpleTransitionWithArguments,
                  builder: (context, state) => SimpleScreenWithData(
                    id: state.uri.queryParameters['id'] ?? '',
                  ),
                ),
                GoRoute(
                  path: 'simple-with-returning-data',
                  name: ScreenNames.simpleScreenWithReturningData,
                  builder: (context, state) => SimpleScreenWithReturningData(
                    guestName: state.uri.queryParameters['guestName'] ?? '',
                  ),
                ),
              ],
            ),
            GoRoute(
              path: 'named-routes',
              name: ScreenNames.namedRoutesNavigation,
              builder: (context, state) => const NamedRoutesNavigationScreen(),
              routes: [
                GoRoute(
                  path: 'simple-empty',
                  builder: (context, state) => const SimpleEmptyScreen(),
                ),
                GoRoute(
                  path: 'simple-with-data/:id',
                  builder: (context, state) => SimpleScreenWithData(
                    id: state.pathParameters['id'] ?? '',
                  ),
                ),
              ],
            ),
            GoRoute(
              path: 'homework-16',
              name: ScreenNames.homework16,
              builder: (context, state) => const HomeWork16Screen(),
              routes: [
                GoRoute(
                  path: 'home-work-simple-screen',
                  name: ScreenNames.homeworkSimpleScreen,
                  builder: (context, state) => HomeWorkSimpleScreen(),
                ),
                GoRoute(
                  path: 'home-work-simple-screen-with-arguments',
                  name: ScreenNames.homeworkSimpleScreenWithArguments,
                  builder: (context, state) {
                    final name = state.uri.queryParameters['name'] ?? 'User';
                    final age = state.uri.queryParameters['age'] ?? 'No set';
                    final proffesion =
                        state.uri.queryParameters['proffesion'] ??
                        'No proffesion';
                    final salary =
                        state.uri.queryParameters['salary'] ?? 'No salary';

                    return HomeWorkSimpleScreenWithArguments(
                      name: name,
                      age: age,
                      proffesion: proffesion,
                      salary: salary,
                    );
                  },
                ),
              ],
            ),
            ShellRoute(
              builder: (context, state, child) {
                return HomeWork17ScreenMain(child: child);
              },
              routes: [
                GoRoute(
                  path: 'home',
                  pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    child: const HomeWork17ScreenHome(),
                  ),
                ),
                GoRoute(
                  path: 'profile',
                  pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    child: const HomeWork17ScreenProfile(),
                  ),
                ),
                GoRoute(
                  path: 'settings',
                  pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    child: const HomeWork17ScreenSettings(),
                  ),
                ),
              ],
            ),
          ],
        ),
        // State Management routes
        GoRoute(
          path: 'state-management',
          name: ScreenNames.stateManagement,
          builder: (context, state) => const StateManagementMainScreen(),
          routes: [
            GoRoute(
              path: 'simple-state-management',
              name: ScreenNames.simpleStateManagement,
              builder: (context, state) => const SimpleStateManagementScreen(),
            ),
            GoRoute(
              path: 'homework-19-cubit',
              name: ScreenNames.homework19Cubit,
              builder: (context, state) => const HomeworkCubitScreen(),
            ),
            GoRoute(
              path: 'homework-19-bloc',
              name: ScreenNames.homework19Bloc,
              builder: (context, state) => const HomeworkBlocScreen(),
            ),
            GoRoute(
              path: 'homework-19-auth-cubit',
              name: ScreenNames.homework19AuthCubit,
              builder: (context, state) => const HomeworkCubitAuthScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
