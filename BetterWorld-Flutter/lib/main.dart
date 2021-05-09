import 'package:muggles/screens/auth/login.dart';
import 'package:muggles/screens/auth/otp.dart';
import 'package:muggles/screens/auth/setUpDevice.dart';
import 'package:muggles/screens/complaint/comaplaint.dart';
import 'package:muggles/screens/complaint/createComaplaint.dart';
import 'package:muggles/screens/dashboard.dart';
import 'package:muggles/screens/payBills.dart';
import 'package:muggles/screens/game/game.dart';
import 'package:muggles/screens/usage.dart';
import 'package:muggles/services/connectivityService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'enums.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    StreamProvider<ConnectivityStatus>(
      create: (_) => ConnectivityService().connectionStatusController.stream,
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Air Power',
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      routes: {
        '/auth': (context) => LoginScreen(),
        '/otp': (context) => OTPScreen(),
        '/deviceSetUp': (context) => SetUpDevice(),
        '/dashboard': (context) => Dashboard(),
        '/usage': (context) => UsageScreen(),
        '/bill': (context) => PayBillsScreen(),
        '/game': (context) => GameScreen(),
        '/complaints': (context) => ComplaintScreen(),
        '/createComplaint': (context) => CreateComplaint()
      },
      initialRoute: '/auth',
    );
  }
}
