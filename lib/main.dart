// ignore_for_file: depend_on_referenced_packages

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:r_d_flutter_course/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:r_d_flutter_course/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

// final GoRouter _router = GoRouter(
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/',
//       builder: (BuildContext context, GoRouterState state) {
//         return HomePage();
//       },
//     ),
//     GoRoute(
//       path: '/settings',
//       builder: (BuildContext context, GoRouterState state) {
//         return const SettingsPage();
//       },
//     ),
//   ],
// );

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _appRouter.config());
  }
}

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

  Future<bool> logInWithGoogle() async {
    setState(() {
      isLoading = true;
    });
    final user = await GoogleSignIn().signIn();
    GoogleSignInAuthentication userAuth = await user!.authentication;
    var credential = GoogleAuthProvider.credential(
      idToken: userAuth.idToken,
      accessToken: userAuth.accessToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    setState(() {
      isLoading = false;
    });
    return FirebaseAuth.instance.currentUser != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () async {
                  bool isLogged = await logInWithGoogle();

                  if (isLogged) {
                    print('Logged in with GOOGLE - success!');
                    // ignore: use_build_context_synchronously
                    // context.go('/settings');
                    // ignore: use_build_context_synchronously
                    AutoRouter.of(context).push(SettingsRoute());
                  }
                },
                child: Text('Sign in with Google'),
              ),
      ),
    );
  }
}

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SettingsPage')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // context.go('/');
            AutoRouter.of(context).push(HomeRoute());
          },
          child: Text('Go back to the HomePage'),
        ),
      ),
    );
  }
}
