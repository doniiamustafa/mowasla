// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';



class ApplicationBuilder {
  Widget buildElevatedButton(
      context, label, backgroundColor, textColor, callback) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.85,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: backgroundColor,
            onPrimary: textColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0)),
          ),
          child: Center(
            // child: Text(label.tr()),
            child: Text(label),

          ),
          onPressed: (){callback(context);}),
    );
  }

  // Widget buildText(String text, TextStyle style) {
  //   return Text(text, style: style);
  // }

  Widget buildIconButton(context, IconData icon, callback) {
    return IconButton(
        icon: Icon(icon),
        onPressed: () {
          callback(context);
        });
  }

  Widget buildTextFormField(
      String label, TextEditingController controller,validator,
      {TextInputType inputType = TextInputType.text,
      bool obscureText = false}) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        isDense: true,
        contentPadding: const EdgeInsets.all(15),
        labelStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }

  // Widget buildTextFromFieldDependOnAnother(
  //     String label, TextEditingController controller, validator, dependsOn,
  //     {TextInputType inputType = TextInputType.text,
  //     bool obscureText = false}) {
  //   return TextFormField(
  //     controller: controller,
  //     keyboardType: inputType,
  //     autovalidateMode: AutovalidateMode.onUserInteraction,
  //     validator: (value) {
  //       return validator(value, dependsOn.text);
  //     },
  //     obscureText: obscureText,
  //     decoration: InputDecoration(
  //         labelText: label,
  //         isDense: true,
  //         contentPadding: const EdgeInsets.all(15),
  //         labelStyle: const TextStyle(color: Colors.grey)),
  //   );
  // }

  // Widget buildTextButton(String text, TextStyle style, callback) {
  //   return TextButton(
  //       onPressed: () {
  //         callback();
  //       },
  //       child: buildText(text, style));
  // }

  Widget buildDropMenu(
      BuildContext context, items, label, callback, hintlabel, width) {
    return Container(
      width: width,
      // margin: EdgeInsets.fromLTRB(15, 4, 20, 0),
      child: DropdownButtonFormField<String>(
        // value: dropdownValue,
        hint: Text(hintlabel),
        onChanged: (String? newValue) {
          callback(newValue);
        },
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: InputDecoration(label: Text(label)),
      ),
    );
  }

  Widget buildLoadingProgress(bool loadingInProgress, BuildContext context) {
    if(loadingInProgress){
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.purple,
          ),
        )
      

      );
    }else{
      return Container();
    }
  }

  
}
