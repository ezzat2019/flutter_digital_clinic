import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_digital_clinic/screens/sign_in_screen.dart';
import 'package:flutter_digital_clinic/screens/welcome_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final is_welcome = snapshot.data.getBool("is_intro") ?? false;
            if (is_welcome) {
              return SignInScreen();
            } else {
              return WelcomeScreen();
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SpinKitRotatingCircle(
                color: Colors.lightBlueAccent,
                size: 50.0,
              ),
            );
          }
        },
      ),
      styleTextUnderTheLoader: new TextStyle(),
      imageBackground: AssetImage("assets/images/1.PNG"),
      useLoader: false,
    );
  }
}
