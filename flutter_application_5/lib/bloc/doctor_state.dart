import 'package:equatable/equatable.dart';
import '../models/doctor.dart';

abstract class DoctorState extends Equatable {
  @override
  List<Object> get props => [];
}

class DoctorsLoading extends DoctorState {}

class DoctorsLoaded extends DoctorState {
  final ResponseData responseData;

  DoctorsLoaded(this.responseData);

  @override
  List<Object> get props => [responseData];
}

class DoctorsError extends DoctorState {}
