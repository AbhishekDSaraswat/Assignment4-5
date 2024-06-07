import 'package:flutter/material.dart';

class Appointment {
  final String time;
  final String patientName;
  final int patientAge;

  Appointment(this.time, this.patientName, this.patientAge);
}

class DoctorProvider with ChangeNotifier {
  String _doctorName = '';
  String get doctorName => _doctorName; // Getter for doctor's name

  setDoctorName(String name) {
    _doctorName = name;
    notifyListeners();
  }

  final List<Appointment> _pendingAppointments = [
    Appointment("9:00 AM", "John Doe", 25),
    // Add more appointments
  ];

  final List<Appointment> _completedAppointments = [
    Appointment("8:00 AM", "Jane Smith", 30),
    // Add more appointments
  ];

  List<Appointment> get pendingAppointments => _pendingAppointments;
  List<Appointment> get completedAppointments => _completedAppointments;

  void logout() {
    // Handle logout
  }
}
