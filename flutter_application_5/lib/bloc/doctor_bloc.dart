import 'package:bloc/bloc.dart';
import 'doctor_event.dart';
import 'doctor_state.dart';
import '../repositries/doctor_repository.dart';
import '../models/doctor.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final DoctorRepository repository;

  DoctorBloc(this.repository) : super(DoctorsLoading()) {
    on<LoadDoctors>((event, emit) async {
      try {
        final ResponseData responseData = await repository.fetchDoctors();
        emit(DoctorsLoaded(responseData));
      } catch (_) {
        emit(DoctorsError());
      }
    });
  }
}
