import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mowasla/models/user.dart';
import 'package:mowasla/screens/login_screen.dart';
import 'package:mowasla/screens/signUp_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mowasla/screens/profile_screen.dart';
import 'package:mowasla/screens/response_screen.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // create firebase
  await Firebase.initializeApp();



  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => User(),
      
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
      
          locale:  Locale('en', '') ,
      
          localizationsDelegates: [
            // localizationsDelegates: AppLocalizations.localizationsDelegates,
            // supportedLocales: AppLocalizations.supportedLocales,
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            // GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en', ''), // English, 
            Locale('ar', ''), //Arabic, 
          ],
      
          debugShowCheckedModeBanner: false,
          initialRoute: LoginScreen.routeName,
            routes: {
        
            LoginScreen.routeName: (context) =>LoginScreen(),
            ProfilePage.routeName: (context) =>ProfilePage(),
       
      },
         
        ),
      
    );
  }
}