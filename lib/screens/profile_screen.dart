// ignore_for_file: prefer_const_constructors, unnecessary_import, use_key_in_widget_constructors, no_logic_in_create_state, non_constant_identifier_names, prefer_const_declarations, deprecated_member_use, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mowasla/widgets/profile_widgets.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';


class ProfilePage extends StatefulWidget {
 static const String routeName = "/profile";

  //  late User currentUser;
  //  User currentUser = User();



  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {

    final userInfo = Provider.of<User>(context , listen: true);
    
    // User currentUser = User();

    return Scaffold(
      appBar: AppBar(
        // ignore: unnecessary_new
        leading: new IconButton(
          // ignore: unnecessary_new
          icon: new Icon(Icons.arrow_back, color: Color.fromARGB(255, 255, 255, 254)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 48, 1, 102),
        title: Text('Profile Page'),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 24),
          ProfileWidget(
            imagePath: userInfo.imagePath as String,
            // onClicked: () async {},
          ),
          // buildName(widget.currentUser),
          // buildName(userInfo),
          // buildNationality(userInfo),
          // BuildGender(userInfo),
          // BuildPhoneNumber(userInfo),
          Text(userInfo.email as String),


          SizedBox(
            height: 50,
          ),
          Card('Personal Information', 'Account, change number', Icons.person),
          Card('Notifications', 'Edit person', Icons.notifications_active),
          Card('Wallet', 'check your waewfllet',
              Icons.account_balance_wallet_rounded),
          Card('Language', 'English', Icons.language_outlined),
          Card('Support', '', Icons.contact_support_rounded),
          Card('Sign Out', '', Icons.logout),
        ],
      ),
    );
  }

  Widget buildName(
    User user
    ) => Column(
        children: [
          Text(
            user.name as String,
            // widget.currentUser.name as String,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email as String,
            // loadedInfo.email !=null? 'donia@gmail.com'  : 'd@gmail.com',
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildNationality(
    User user
    ) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nationality',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              user.nationality as String,
              style: TextStyle(fontSize: 14, height: 1.4),
            ),
          ],
        ),
      );
  Widget BuildPhoneNumber(
    User user
    ) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Phone Number',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              user.phone as String,
              style: TextStyle(fontSize: 14, height: 1.4),
            ),
          ],
        ),
      );
  Widget BuildGender(
    User user
    ) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gender',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              user.gender as String,
          
              style: TextStyle(fontSize: 14, height: 1.4),
            ),
          ],
        ),
      );

  Widget Card(label, label2, icon, {last = true}) {
    return Stack(
      children: [
        Container(
          width: 320,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10, 8, 8),
            child: Row(
              children: <Widget>[
                Icon(
                  //Icons.person_outline_outlined,
                  icon,
                  color: Color.fromARGB(255, 55, 19, 90),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  label,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  width: 80,
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.9,
              MediaQuery.of(context).size.width * 0.045, 0, 0),
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Color.fromARGB(255, 55, 19, 90),
          ),
        ),
      ],
    );
  }
}
