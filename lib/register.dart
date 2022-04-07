import 'package:flutter/material.dart';
import 'package:login_page/profile.dart';
class MyRegisterPage extends StatefulWidget {


  @override
  State<MyRegisterPage> createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:   BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/login_photos/register.png')
          )
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: register(),
      ),
    );

  }
}
class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _loginRegisterState();
}

class _loginRegisterState extends State<register> {

  final _formKey = GlobalKey<FormState>();
  String _userEmail = '';
  String _userName = '';
  String _password = '';
  String _confirmPassword = '';

  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_userName);
      debugPrint(_password);
      debugPrint(_confirmPassword);
    }
  }

  TextEditingController _email = new TextEditingController();
  TextEditingController _name = new TextEditingController();
  TextEditingController _pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 90, left: 30),
          child: Text("Create \n Account",
            style: TextStyle(fontSize: 33, color: Colors.white),),
        ),
        SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.3,
                  right: 35, left: 35),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [

                    TextFormField(
                      controller: _name,
                      // maxLength: 16,
                      validator: (value) {
                        if (value == null || value
                            .trim()
                            .isEmpty) {
                          return 'This field is required';
                        }
                        if (value
                            .trim()
                            .length < 4) {
                          return 'Username must be at least 4 characters in length';
                        }
                        // Return null if the entered username is valid
                        return null;
                      },
                      onChanged: (value) => _userName = value,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade50,
                        hintText: "Your Name",
                        filled: true,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _email,
                      validator: (value) {
                        if (value == null || value
                            .trim()
                            .isEmpty) {
                          return 'Please enter your email address';
                        }
                        // Check if the entered email has the right format
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        // Return null if the entered email is valid
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
                      controller: _pass,
                      validator: (value) {
                        if (value == null || value
                            .trim()
                            .isEmpty) {
                          return 'This field is required';
                        }
                        if (value
                            .trim()
                            .length < 8) {
                          return 'Password must be at least 8 characters in length';
                        }
                        // Return null if the entered password is valid
                        return null;
                      },
                      onChanged: (value) => _password = value,
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
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }

                        if (value != _password) {
                          return 'Confimation password does not match the entered password';
                        }

                        return null;
                      },
                      onChanged: (value) => _confirmPassword = value,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        hintText: "Confirm Password",
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,),),
                        ),
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.black54,
                          child: IconButton(
                            onPressed: () {
                              _trySubmitForm();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      MyProfile(name: _name.text,
                                          email: _email.text,
                                        password: _pass.text,)));
                            },

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
                        TextButton(onPressed: () {
                          Navigator.pushNamed(context, 'login');
                        },
                          child: Text(
                            "log in", style: TextStyle(fontWeight: FontWeight
                              .bold,
                              color: Colors.blueAccent,
                              fontSize: 18,
                              decoration: TextDecoration.underline),),


                        ),
                        TextButton(onPressed: () {},
                          child: Text("forget password",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                                fontSize: 18,
                                decoration: TextDecoration.underline),),


                        )
                      ],
                    ),
                  ],
                ),
              )

          ),
        )
      ],
    );
  }
}

