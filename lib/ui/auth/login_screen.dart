import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stellar_store/const.dart';

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
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back!",
                      style: titleStyle
                    ),
                    const Text(
                      "Please Sign In with your registered account.",
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    Container(
                      height: 2,
                      width: 50,
                      color: primaryColor,
                    )
                  ],
                ),
                const SizedBox(height: defaultPadding * 2),
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
                    if (!value.endsWith('@gmail.com')) {
                      return "Please fill with valid domain";
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
                      icon: SvgPicture.asset(
                        _passwordVisible ? 'assets/icons/fi-rr-eye.svg' : 'assets/icons/fi-rr-eye-crossed.svg',
                        colorFilter: const ColorFilter.mode(textColor, BlendMode.srcIn),
                      ),
                      onPressed: () {
                       setState(() {
                         _passwordVisible = !_passwordVisible;
                       });
                      } 
                    )
                  ),
                  validator:(value) {
                    // Melakukan pengecekan 2 kali
                    if (value == null || value.isEmpty) {
                      return "Passsword is reqired";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: defaultPadding * 2),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadiusSizeMine)
                      )
                    ),
                    onPressed: () {
                      // melakukan validasi pada setiap FormField
                      if (_formKey.currentState!.validate()) {
        
                        showToast(context);
        
                        Navigator.pushReplacementNamed(context, '/main');
                      }
                    }, 
                    child: Text(
                      "Sign In",
                      style: buttonColorBgStyle
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
        borderRadius: BorderRadius.circular(borderRadiusSizeMine),  
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