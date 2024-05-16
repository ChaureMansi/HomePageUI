import 'package:flutter/material.dart';
import 'package:stylish/screens/home/home_screen.dart';
import 'package:stylish/screens/reg_screen.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;
  //bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 400,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60) ,
              child: Form(
                key: _formField,
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/profile.png",
                    height: 200,
                    width: 200,),
                    
                    SizedBox(height: 20),
                    
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                         bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);

                        if(value.isEmpty) {
                          return "Enter Email";
                        }
                        else if(!emailValid){
                          return "Enter Valid Email";
                        }
                       
                        
                      },
                      ),
        
                    
                    SizedBox(height: 20),
            
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: passController,
                      obscureText: passToggle,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: (){
                             passToggle = !passToggle;
            
                             setState(() {});
                          
                          },
            
                          child: Icon(passToggle ? Icons.visibility_off : Icons.visibility),
            
                        ),
                      ),
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Enter Password";
                        }
                        else if(passController.text.length < 6){
                          return "Password length more than 6 character";
                        }
                      },
                    ),
            
                    SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        if(_formField.currentState!.validate()){
                          print("Data Added Successfully");
                          emailController.clear();
                          passController.clear();
                        }
                      },
                      child: ElevatedButton(
                        onPressed: () {
                            if( _formField.currentState!.validate())
                           { Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));}
                         
                      
                        },
                        child: const Text('Login', style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),),
                      style: ElevatedButton.styleFrom(
                      fixedSize: const Size(395, 55),
                      backgroundColor:  Color.fromARGB(255, 27, 145, 243),
                      shadowColor: Colors.transparent,
                      
                     ),
                     ),
                    ),
                    SizedBox(height: 20),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Do not have an account?", 
                        style: TextStyle(
                          fontSize: 16,
                       ),
                     ),
                     TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> RegScreen()));
                      }, 
                      child: Text("Sign Up",
                      style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 27, 145, 243)),
                     )
                     ),
                    ],
                   )
                  ],
                ),
              ),
             ),
          ),
        ),
        ),
    );
  }
}