import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:mowasla/models/user.dart';
import 'package:mowasla/screens/profile_screen.dart';
import 'package:mowasla/services/authentication.dart';
import 'package:mowasla/services/http_services.dart';
import 'package:mowasla/services/validator.dart';
import 'package:mowasla/widgets/application_builder.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

// import
class LoginScreen extends StatefulWidget {
 static const String routeName = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool obserText = true;

class _LoginScreenState extends State<LoginScreen> {

  final HttpServices httpServices = HttpServices();
  final ApplicationBuilder appBuilder = ApplicationBuilder();
  final Validator validator = Validator();
  final Authentications _auth = Authentications();

  bool loadingInProgress = false;


  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {

  

    bool _isChecked = true;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  SafeArea(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: const BoxDecoration(
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
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("images/Frame.png"),
                    )),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  appBuilder.buildTextFormField(
                    AppLocalizations.of(context)!.email,
                    emailTextController,
                    validator.isEmail,
                    inputType: TextInputType.emailAddress,
                  ),

                  appBuilder.buildTextFormField(
                    AppLocalizations.of(context)!.password,
                    passTextController,
                    validator.isPassword,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        child: Row(children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: null,
                            activeColor: Color(0x2A0944),
                          ),
                          Text(
                            AppLocalizations.of(context)!.rememberme,
                            style: TextStyle(
                              color: Color(0xff2a0944),
                              fontSize: 12,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ]),
                      ),
                      GestureDetector(
                        child: Text(
                          AppLocalizations.of(context)!.forgotPass,
                          style: TextStyle(
                            color: Color(0xff2a0944),
                            fontSize: 12,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  Container(
                    child: appBuilder.buildElevatedButton(
                        context,
                        AppLocalizations.of(context)!.signin,
                        Color(0xff2a0944),
                        Colors.white,
                        //  createAccount
                        (context) => userSignInAuth()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //or sign in with bar
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(children: [
                      Expanded(
                          child: Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                      )),
                      Text(
                        AppLocalizations.of(context)!.signInWith,
                        style: TextStyle(
                          color: Color(0xff2a0944),
                          fontSize: 12,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                      )),
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //icons for alternative sign in ways
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: SignInButton(
                          Buttons.Google,
                          text: AppLocalizations.of(context)!.google,
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: SignInButton(
                          Buttons.FacebookNew,
                          text: AppLocalizations.of(context)!.facebook,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 80,
                      ),
                      Text(
                        AppLocalizations.of(context)!.haveNoAccount,
                        style: TextStyle(
                          color: Color(0xffa8a8a8),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.signup,
                        style: TextStyle(
                          color: Color(0xff2a0944),
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              appBuilder.buildLoadingProgress(loadingInProgress, context)
            ],

          ),
        ),
      ),
    );
  }

  Future userSignInAuth() async {
    // final result = await _auth.signInWithEmailAndPassword( emailTextController.text, passTextController.text);
    // print(result);
    setState(() {
      loadingInProgress = true;
    });

    User user = User();
    emailTextController.text = "donia@gmail.com";
    passTextController.text = "12345678";
    user.setEmail(emailTextController.text);
    user.setPassword(passTextController.text);

    Response response =  await httpServices.post("login", user.toJson());
      if (response.statusCode == 200) {
      Map<String, dynamic> results = jsonDecode(response.body);
        inspect(results);
        results = results['message'];
        user = User.fromJson(results);
        user.setName(user.name);
        user.setEmail(user.email);

        inspect(user);
    

        setState(() {
          loadingInProgress = false;
        });

        // Navigator.push(context, MaterialPageRoute(builder: (ctx) => ProfilePage()));
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (BuildContext context) => Provider(
        //     create: (context) => LoginScreen(),
        //     builder: (context, child) => ProfilePage(),
        //     )));
        Navigator.pushNamed(context, ProfilePage.routeName);
      }
      else{
        Fluttertoast.showToast(msg: "invalid email or password");
         setState(() {
          loadingInProgress = false;
        });



      }


  
    //email: oomaya1@gmail.com
    //pass: 19891989


    //  result != null ? Fluttertoast.showToast(msg: "Logged In") : Fluttertoast.showToast(msg: "Not Logged");
    
  }
}
