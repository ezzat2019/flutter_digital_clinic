import 'package:flutter/material.dart';
import 'package:flutter_digital_clinic/screens/sign_in_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatelessWidget {
  List<Slide> slides = new List();
  Function goToTab;


  WelcomeScreen(){
    slides.add(
      new Slide(
        pathImage: "assets/images/2.PNG",
      ),
    );
    slides.add(
      new Slide(
        pathImage: "assets/images/3.PNG",
      ),
    );
  }
  void onDonePress() {
  

  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.lightBlueAccent,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.lightBlueAccent,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Colors.lightBlueAccent,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> renderListCustomTabs() {
      List<Widget> tabs = new List();
      for (int i = 0; i < slides.length; i++) {
        Slide currentSlide = slides[i];
        tabs.add(Container(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            margin: EdgeInsets.only(bottom: 80.0, top: 60.0),
            child: ListView(
              children: <Widget>[
                GestureDetector(
                    child: Image.asset(
                      currentSlide.pathImage,
                      fit: BoxFit.fill,
                    )),

              ],
            ),
          ),
        ));
      }
      return tabs;
    }
    return IntroSlider(
      // List slides
      // slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Colors.blue.shade50,
      highlightColorSkipBtn:   Colors.lightBlueAccent,

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: ()async
      {

        final pref=await  SharedPreferences.getInstance();
        pref.setBool("is_intro", true).then((value){
          Navigator.of(context)
              .pushReplacement(PageTransition(child: SignInScreen(), type: PageTransitionType.scale));
        }).catchError((e){
          EasyLoading.showToast(e.toString());

        });

      },
      colorDoneBtn: Colors.blue.shade50,
      highlightColorDoneBtn: Colors.lightBlueAccent,

      // Dot indicator
      colorDot: Colors.lightBlueAccent,
      sizeDot: 13.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

      // Tabs
      listCustomTabs: renderListCustomTabs(),
      backgroundColorAllSlides: Colors.white,
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },


      // Behavior
      scrollPhysics: BouncingScrollPhysics(),

      // Show or hide status bar
      shouldHideStatusBar: true,

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }
}
