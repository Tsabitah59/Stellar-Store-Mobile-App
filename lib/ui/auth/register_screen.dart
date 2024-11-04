import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/ui/auth/login_screen.dart';
import 'package:stellar_store/ui/home/home_page.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // const RegisterScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  var _passwordVisible = false;

  final FToast fToast = FToast();

  @override
  Widget build(BuildContext context) {

      return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Your Email",
                  labelStyle: const TextStyle(
                    color: secondaryColor
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: secondaryColor
                    ),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: primaryColor
                    ),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Colors.red
                    ),
                    borderRadius: BorderRadius.circular(20.0)
                  )
                ),
                // If else buat login.
                validator: (value) {
                  //  Jika gak ada value maka muncul pesan. 
                  if (value == null || value.isEmpty) {
                    return "Email is required!";
                  }
                // Tapi jika ada, maka dia gak return apa-apa. Paling ke homepage :v 
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  labelText: "Your Password",
                  labelStyle: const TextStyle(
                    color: secondaryColor
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: secondaryColor
                    ),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: primaryColor
                    ),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Colors.red
                    ),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible ? Icons.visibility : Icons.visibility_off
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    }, 
                  )
                ),
                validator:(value) {
                  if (value == null || value.isEmpty) {
                    return "Passsword is reqired";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: const TextStyle(
                    color: secondaryColor
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: secondaryColor
                    ),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: primaryColor
                    ),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Colors.red
                    ),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name is reqired";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // It SHOWS the toast yey, tapi widgetnya dipisah. Gak tau bisanya kek gini =D
                      showToast(context);

                      Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => const HomePage())
                      );
                    }
                  }, 
                  child: const Text("Sign Up")
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => LoginScreen())
                  );
                }, 
                child: const Text(
                  "Already have account? Sign in"
                )
              )
            ],
          ),
        ),
      )
    );
  }
}

void showToast(BuildContext context) {  
  FToast fToast = FToast();  
  fToast.init(context);  

  Widget toast = Container(  
    width: double.infinity,  
    height: 600,
    decoration: BoxDecoration(  
      border: Border.all(color: primaryColor),
      borderRadius: BorderRadius.circular(20.0),  
      color: Colors.white,  
    ),  
    padding: const EdgeInsets.all(defaultPadding),  
    child: const Column(
      children: [
        Text(
          "Success!",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: defaultPadding / 2),
        Text(  
          "Welcome to StellarStore!",  
          textAlign: TextAlign.center,  
          style: TextStyle(
            color: textColor,
            fontSize: 14
          ),  
        ),
      ],
    ),  
  );  

  fToast.showToast(  
    child: toast,  
    gravity: ToastGravity.CENTER,  
    toastDuration: const Duration(seconds: 5),  
  );  
}  
