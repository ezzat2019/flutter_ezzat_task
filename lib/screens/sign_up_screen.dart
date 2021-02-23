import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_ezzat_task/data/model/register_moadel.dart';
import 'package:flutter_ezzat_task/helpers/loading_helper.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int radioValue = 1;
  final name_controller = TextEditingController();
  final phone_controller = TextEditingController();
  final email_controller = TextEditingController();
  final pass_controller = TextEditingController();
  final pass_confirm_controller = TextEditingController();

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
          SizedBox(
            height: 60,
          ),
          Container(
            margin: EdgeInsets.only(right: 25, left: 30),
            child: TextField(
              controller: name_controller,
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
                    controller: phone_controller,
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
            margin: EdgeInsets.only(right: 25, left: 30),
            child: TextField(
              controller: email_controller,
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
                  helperText: "email like e@yahoo.com",
                  helperStyle: TextStyle(color: Colors.amber.withOpacity(.5)),
                  hintStyle: TextStyle(color: Colors.white.withOpacity(.5))),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.only(right: 25, left: 30),
            child: TextField(
              controller: pass_controller,
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
                  helperText: "Password like A+123456789",
                  helperStyle: TextStyle(color: Colors.amber.withOpacity(.5)),
                  hintStyle: TextStyle(color: Colors.white.withOpacity(.5))),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.only(right: 25, left: 30),
            child: TextField(
              controller: pass_confirm_controller,
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
            child: RadioListTile(
              value: 1,
              groupValue: radioValue,
              onChanged: (value) {
                setState(() {
                  radioValue = value;
                });
              },
              title: Text(
                "Male",
                style: TextStyle(color: Colors.white.withOpacity(.5)),
              ),
              activeColor: Colors.amber,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: RadioListTile(
              value: 2,
              groupValue: radioValue,
              onChanged: (value) {
                setState(() {
                  radioValue = value;
                });
              },
              title: Text("Female",
                  style: TextStyle(color: Colors.white.withOpacity(.5))),
              activeColor: Colors.amber,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: RaisedButton(
              onPressed: () {
                String userName = name_controller.text.trim();
                if (userName.length < 1) {
                  LoadingHelper.showToast("enter you name!");
                  return;
                }
                String phone = phone_controller.text.trim();
                if (phone.length < 1) {
                  LoadingHelper.showToast("enter phone number!");
                  return;
                }

                String email = email_controller.text.trim();
                if (email.length < 1) {
                  LoadingHelper.showToast("enter email!");
                  return;
                }

                if (!EmailValidator.validate(email)) {
                  LoadingHelper.showToast("enter correct email address!");
                  return;
                }

                String pass = pass_controller.text.trim();
                if (pass.length < 1) {
                  LoadingHelper.showToast("enter password!");
                  return;
                }
                String pass_confirm = pass_confirm_controller.text.trim();
                if (pass_confirm.length < 1) {
                  LoadingHelper.showToast("enter confirm  password!");
                  return;
                }
                if (pass_confirm != pass) {
                  LoadingHelper.showToast(
                      "password not the same of confirm password");
                  return;
                }

                final model = RegisterMoadel(
                    username: phone, email: email, password: pass);

                LoadingHelper.showLoading();
                Dio()
                    .post("http://multi-choice.org/api/Authenticate/register",
                        data: model.toJson())
                    .then((value) {
                  if (value != null) {
                    if (value.statusCode == 200) {
                      EasyLoading.showSuccess('Great Success!');
                      Navigator.of(context).pop();
                      print(value.data.toString());
                      LoadingHelper.closeLoading();
                    } else {
                      print(value.data.toString());
                      LoadingHelper.closeLoading();

                      LoadingHelper.showToast(
                          "error status code is ${value.statusCode}");
                    }
                  }
                  LoadingHelper.closeLoading();
                }).catchError((e) {
                  LoadingHelper.closeLoading();

                  print(e.toString());
                  LoadingHelper.showToast(
                      "${e.toString()}\nensure constraint of password \nTry again with  another email and user name");
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              color: Colors.amber.shade600,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
