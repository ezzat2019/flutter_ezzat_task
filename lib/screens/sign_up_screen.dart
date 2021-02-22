import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int radioValue=1;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: height * .15),
            child: Text(
              "Create Your Account",
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 60,),
          Container(
            margin: EdgeInsets.only(right: 25,left: 30),
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              cursorColor: Colors.amber,
              style: TextStyle(color: Colors.amber),
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amberAccent)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.white.withOpacity(.5))),
                  hintText: "Your Name",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(.5))),
            ),
          ),
          SizedBox(
            height: 25,
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
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: Colors.amber,
              style: TextStyle(color: Colors.amber),
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amberAccent)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.white.withOpacity(.5))),
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(.5))),
            ),
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
              textInputAction: TextInputAction.next,
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
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.only(right: 25,left: 30),
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              cursorColor: Colors.amber,
              style: TextStyle(color: Colors.amber),
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amberAccent)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.white.withOpacity(.5))),
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(.5))),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: RadioListTile(value: 1, groupValue: radioValue, onChanged: (value) {
              setState(() {
                radioValue=value;
              });

            },
            title: Text("Male",style: TextStyle(color: Colors.white.withOpacity(.5)),),
            activeColor: Colors.amber,),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: RadioListTile(value: 2, groupValue: radioValue, onChanged: (value) {
              setState(() {
                radioValue=value;
              });

            },
              title: Text("Female",style: TextStyle(color: Colors.white.withOpacity(.5))),
              activeColor: Colors.amber,


            ),
          ),
          SizedBox(height: 40,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: RaisedButton(onPressed: () {

            },child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text("Sign Up",style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                  ,fontWeight: FontWeight.bold
              ),),
            ),
              color: Colors.amber.shade600,

            ),
          ),
          SizedBox(height: 20,),

        ],
      ),
    );
  }
}