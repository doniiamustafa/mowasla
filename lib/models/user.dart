import 'package:flutter/material.dart';

class User with ChangeNotifier {
   String? userId;
   String? imagePath;
   String? password;
   String? name ;
   String? email ;
   String? nationality;
   int? phone ;
  //final bool isDarkMode;
   String? gender;
  //  Icon? GIcon = Icon(Icons.face_outlined);

   User({
     this.userId,
     this.password,
     this.imagePath,
     this.name,
     this.email ,
     this.nationality,
     this.phone,
     this.gender,
    //  this.GIcon,
});
  


@override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
  // Setter **********************************

  void setUserId(String? userID) {this.userId = userID;  notifyListeners(); }  

  void setEmail(String? email) {
  this.email = email;
  notifyListeners();
  }

  void setPassword(String? password) {
  this.password = password;
  notifyListeners();
  }  

  void setImagePath(String? imagePath) {
  this.imagePath = imagePath;
  notifyListeners();
  }  

  void setName(String? name) {
  this.name = name;
  notifyListeners();
  }  

  void setNationality(String? nationality) {
  this.nationality = nationality;
  notifyListeners();
  }  

  void setPhone(int? phone) {
  this.phone = phone;
  notifyListeners();
  } 

  void setGender(String? gender) {
  this.gender = gender;
  notifyListeners();
  } 

  // void setGIcon(Icon? GIcon) {
  // this.GIcon = GIcon;
  // notifyListeners();
  // } 

  // Getter **********************************

  String getUserId() {
  return userId as String;
  }

  String getEmail() {
  return email as String;
  }   

  String getImagePath() {
  return imagePath as String;
  }  

  String getSetName() {
  return name as String;
  } 

  String getNationality() {
  return nationality as String;
  }  

  int getPhone() {
  return phone as int;
  }     

  // Icon getGIcon() {
  // return GIcon as Icon;
  // }  

  String getGender() {
  return gender as String;
  } 



  // fromjson & tojason ***************

   factory User.fromJson(Map<dynamic, dynamic> parsedJson) {
    return new User(
      userId: parsedJson['userId'] ?? "",
      name: parsedJson['name'] ?? "",
      email: parsedJson['email'] ?? "",
      password: parsedJson['password'] ?? "",
      nationality: parsedJson['nationality'] ?? "",
      phone: parsedJson['phone'] ?? "",
      gender: parsedJson['gender'] ?? "",
      // GIcon: parsedJson['GIcon'] ?? "",
      imagePath: parsedJson['imagePath'] ?? "",

    );
  }


   Map<dynamic, dynamic> toJson() {
    return {
      "userId": this.userId,
      "name": this.name,
      "email": this.email,
      "password": this.password,
      "nationality": this.nationality,
      "phone": this.phone,
      "gender": this.gender,
      // "GIcon": this.GIcon,
      "imagePath": this.imagePath,
    };
  }
}