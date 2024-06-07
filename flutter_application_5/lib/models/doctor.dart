class User {
  final String greeting;
  final String name;
  final String avatar;

  User({required this.greeting, required this.name, required this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      greeting: json['greeting'],
      name: json['name'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'greeting': greeting,
      'name': name,
      'avatar': avatar,
    };
  }
}

// models/doctor.dart
class Doctor {
  final String doctorImage;
  final String doctorName;
  final String specialization;
  final String appointmentIcon;
  final int price;

  Doctor({
    required this.doctorImage,
    required this.doctorName,
    required this.specialization,
    required this.appointmentIcon,
    required this.price,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      doctorImage: json['doctorImage'],
      doctorName: json['doctorName'],
      specialization: json['specialization'],
      appointmentIcon: json['appointmentIcon'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctorImage': doctorImage,
      'doctorName': doctorName,
      'specialization': specialization,
      'appointmentIcon': appointmentIcon,
      'price': price,
    };
  }
}

// models/response.dart
class ResponseData {
  final User user;
  final List<Doctor> doctorsList;

  ResponseData({required this.user, required this.doctorsList});

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    var doctorsListFromJson = json['doctorsList'] as List;
    List<Doctor> doctorsList =
        doctorsListFromJson.map((i) => Doctor.fromJson(i)).toList();

    return ResponseData(
      user: User.fromJson(json['user']),
      doctorsList: doctorsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'doctorsList': doctorsList.map((doctor) => doctor.toJson()).toList(),
    };
  }
}
