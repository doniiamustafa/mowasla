// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mowasla/Widgets/application_builder.dart';
import 'package:mowasla/services/authentication.dart';
import 'package:mowasla/services/validator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUp extends StatefulWidget {
  // static const routeName = '/SignUp';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  ApplicationBuilder appBuilder = ApplicationBuilder();
  Validator validator = Validator();
  Authentications _auth = Authentications();

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passTextController = TextEditingController();
  final TextEditingController confPassTextController = TextEditingController();
  final TextEditingController firstNameTextController = TextEditingController();
  final TextEditingController lastNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/Logo.png'),
                    fit: BoxFit.none,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: Color(0xff2a0944),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Sign up ",
                style: TextStyle(
                  color: Color(0xff2a0944),
                  fontSize: 25,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                ),
              ),

              appBuilder.buildTextFormField(
                "First Name",
                firstNameTextController,
                validator.isName,
                inputType: TextInputType.name,
              ),
              appBuilder.buildTextFormField(
                "Last Name", 
                  lastNameTextController,
                  validator.isName,
                  inputType: TextInputType.name),

              appBuilder.buildTextFormField(
                  "Email",
                  emailTextController,
                  validator.isEmail,
                  inputType: TextInputType.emailAddress),

              appBuilder.buildTextFormField( 
                "Password",
                passTextController,
                validator.isPassword,
                inputType: TextInputType.visiblePassword,),

              appBuilder.buildTextFormField(
                 "Confirm Password",
                confPassTextController,
                validator.isPassword,
                inputType: TextInputType.visiblePassword),

              SizedBox(
                width: 370,
              ),
              appBuilder.buildDropMenu(
                  context,
                  ['male', 'female'],
                  'Gender',
                  null,
                  'Select Gender',
                  MediaQuery.of(context).size.width * 0.9),
              SizedBox(
                height: 50,
              ),
              appBuilder.buildElevatedButton(
                context,
                'Sign Up',
                Color.fromARGB(255, 57, 22, 118),
                Colors.white,
                (context) => createAccount(),
              ),
              //appbuilder.inputFile(label: "First name"),

              //*Sign Up form
            ],
          ),
        ),
      ),
    );
  }

  void test(){
    inspect(emailTextController);
  }


 Future createAccount() async {
   
    inspect(emailTextController);
    final result = await _auth.signUpWithEmailAndPassWord(
        emailTextController.text, passTextController.text);

  }
}
