import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/doctor.dart';

class DoctorRepository {
  Future<ResponseData> fetchDoctors() async {
    try {
      // Load JSON file from assets
      final jsonString =
          await rootBundle.loadString('assets/json/doctors.json');

      // Parse the JSON data
      final jsonResponse = json.decode(jsonString);

      // Convert JSON to ResponseData object
      final responseData = ResponseData.fromJson(jsonResponse);

      return responseData;
    } catch (e) {
      throw Exception('Failed to load doctors');
    }
  }
}
