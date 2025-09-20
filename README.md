# ROBOT_DREAMS SCHOOL

## PART 2 FLUTTER

1. LESSON 13 FLUTTER WIDGETS PART 1

- MaterialApp
- Scaffold
- Container
- Row
- Column
- Expanded
- Stack, Positioned
- SizedBox
- Padding
- Align
- Center
- Text
- Buttons: ElevatedButton, TextButton, OutlinedButton, IconButton, ElevatedButton.icon, OutlinedButton.icon, FloatingActionButton
- Scroll: SingleChildScrollView, ListView (ListView.builder, ListView.separated), GridView (GridView.builder)
- Progress Indicators: LinearProgressIndicator, CircularProgressIndicator

2. LESSON 14 FLUTTER WIDGETS PART 2

- Custom Widgets
- Stateless Widget vs Stateful Widget
- GestureDetector, InkWell
- TextField, TextFormField with validation
- Image

3. LESSON 15 WIDGET INTERACTION AND LAYOUT

- Container with sizes
- LayoutBuilder to check max/min height/width
- Flexible / Expanded - Column
- Flexible / Expanded - Row
- FittedBox examples

4. LESSON 16 BASE NAVIGATION

- Simple transition to new screen
- Simple transition with animation
- Transition with arguments
- Transition with returning data
- Navigation to modal bottom sheet
- Named Rout navigation - Simple transition
- Named Rout navigation - With arguments

5. LESSON 17 GO ROUTER

- Change default navigation to go_router
- Added go_router navigation with arguments

6. LESSON 18 STATE MANAGEMENT

- Manage state with InheritedWidget
- Manage state with Provider package
- Using ValueNotifier and MultiProvider
- setState with ValueNotifier in StatelessWidget

7. LESSON 19 BLOC INTRO

- Manage state with flutter_bloc package (Cubit)
- Manage state with flutter_bloc package (BLoC)

8. LESSON 20 BLOC Widgets

- BlocListener
- BlocConsumer
- BlocSelector
- BlocProvider.value

9. LESSON 21 IMPLICIT ANIMATIONS

- AnimatedContainer
- AnimatedOpacity
- AnimatedAlign
- AnimatedPadding
- AnimatedPositioned
- AnimatedSwitcher
- TweenAnimationBuilder

10. LESSON 22 EXLICIT ANIMATIONS

- Animation controller
- Animation
- Tween
- SingleTickerProviderStateMixin
- TickerProviderStateMixin
- AnimatedBuilder
- AnimatedWidget
- AnimatedController listener
- AnimatedController statusListener
- Tween chain() method
- TweenSequence + TweenSequenceItems

11. LESSON 23 ERROR HANDLING

- Error handling in try-catch
- Add custom exception
- Global error handling
  - FlutterError.onError (framework)
  - PlatformDispatcher.instance.onError (other errors)
  - RunZoneGuarded (flutter < v3.3)
- Crashlytics
  - Sentry https://sentry.io/signup/
  - Firebase https://firebase.google.com/docs/crashlytics/get-started?platform=flutter

12. LESSON 24 FLUTTER APPLICATION ARCHITECTURE

- Project structure
  - feature based structure
  - type based structure
- 2 Layers
  - Presentation layer
    - bloc
    - UI
  - Data layer
    - repositories
    - data_source
- 3 Layers
  - Presentation layer
    - bloc
    - UI
  - Domain layer
    - services
    - repositories
  - Data layer
    - data_source
- RepositoryProvider
- DI (Dependencies injection)
  - GetIt
  - Singleton
  - Inherited Widget

13. LESSON 25 REST API P1

- API (Application programming interface)
- REST API (Representational State Transfer)
- request
  - Create --> POST
  - Read --> GET
  - Update --> PUT
  - Delete --> DELETE
- response
  - json
- JSON (JavaScript Object Notation) components:
- String
- Number
- Boolean
- Null
- Object
- Array

14. LESSON 26 REST API P2

- Decoding - convert json to Dart object
- Encoding - convert Dart object to json
- Convert json to Map<String, dynamic> by hand
- Auto convert with jsonSerializable
- Create DTO class with online services
  - https://dart-quicktype.netlify.app/
- Create DTO class with VSCode extension
  - https://marketplace.visualstudio.com/items?itemName=hirantha.json-to-dart

15. LESSON 27 REST API EXAMPLE (popular rest api packages)

- https://pub.dev/packages/http
- https://pub.dev/packages/dio
- https://pub.dev/packages/retrofit
- https://pub.dev/packages/chopper
- dio interceptors

16. LESSON 28 STORAGES

- shared_preferences
- flutter_secure_storage
- reading and writing files
- sqflite
- drift
- objectbox
