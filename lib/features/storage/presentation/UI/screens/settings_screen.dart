import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:r_d_flutter_course/features/app/screens/home_screen.dart';
import 'package:r_d_flutter_course/features/storage/presentation/UI/widgets/pin_dialog.dart';
import 'package:r_d_flutter_course/features/storage/presentation/cubit/settings_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocSelector<SettingsCubit, SettingsState, bool>(
              selector: (state) => state.isSettingsLocked,
              builder: (context, isLocked) => SwitchListTile(
                title: const Text('🔒 Lock Settings'),
                value: isLocked,
                onChanged: (value) {
                  _showPINDialog(
                    context,
                    title: value ? 'Enter PIN Code' : 'Set a PIN Code',
                    subtitle: value
                        ? 'Enter your PIN to unlock settings'
                        : 'Enter a PIN to lock settings',
                    isEnableMode: value,
                  );
                },
                activeColor: Colors.red,
              ),
            ),
            const Divider(height: 32),
            _LessonSwitcher(
              title: FeatureNames.widgets.title,
              lesson: FeatureNames.widgets.name,
            ),
            _LessonSwitcher(
              title: FeatureNames.navigation.title,
              lesson: FeatureNames.navigation.name,
            ),
            _LessonSwitcher(
              title: FeatureNames.stateManagement.title,
              lesson: FeatureNames.stateManagement.name,
            ),
            _LessonSwitcher(
              title: FeatureNames.animations.title,
              lesson: FeatureNames.animations.name,
            ),
            _LessonSwitcher(
              title: FeatureNames.errorHandling.title,
              lesson: FeatureNames.errorHandling.name,
            ),
            _LessonSwitcher(
              title: FeatureNames.architecture.title,
              lesson: FeatureNames.architecture.name,
            ),
            _LessonSwitcher(
              title: FeatureNames.restApi.title,
              lesson: FeatureNames.restApi.name,
            ),
            _LessonSwitcher(
              title: FeatureNames.restApiHomework.title,
              lesson: FeatureNames.restApiHomework.name,
            ),
            _LessonSwitcher(
              title: FeatureNames.topNews.title,
              lesson: FeatureNames.topNews.name,
            ),
            _LessonSwitcher(
              title: FeatureNames.alertsInfo.title,
              lesson: FeatureNames.alertsInfo.name,
            ),
            _LessonSwitcher(
              title: FeatureNames.storage.title,
              lesson: FeatureNames.storage.name,
            ),
          ],
        ),
      ),
    );
  }

  void _showPINDialog(
    BuildContext context, {
    required String title,
    required String subtitle,
    required bool isEnableMode,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => PinDialog(
        title: title,
        subtitle: subtitle,
        isEnableMode: isEnableMode,
        onSubmit: (pin) async {
          context.pop();

          final cubit = context.read<SettingsCubit>();

          final parsedPin = int.parse(pin);

          isEnableMode
              ? await cubit.enableLockedMode(parsedPin)
              : await cubit.disableLockedMode(parsedPin);
        },
      ),
    );
  }
}

class _LessonSwitcher extends StatelessWidget {
  const _LessonSwitcher({required this.title, required this.lesson});
  final String title;
  final String lesson;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) => SwitchListTile(
            title: Text(title),
            value: state.isFeatureEnabled(lesson),
            onChanged: state.isSettingsLocked
                ? null
                : (value) => _onChanged(context, lesson, value),
            activeColor: Colors.blue,
          ),
        ),
      ],
    );
  }

  void _onChanged(BuildContext context, String lesson, bool value) {
    context.read<SettingsCubit>().toggleFeature(
      lesson: lesson,
      isEnabled: value,
    );
  }
}
