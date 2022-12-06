import 'package:flutter/material.dart';
import 'package:mypod_client/mypod_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mypod_flutter/router.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';
import 'package:serverpod_auth_google_flutter/serverpod_auth_google_flutter.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.

late SessionManager sessionManager;
late Client client;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  client = Client(
    'https://004d-103-179-2-18.ngrok.io/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();
  sessionManager = SessionManager(caller: client.modules.auth);
  await sessionManager.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        routerConfig: router,
        title: 'Serverpod Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      );
    });
  }
}
