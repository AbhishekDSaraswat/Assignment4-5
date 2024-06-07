import 'package:flutter/material.dart';
import 'package:flutter_application_5/providers/Authentication.dart';
import 'package:provider/provider.dart';
import 'package:form_validator/form_validator.dart';
import 'package:flutter_application_5/colors/color.dart';

class RegistrationScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);

    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
     
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: mediaquery.size.width * 0.5,
              decoration: const BoxDecoration(
                  color: AppColors.backgroundColor,
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/doctor.png',
                      ),
                      fit: BoxFit.contain)),
            ),
            Expanded(
              child: Container(
                width: mediaquery.size.width * 0.5 < 500
                    ? 500
                    : mediaquery.size.width * 0.5,
                //padding: EdgeInsets.all(adaptivePadding),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(20.0), 
                    bottomLeft:
                        Radius.circular(20.0), 
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: SizedBox(
                      width: 340,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "SAPDOS",
                            style: TextStyle(
                                fontSize: 34, 
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 24, 

                                color: AppColors.primaryColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Enter new account's details"),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: authProvider.emailController,
                            decoration: InputDecoration(
                              hintText: "Email address or phone number",
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: ValidationBuilder().email().build(),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: authProvider.passwordController,
                            decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: const Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  authProvider.isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed:
                                    authProvider.togglePasswordVisibility,
                              ),
                            ),
                            obscureText: !authProvider.isPasswordVisible,
                            validator: ValidationBuilder().minLength(6).build(),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: authProvider.confirmPasswordController,
                            decoration: InputDecoration(
                              hintText: " Confirm Password",
                              prefixIcon: const Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  authProvider.isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed:
                                    authProvider.togglePasswordVisibility,
                              ),
                            ),
                            obscureText: !authProvider.isPasswordVisible,
                            validator: ValidationBuilder().minLength(6).build(),
                          ),
                          SizedBox(height: mediaquery.size.height * 0.08),
                          SizedBox(
                            width: mediaquery.size.width * 0.3,
                            height: mediaquery.size.height * 0.05,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  authProvider.signup(context);
                                }
                              },
                              child: const Text(
                                "SIGN-UP",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: mediaquery.size.height * 0.05,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: const Text(
                              "Already on Sapdos? Sign-in",
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
