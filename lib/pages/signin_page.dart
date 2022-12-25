import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signindatabaza/pages/signup_page.dart';
import 'package:signindatabaza/services/sevices.dart';

import '../model/user_model.dart';

class SignIN extends StatefulWidget {
  const SignIN({Key? key}) : super(key: key);

  @override
  State<SignIN> createState() => _SignINState();
}

class _SignINState extends State<SignIN> {
  TextEditingController _email=TextEditingController();
  TextEditingController _password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width-200,
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    print('Sign in');
                                  });
                                },
                                child: Text("SIGN IN",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),)
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    print('Sign up');
                                  });
                                },
                                child: Text("SIGN UP",style: TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.bold),)
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: 2,
                          width: double.infinity,
                          color: CupertinoColors.systemYellow,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                SizedBox(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person,color: Colors.grey.shade600,),
                          hintText: "E-mail / Mobile Number",
                          hintStyle: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.grey.shade600,
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: _password,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock,color: Colors.grey.shade600,),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.grey.shade600,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                    child: Text("Forgot Password?",style: TextStyle(color: Colors.grey.shade600),),
                  ),
                ),
                SizedBox(height: 20,),
                MaterialButton(
                  onPressed: (){
                    setState(() {
                      dataUser();
                    });
                  },
                  minWidth: double.infinity,
                  color: CupertinoColors.systemYellow,
                  height: 50,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('SIGN IN'),
                ),
                SizedBox(height: 50,),
                Text("Or login with",style: TextStyle(color: Colors.grey.shade600),),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: (){},
                      color: Colors.lightBlue,
                      minWidth: 150,
                      height: 40,
                      child: Row(
                        children: [
                          Icon(Icons.facebook,color: Colors.white,),
                          SizedBox(width: 10,),
                          Text('Facebook',style: TextStyle(color: Colors.white),)
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: (){},
                      color: Colors.white,
                      minWidth: 150,
                      height: 40,
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('assets/images/img.png'),
                            height: 30,
                          ),
                          Text('Google',)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void dataUser(){
    HiveDB.storeUser(User(email: _email.text,password: _password.text));
     User user =HiveDB.loadUser();
     print(user.email);
     print(user.password);
  }

}
