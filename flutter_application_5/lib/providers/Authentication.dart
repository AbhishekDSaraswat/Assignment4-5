import 'package:flutter/material.dart';
import 'package:flutter_application_5/providers/doctor.dart';
import 'package:provider/provider.dart';

class AuthProvider with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _rememberMe = false;

  bool get rememberMe => _rememberMe;
  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void setRememberMe(bool? value) {
    _rememberMe = value ?? false;
    notifyListeners();
  }

  String? getName() {
    for (int i = 0; i < _users.length; i++) {
      if (_users[i]['email'] == emailController.text.toString()) {
        return _users[i]['name'];
      }
    }
    return "User";
  }

  final List<Map<String, String>> _users = [
    {
      "email": "pradeep@gmail.com",
      "name": "pradeep naroliya",
      "phoneNumber": "123457890",
      "password": "9876543210"
    },
    {
      "email": "Architsaxena@gmail.com",
      "name": "Archit saxena",
      "phoneNumber": "123457890",
      "password": "9876543210"
    },
    {
      "email": "Abhishek@gmail.com",
      "name": "Abhishek saraswat",
      "phoneNumber": "123457890",
      "password": "9876543210"
    },
  ];
  void login(BuildContext context) {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter both email and password")),
      );
      return;
    }

    final user = _users.firstWhere(
      (user) =>
          (user['email'] == email || user['phoneNumber'] == email) &&
          user['password'] == password,
      orElse: () => {"email": "", "phoneNumber": "", "password": ""},
    );

    if (user["email"]!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid credentials")),
      );
    } else {
      // Set the doctor's name in the DoctorProvider
      Provider.of<DoctorProvider>(context, listen: false)
          .setDoctorName(user["email"]!);
      Navigator.pushReplacementNamed(context, '/doctor');
    }
  }

  void signup(BuildContext context) {
    // Handle signup
    Navigator.pushReplacementNamed(context, '/doctor');
  }
}
