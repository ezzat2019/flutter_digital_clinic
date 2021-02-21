import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInScreen extends StatelessWidget {
  @override Widget build(BuildContext context) {
    final widht = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.blue.shade900,
      ),
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: ListView(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/sign_in.jpg",
                  width: widht,
                  height: height * .30,
                  fit: BoxFit.fill,
                ),
                Positioned(
                    left: 20,
                    bottom: 70,
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )),
                Positioned(
                    left: 20,
                    bottom: 40,
                    child: Text(
                      "Please enter your credentials to proceed",
                      style: TextStyle(
                        color: Colors.white.withOpacity(.9),
                        fontSize: 18,
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              child: Text(
                "EMAIL",
                style: TextStyle(
                    color: Colors.blue.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 20, top: 5, right: 20),
                child: TextField(
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue.shade900,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      fillColor: Colors.teal.shade100,
                      filled: true,
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      hintText: "EMAIL",
                      hintStyle:
                          TextStyle(color: Colors.blue.shade200, fontSize: 20)),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              child: Text(
                "PASSWORD",
                style: TextStyle(
                    color: Colors.blue.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 20, top: 5, right: 20),
                child: TextField(
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue.shade900,
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      fillColor: Colors.teal.shade100,
                      filled: true,
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      hintText: "PASSWORD",
                      hintStyle:
                          TextStyle(color: Colors.blue.shade200, fontSize: 20)),
                )),
            SizedBox(
              height: 25,
            ),
            Center(
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Forget Password ?",
                  style: TextStyle(fontSize: 18, color: Colors.blue.shade700),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: FlatButton(
                onPressed: () {},
                padding: EdgeInsets.symmetric(vertical: 13),
                child: Text(
                  "SIGN IN",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                color: Colors.teal.shade100,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "OR",
                style: TextStyle(fontSize: 25, color: Colors.blue.shade700),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                    size: 30,
                    color: Colors.blue.shade900,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.facebook,
                    size: 30,
                    color: Colors.blue.shade900,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don`t have an account?",
                  style: TextStyle(
                      color: Colors.black.withOpacity(.3), fontSize: 18),
                ),
                SizedBox(
                  width: 5,
                ),
                FlatButton(
                    onPressed: () {},
                    child: Text(
                      "SIGN UP",
                      style:
                          TextStyle(fontSize: 20, color: Colors.blue.shade800),
                    ))
              ],
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  SignInScreen() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }
}
