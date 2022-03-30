import 'package:flutter/material.dart';


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
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 90,left: 30),
          child:   Text("Create \n Account",style: TextStyle(fontSize: 33,color: Colors.white),),
        ),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.4,
                right: 35,left: 35),
            child: Column(
              children:   [
                TextField(
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
                      child: Text('Register',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,),),
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
                      Navigator.pushNamed(context, 'login');
                    },
                      child: Text("log in",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent,fontSize: 18,decoration: TextDecoration.underline),),


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

