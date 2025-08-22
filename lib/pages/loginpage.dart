import 'package:cosmictimemachine/constant/TextWidget/CosmicTxt.dart';
import 'package:cosmictimemachine/snippets/buttons/Login_optn_btn.dart';
import 'package:cosmictimemachine/snippets/buttons/confirm_Btn.dart';
import 'package:cosmictimemachine/snippets/buttons/txtbtn.dart';
import 'package:cosmictimemachine/snippets/txtfields/account_info.dart';
import 'package:cosmictimemachine/snippets/txtfields/txtdivider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/login_bg.png"),
          fit: BoxFit.cover,
          ),

      ),
        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                SizedBox(height: 60,),
                CustomText(primaryText: "Cosmic", secondaryText: "Time Machine"),
                SizedBox(height: 250,),

                AccountTxtField(hintText: "Email address", ),
                SizedBox(height:15),
                AccountTxtField(hintText: "Email address",),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TxtButton(text: "Forget Password?", onTap: (){}),
                    ],
                  ),
                ),
                Confirm_Btn(text: 'Login', onPressed: () {  },),
                SizedBox(height:50),
                TextDivider(text: "Login With"),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OptnBtn(text: "google", onPressed: (){}),
                    OptnBtn(text: "facebook", onPressed: (){}),


                  ],

                ),
                SizedBox(height: 20,),

                TxtButton(text: "Don't have any account? Sign Up Now!", onTap: (){})







              ],
            ),
          ),
        ),
      ),

    );
  }
}