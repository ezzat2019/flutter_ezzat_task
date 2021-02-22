import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_ezzat_task/screens/sign_up_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: height * .10),
            child: Text(
              "Login",
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 25,
                child: Container(
                  margin: EdgeInsets.only(left: 25),
                  child: CountryCodePicker(
                    onChanged: print,
                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                    initialSelection: '+20',
                    favorite: ['002', 'EG'],
                    // optional. Shows only country name and flag
                    showCountryOnly: false,
                    // optional. Shows only country name and flag when popup is closed.
                    showOnlyCountryWhenClosed: false,
                    // optional. aligns the flag and the Text left
                    alignLeft: true,
                    textStyle: TextStyle(color: Colors.white.withOpacity(.5)),
                  ),
                ),
              ),
              Expanded(
                flex: 65,
                child: Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    cursorColor: Colors.amber,
                    style: TextStyle(color: Colors.amber),
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amberAccent)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(.5))),
                        hintText: "Your Mobile Number",
                        hintStyle:
                            TextStyle(color: Colors.white.withOpacity(.5))),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.only(right: 25,left: 30),
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              cursorColor: Colors.amber,
              style: TextStyle(color: Colors.amber),
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amberAccent)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.white.withOpacity(.5))),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(.5))),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: FlatButton(onPressed: () {


            }, child: Text("Forget Password?",style: TextStyle(
              fontSize: 20,
              color: Colors.white
            ),)),
          ),
          SizedBox(height: 40,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: RaisedButton(onPressed: () {

            },child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text("Login",style: TextStyle(
                fontSize: 20,
                color: Colors.white
                  ,fontWeight: FontWeight.bold
              ),),
            ),
            color: Colors.amber.shade600,

            ),
          ),
          SizedBox(height: 60,),
          Container(margin: EdgeInsets.symmetric(horizontal: 20),
          child: Text("Don't have an account?",style: TextStyle(
            color: Colors.white,fontSize:20
          ),),),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: RaisedButton(onPressed: () {

              Navigator.of(context)
                  .push(PageTransition(type: PageTransitionType.topToBottom, child: SignUpScreen(),duration: Duration(milliseconds: 700)));

            },child: Padding(
              padding: const EdgeInsets.all(15),

              child: Text("Sign Up",style: TextStyle(
                  fontSize: 20,
                  color: Colors.amber

              ),),
            ),
              color: Colors.black,
              shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber)
              ),

            ),
          ),
          SizedBox(height: 40,),
          Container(margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Or Connect With:",style: TextStyle(
                color: Colors.white,fontSize:20
            ),),),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(FontAwesomeIcons.facebook,size: 50,color: Colors.white,),
              SizedBox(width: 20),
              FaIcon(FontAwesomeIcons.google,size: 50,color: Colors.amber,),
            ],
          ),
          SizedBox(height: 20,)

        ],
      ),
    );
  }
}
