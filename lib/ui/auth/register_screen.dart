import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/ui/auth/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // const RegisterScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  var _passwordVisible = false;

  final FToast fToast = FToast();

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
                Text("Welcome!", style: bigTitleStyle),
                const Text(
                  "Sign Up with valid email and phone number.",
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

            // Name
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                icon: SvgPicture.asset(
                    'assets/icons/fi-rr-user.svg',
                    colorFilter: const ColorFilter.mode(secondaryColor, BlendMode.srcIn),
                  ),
                labelText: "Name",
                labelStyle: const TextStyle(color: secondaryColor),
                enabledBorder: enableOutlineInputBorderMine,
                focusedBorder: focusedOutlineInputBorderMine,
                errorBorder: errorOutlineInputBorderMine,
                focusedErrorBorder: focusErrorOutlineInputBorderMine,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Name is reqired";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Phone Number
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                  icon: SvgPicture.asset(
                    'assets/icons/fi-rr-phone-call.svg',
                    colorFilter: const ColorFilter.mode(secondaryColor, BlendMode.srcIn),
                  ),
                  labelText: "Phone Number",
                  labelStyle: const TextStyle(color: secondaryColor),
                  enabledBorder: enableOutlineInputBorderMine,
                  focusedBorder: focusedOutlineInputBorderMine,
                  errorBorder: errorOutlineInputBorderMine,
                  focusedErrorBorder: focusErrorOutlineInputBorderMine),
              // If else buat login.
              validator: (value) {
                //  Jika gak ada value maka muncul pesan.
                if (value == null || value.isEmpty) {
                  return "Phone number is required!";
                }
                // Tapi jika ada, maka dia gak return apa-apa. Paling ke homepage :v
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Email
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  icon: SvgPicture.asset(
                    'assets/icons/fi-rr-envelope.svg',
                    colorFilter: const ColorFilter.mode(secondaryColor, BlendMode.srcIn),
                  ),
                  labelText: "Email",
                  labelStyle: const TextStyle(color: secondaryColor),
                  enabledBorder: enableOutlineInputBorderMine,
                  focusedBorder: focusedOutlineInputBorderMine,
                  errorBorder: errorOutlineInputBorderMine,
                  focusedErrorBorder: focusErrorOutlineInputBorderMine),
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
            TextFormField(
              controller: _passwordController,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                  icon: SvgPicture.asset(
                    'assets/icons/fi-rr-key.svg',
                    colorFilter: const ColorFilter.mode(secondaryColor, BlendMode.srcIn),
                  ),
                  labelText: "Password",
                  labelStyle: const TextStyle(color: secondaryColor),
                  enabledBorder: enableOutlineInputBorderMine,
                  focusedBorder: focusedOutlineInputBorderMine,
                  errorBorder: errorOutlineInputBorderMine,
                  focusedErrorBorder: focusErrorOutlineInputBorderMine,
                  suffixIcon: IconButton(
                    icon: SvgPicture.asset(
                      _passwordVisible
                          ? 'assets/icons/fi-rr-eye.svg'
                          : 'assets/icons/fi-rr-eye-crossed.svg',
                      colorFilter:
                          const ColorFilter.mode(textColor, BlendMode.srcIn),
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Passsword is reqired";
                }
                return null;
              },
            ),
            const SizedBox(height: 20 * 2),

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
                    if (_formKey.currentState!.validate()) {
                      String name = _nameController.text;
                      // It SHOWS the toast yey, tapi widgetnya dipisah. Gak tau bisanya kek gini =D
                      showToast(context, name);

                      Navigator.pushReplacementNamed(context, '/main');
                    }
                  },
                  child: Text(
                    "Sign Up",
                    style: buttonColorBgStyle,
                  )),
            ),
            const SizedBox(height: defaultPadding * 2),

            // Text Button
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: const Text(
                  "Already have account? Sign in",
                  style: TextStyle(color: textColor),
                ))
          ],
        ),
      ),
    ));
  }
}

void showToast(BuildContext context, String name) {  
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
          "Sign Up Success!",
          style: titleStyle
        ),
        subtitle: Text(
          "Welcome $name! to StellarStore!",  
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
