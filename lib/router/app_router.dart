import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:r_d_flutter_course/core/network/news_api_course/fake/news_api_fake.dart';
import 'package:r_d_flutter_course/di/di.dart';
import 'package:r_d_flutter_course/features/alerts_info/active_alerts_regions/presentation/ui/screens/active_alerts_regions_screen.dart';
import 'package:r_d_flutter_course/features/alerts_info/alerts_info_screen.dart';
import 'package:r_d_flutter_course/features/alerts_info/check_my_region/presentation/ui/screens/check_my_region_screen.dart';
import 'package:r_d_flutter_course/features/animations/presentation/explicit_animations/examples/animated_buider.dart';
import 'package:r_d_flutter_course/features/animations/presentation/explicit_animations/examples/animation_controller.dart';
import 'package:r_d_flutter_course/features/animations/presentation/explicit_animations/examples/build_in_transitions.dart';
import 'package:r_d_flutter_course/features/animations/presentation/explicit_animations/examples/tweens_and_animations.dart';
import 'package:r_d_flutter_course/features/animations/presentation/explicit_animations/explicit_animations_screen.dart';
import 'package:r_d_flutter_course/features/animations/presentation/implicit_animations/animated_box_playground.dart';
import 'package:r_d_flutter_course/features/animations/presentation/implicit_animations/examples/animated_align_example.dart';
import 'package:r_d_flutter_course/features/animations/presentation/implicit_animations/examples/animated_container_example.dart';
import 'package:r_d_flutter_course/features/animations/presentation/implicit_animations/examples/animated_opacity_example.dart';
import 'package:r_d_flutter_course/features/animations/presentation/implicit_animations/examples/animated_padding_example.dart';
import 'package:r_d_flutter_course/features/animations/presentation/implicit_animations/examples/animated_positioned_example.dart';
import 'package:r_d_flutter_course/features/animations/presentation/implicit_animations/examples/animated_switcher_example.dart';
import 'package:r_d_flutter_course/features/animations/presentation/implicit_animations/examples/tween_animation_builder_example.dart';
import 'package:r_d_flutter_course/features/animations/presentation/implicit_animations/implicit_animations_screen.dart';
import 'package:r_d_flutter_course/features/animations/presentation/screens/animations_main_screen.dart';
import 'package:r_d_flutter_course/features/app/internet_connection/internet_connection_cubit.dart';
import 'package:r_d_flutter_course/features/app/screens/home_screen.dart';
import 'package:r_d_flutter_course/features/app/screens/page_names.dart';
import 'package:r_d_flutter_course/features/architecture/data/repository/news_repository.dart';
import 'package:r_d_flutter_course/features/architecture/presentation/cubit/news_cubit.dart';
import 'package:r_d_flutter_course/features/architecture/presentation/ui/screens/architecture_main_screen.dart';
import 'package:r_d_flutter_course/features/architecture/presentation/ui/screens/news_page.dart';
import 'package:r_d_flutter_course/features/error_handling/data/repository/products_repository.dart';
import 'package:r_d_flutter_course/features/error_handling/presentation/cubit/products_cubit.dart';
import 'package:r_d_flutter_course/features/error_handling/presentation/ui/screens/error_handling_main_screen.dart';
import 'package:r_d_flutter_course/features/error_handling/presentation/ui/screens/products_page_example.dart';
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
import 'package:r_d_flutter_course/features/homeworks/lesson_20_rate_app_feature/bloc/rate_app_bloc.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_20_rate_app_feature/cubit/rate_app_cubit.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_20_rate_app_feature/presentation/screens/rate_app_screen_bloc.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_20_rate_app_feature/presentation/screens/rate_app_screen_cubit.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_20_rate_app_feature/presentation/screens/rate_app_screen_provider.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_20_rate_app_feature/provider/rate_app_provider.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_21/animation_cubit_screen.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_21/cubit/animation_cubit.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_22_explicit_animations/homework_animations_screen.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_22_explicit_animations/homework_animations_screen2.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_23_error_handling_homework/data/repository/fake_user_repository.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_23_error_handling_homework/presentation/cubit/user_profile_cubit.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_23_error_handling_homework/presentation/ui/screens/user_profile_homework_screen.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/screens/base_navigation/base_navigation_section_screen.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/screens/base_navigation/simple_empty_screen.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/screens/base_navigation/simple_screen_with_data.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/screens/base_navigation/simple_screen_with_returning_data.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/screens/named_navigation/named_routes_navigation.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/screens/navigation_main_screen.dart';
import 'package:r_d_flutter_course/features/rest_api/presentation/decoding_example_screen.dart';
import 'package:r_d_flutter_course/features/rest_api/presentation/rest_api_base_screen.dart';
import 'package:r_d_flutter_course/features/rest_api_homework/data/repository/cheque_repository.dart';
import 'package:r_d_flutter_course/features/rest_api_homework/presentation/cubit/cheque_cubit.dart';
import 'package:r_d_flutter_course/features/rest_api_homework/presentation/ui/screens/cheque_main_screen.dart';
import 'package:r_d_flutter_course/features/rest_api_homework/presentation/ui/screens/cheque_page.dart';
import 'package:r_d_flutter_course/features/state_managment/common_mistakes_screen.dart';
import 'package:r_d_flutter_course/features/state_managment/experiment_bloc/experiment_bloc_screen.dart';
import 'package:r_d_flutter_course/features/state_managment/simple_example.dart/simple_state_management_screen.dart';
import 'package:r_d_flutter_course/features/state_managment/state_management_main_screen.dart';
import 'package:r_d_flutter_course/features/top_news/data/data_source/top_news_data_source.dart';
import 'package:r_d_flutter_course/features/top_news/data/repository/news_repository.dart';
import 'package:r_d_flutter_course/features/top_news/presentation/bloc/news_cubit.dart';
import 'package:r_d_flutter_course/features/top_news/presentation/ui/top_news_screen.dart';
import 'package:r_d_flutter_course/features/top_news/presentation/ui/web_view_article.dart';
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

SnackBar _createSnackBar(BuildContext context) {
  return SnackBar(
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Немає інтернету', style: const TextStyle(fontSize: 16)),
            IconButton(
              onPressed: () =>
                  ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              icon: Icon(Icons.close, color: Colors.white),
            ),
          ],
        ),
        Text(
          "Будь-ласка перевірте ваше інтернет з'єднання",
          style: const TextStyle(fontSize: 16),
        ),
      ],
    ),
    behavior: SnackBarBehavior.fixed,
    duration: const Duration(hours: 1),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    dismissDirection: DismissDirection.none,
  );
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: ScreenNames.home,
      builder: (context, state) =>
          BlocListener<InternetConnectionCubit, InternetState>(
            listenWhen: (previous, current) =>
                previous.hasInternet != current.hasInternet ||
                previous.connectionType != current.connectionType,
            listener: (context, state) {
              if (state.connectionType == ConnectivityResult.none &&
                  !state.hasInternet) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(_createSnackBar(context));
              }
              if (state.hasInternet) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              }
            },
            child: const HomeScreen(),
          ),
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
            GoRoute(
              path: 'experiment-bloc',
              name: ScreenNames.experimentBloc,
              builder: (context, state) => const ExperimentBlocScreen(),
            ),
            GoRoute(
              path: 'common-mistakes',
              name: ScreenNames.commonMistakes,
              builder: (context, state) => const CommonMistakesScreen(),
            ),
            GoRoute(
              path: 'homework-20-cubit',
              name: ScreenNames.homework20Cubit,
              builder: (context, state) => BlocProvider(
                create: (context) => RateAppCubit(),
                child: const RateAppScreenCubit(),
              ),
            ),
            GoRoute(
              path: 'homework-20-bloc',
              name: ScreenNames.homework20Bloc,
              builder: (context, state) => BlocProvider(
                create: (context) => RateAppBloc(),
                child: const RateAppScreenBloc(),
              ),
            ),
            GoRoute(
              path: 'homework-20-provider',
              name: ScreenNames.homework20Provider,
              builder: (context, state) => ChangeNotifierProvider(
                create: (context) => RateAppProvider(0),
                child: const RateAppScreenProvider(),
              ),
            ),
          ],
        ),
        // Animations routes
        GoRoute(
          path: 'animations',
          name: ScreenNames.animations,
          builder: (context, state) => const AnimationsMainScreen(),
          routes: [
            GoRoute(
              path: 'implicit-animations',
              name: ScreenNames.implicitAnimations,
              builder: (context, state) => const ImplicitAnimationsScreen(),
              routes: [
                GoRoute(
                  path: 'animated-container-example',
                  name: ScreenNames.animatedContainerExample,
                  builder: (context, state) => const AnimatedContainerExample(),
                ),
                GoRoute(
                  path: 'animated-opacity-example',
                  name: ScreenNames.animatedOpacityExample,
                  builder: (context, state) => const AnimatedOpacityExample(),
                ),
                GoRoute(
                  path: 'animated-align-example',
                  name: ScreenNames.animatedAlignExample,
                  builder: (context, state) => const AnimatedAlignExample(),
                ),
                GoRoute(
                  path: 'animated-padding-example',
                  name: ScreenNames.animatedPaddingExample,
                  builder: (context, state) => const AnimatedPaddingExample(),
                ),
                GoRoute(
                  path: 'animated-positioned-example',
                  name: ScreenNames.animatedPositionedExample,
                  builder: (context, state) =>
                      const AnimatedPositionedExample(),
                ),
                GoRoute(
                  path: 'animated-switcher-example',
                  name: ScreenNames.animatedSwitcherExample,
                  builder: (context, state) => const AnimatedSwitcherExample(),
                ),
                GoRoute(
                  path: 'tween-animation-builder-example',
                  name: ScreenNames.tweenAnimationBuilderExample,
                  builder: (context, state) =>
                      const TweenAnimationBuilderExample(),
                ),
                GoRoute(
                  path: 'animated-box-playground',
                  name: ScreenNames.animatedBoxPlayground,
                  builder: (context, state) => const AnimatedBoxPlayground(),
                ),
                GoRoute(
                  path: 'homework-21-animation-cubit',
                  name: ScreenNames.homework21AnimationCubit,
                  builder: (context, state) => BlocProvider(
                    create: (context) => AnimationCubit(),
                    child: const AnimationCubitScreen(),
                  ),
                ),
              ],
            ),
            GoRoute(
              path: 'explicit-animations',
              name: ScreenNames.explicitAnimations,
              builder: (context, state) => const ExplicitAnimationsScreen(),
              routes: [
                GoRoute(
                  path: 'animation-controller-example',
                  name: ScreenNames.animationControllerExample,
                  builder: (context, state) =>
                      const AnimationControllerExample(),
                ),
                GoRoute(
                  path: 'tween-and-animation-example',
                  name: ScreenNames.tweenAndAnimationExample,
                  builder: (context, state) => const TweenAndAnimationExample(),
                ),
                GoRoute(
                  path: 'animated-builder-example',
                  name: ScreenNames.animatedBuilderExample,
                  builder: (context, state) => const AnimatedBuilderExample(),
                ),
                GoRoute(
                  path: 'fade-transition-example',
                  name: ScreenNames.fadeTransitionExample,
                  builder: (context, state) => const BuildInTransitionExample(),
                ),
              ],
            ),
            GoRoute(
              path: 'homework-animations',
              name: ScreenNames.homeworkAnimations,
              builder: (context, state) => const Homework22Screen(),
            ),
            GoRoute(
              path: 'homework-animations2',
              name: ScreenNames.homeworkAnimations2,
              builder: (context, state) => const Homework22Screen2(),
            ),
          ],
        ),
        // Error Handling routes
        GoRoute(
          path: 'error-handling',
          name: ScreenNames.errorHandling,
          builder: (context, state) => const ErrorHandlingMainScreen(),
          routes: [
            GoRoute(
              path: 'products-page-example',
              name: ScreenNames.productsPageExample,
              builder: (context, state) => BlocProvider(
                create: (context) => ProductsCubit(
                  // DevScopes.of(context).productsRepository, // 5 variant

                  // getItS.productsRepository, // 4 variant
                  getIt.get<ProductsRepository>(), // 3 variant
                  // context.read<ProductsRepositoryImpl>(), // 2 variant

                  // ProductsRepositoryImpl( // 1 variant
                  //   ProductsDataSourceImpl(
                  //     // ProductsApiImpl()
                  //     Mock(),
                  //   ),
                  // ),
                )..getProducts(),
                child: const ProductsPageExample(),
              ),
            ),
            GoRoute(
              path: 'homework-23-error-handling',
              name: ScreenNames.homework23ErrorHandling,
              builder: (context, state) => BlocProvider(
                create: (context) =>
                    UserProfileCubit(FakeUserRepository())..loadUserProfile(),
                child: const UserProfileHomeworkScreen(),
              ),
            ),
          ],
        ),
        GoRoute(
          path: 'architecture',
          name: ScreenNames.architecture,
          builder: (context, state) => const ArchitectureMainScreen(),
          routes: [
            GoRoute(
              path: 'news',
              name: ScreenNames.news,
              builder: (context, state) => BlocProvider(
                create: (context) =>
                    NewsCubit(getIt.get<NewsRepository>())..getNews(),
                child: const NewsPage(),
              ),
            ),
          ],
        ),
        // Rest API routes
        GoRoute(
          path: 'rest-api',
          name: ScreenNames.restApi,
          builder: (context, state) => const RestApiBaseScreen(),
          routes: [
            GoRoute(
              path: 'decoding',
              name: ScreenNames.restApiDecodingExample,
              builder: (context, state) => const JsonDecodingExampleScreen(),
            ),
          ],
        ),
        // Rest API homework
        GoRoute(
          path: 'rest-api-homework',
          name: ScreenNames.restApiHomework,
          builder: (context, state) => const ChequeMainScreen(),
          routes: [
            GoRoute(
              path: 'cheque',
              name: ScreenNames.cheque,
              builder: (context, state) => BlocProvider(
                create: (context) =>
                    ChequeCubit(getIt.get<ChequeRepository>())..getCheque(),
                child: const ChequePage(),
              ),
            ),
          ],
        ),
        // Top News routes
        GoRoute(
          path: 'top-news',
          name: ScreenNames.topNews,
          builder: (context, state) => BlocProvider(
            create: (context) => NewsCubitCourse(
              repository: ArticleRepository(
                dataSource: TopNewsDataSource(
                  newsApi: NewsApiFake(),
                  //newsApi: NewsApiHttp(),
                  //newsApi: NewsApiRetrofit(Dio()),
                ),
              ),
            )..getTopNews(),
            child: const TopNewsScreen(),
          ),
          routes: [
            GoRoute(
              path: 'article/:url',
              name: ScreenNames.webViewArticle,
              builder: (context, state) =>
                  WebViewArticleScreen(url: state.pathParameters['url'] ?? ''),
            ),
          ],
        ),
        // Alerts info
        GoRoute(
          path: 'alerts-info',
          name: ScreenNames.alertsInfo,
          builder: (context, state) => const AlertsInfoScreen(),
          routes: [
            GoRoute(
              path: 'active-alerts-regions',
              name: ScreenNames.activeAlertsRegions,
              builder: (context, state) => const ActiveAlertsRegionsScreen(),
            ),
            GoRoute(
              path: 'check-my-region',
              name: ScreenNames.checkMyRegion,
              builder: (context, state) => const CheckMyRegionScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
