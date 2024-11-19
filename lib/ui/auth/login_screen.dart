import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/ui/auth/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // const LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _passwordVisible = false;

  FToast fToast = FToast();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome Back!",
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
                  enabledBorder: enableOutlineInputBorderMine,
                  focusedBorder: focusedOutlineInputBorderMine,
                  errorBorder: errorOutlineInputBorderMine,
                  focusedErrorBorder: focusErrorOutlineInputBorderMine
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
                  enabledBorder: enableOutlineInputBorderMine,
                  focusedBorder: focusedOutlineInputBorderMine,
                  errorBorder: errorOutlineInputBorderMine,
                  focusedErrorBorder: focusErrorOutlineInputBorderMine,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible ? Icons.visibility : Icons.visibility_off
                    ),
                    onPressed: () {
                     setState(() {
                       _passwordVisible = !_passwordVisible;
                     });
                    } 
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
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {

                      showToast(context);

                      Navigator.pushReplacementNamed(context, '/main');
                    }
                  }, 
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                    ),
                  )
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/register');
                }, 
                child: const Text(
                  "Not have account? Sign up",
                  style: TextStyle(
                    color: textColor
                  ),
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

  Widget toast = Padding(
    padding: const EdgeInsets.symmetric(vertical: defaultPadding),
    child: Container(  
      width: double.infinity,  
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
            "Welcome back! Nice to see you again.",  
            textAlign: TextAlign.center,  
            style: TextStyle(
              color: textColor,
              fontSize: 14
            ),  
          ),
        ],
      ),  
    ),
  );  

  fToast.showToast(  
    child: toast,  
    gravity: ToastGravity.BOTTOM,  
    toastDuration: const Duration(seconds: 3),  
  );  
}  