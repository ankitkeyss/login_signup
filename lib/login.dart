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
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 90,left: 50),
          child:   Text("Welcome \n Back",style: TextStyle(fontSize: 33,color: Colors.white),),
        ),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5,
                right: 35,left: 35),
            child: Column(
              children:   [
                TextField(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  obscureText: true,
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
                TextField(
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
                        onPressed: (){},
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
        )
      ],
    );
  }
}

