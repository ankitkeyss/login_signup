import 'package:flutter/material.dart';

class MyLoginPage extends StatefulWidget {


  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:   BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/login_photos/login.png')
          )
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: login(),
      ),
    );

  }
}
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  String _userEmail = '';
  String _userPass = '';
  void submit_form(){
    final bool ? isValid= _formKey.currentState?.validate();
    if(isValid==true){
      debugPrint(_userEmail);
      debugPrint(_userPass);
    }
  }
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 90,left: 50),
          child:   Text("Welcome \n Back",style: TextStyle(fontSize: 33,color: Colors.white),),
        ),
        SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5,
                right: 35,left: 35),
            child: Form(
              key: _formKey,
              child:  Column(
                children:   [
                  TextFormField(
                    validator: (value){
                      if(value == null || value.trim().isEmpty)
                      {
                        return 'Please Enter E-Mail';
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onChanged: (value) => _userEmail = value,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    // obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      hintText: "E-Mail ID",
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(

                    style: TextStyle(fontWeight: FontWeight.bold),
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      hintText: "Password",
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'This field is required';
                      }
                      if (value.trim().length < 8) {
                        return 'Password must be at least 8 characters in length';
                      }
                      // Return null if the entered password is valid
                      return null;
                    },
                    onChanged: (value) => _userPass = value,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text('Sign In',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,),),
                      ),
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.black54,
                        child: IconButton(
                          onPressed: submit_form,
                          icon: Icon(Icons.arrow_forward),
                        ),

                      )

                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(onPressed: (){
                        Navigator.pushNamed(context, 'register');
                      },
                        child: Text("sign up",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent,fontSize: 18,decoration: TextDecoration.underline),),


                      ),
                      TextButton(onPressed: (){},
                        child: Text("forget password",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent,fontSize: 18,decoration: TextDecoration.underline),),


                      )
                    ],
                  ),
                ],
              ),
            ),

          ),
        )
      ],
    );
  }
}

