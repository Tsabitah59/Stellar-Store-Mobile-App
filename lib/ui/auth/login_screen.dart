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
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(borderRadiusSizeMine * 1.5),
                child: Image.asset(
                  'assets/illustration/logo.png',
                  width: 100,
                ),
              ),
              const SizedBox(height: defaultPadding * 2),

              // Text Sambutan
              Column(                  
                children: [
                  Text(
                    "Welcome Back!",
                    style: bigTitleStyle
                  ),
                  const Text(
                    "Sign In with your registered account.",
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

              // Email
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  icon: SvgPicture.asset(
                    'assets/icons/fi-rr-envelope.svg',
                    colorFilter: const ColorFilter.mode(secondaryColor, BlendMode.srcIn),
                  ),
                  labelText: "Email",
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

              // Password
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      icon: SvgPicture.asset(
                        'assets/icons/fi-rr-key.svg',
                        colorFilter: const ColorFilter.mode(secondaryColor, BlendMode.srcIn),
                      ),
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
                          colorFilter: const ColorFilter.mode(secondaryColor, BlendMode.srcIn),
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
                  TextButton(
                    onPressed: () {}, 
                    child: const Text(
                      "Forgot Password?",
                      textAlign:TextAlign.end,
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                  const SizedBox(height: defaultPadding * 2),
                ],
              ),

              // Input Button
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: [shadowMine]
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadiusSizeMine)
                    ),
                    elevation: 0,
                    shadowColor: Colors.transparent
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

              // Switch
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
    padding: const EdgeInsets.symmetric(vertical: 0),
    child: Container(  
      width: double.infinity,  
      decoration: BoxDecoration(  
        borderRadius: BorderRadius.circular(borderRadiusSizeMine),  
        color: Colors.white,  
        boxShadow: [shadowDieMine]
      ),  
      padding: const EdgeInsets.all(defaultPadding),  
      child: ListTile(
        leading: Image.asset(
          'assets/illustration/checked.png'
        ),
        title: Text(
          "Sign In Success!",
          style: titleStyle
        ),
        subtitle: const Text(
          "Nice to see you again.",  
        ),
      )
    )
  );  

  fToast.showToast(  
    child: toast,  
    gravity: ToastGravity.BOTTOM,  
    toastDuration: const Duration(seconds: 3),  
  );  
}  