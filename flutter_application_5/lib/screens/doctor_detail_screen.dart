import 'package:flutter/material.dart';
import '../models/doctor.dart';

class DoctorDetailScreen extends StatelessWidget {
  final Doctor doctor;

  const DoctorDetailScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDoctorInfo(),
              const SizedBox(height: 20),
              _buildAvailableSlots(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.network(
            doctor.doctorImage,
            width: 120,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    doctor.doctorName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text("      "),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        Icons.star,
                        size: 16,
                        color: index < 3 ? Colors.amber : Colors.grey,
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.medical_services, size: 16),
                  const SizedBox(width: 4),
                  Text(doctor.specialization),
                  const Text("      "),
                  const Icon(Icons.school, size: 16),
                  const SizedBox(width: 4),
                  const Text('5 Years'),
                ],
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(19, 35, 90, 1),
                    ),
                  ),
                  Text(
                      "Dr. ${doctor.doctorName}, is a highly esteemed physician renowned for her exceptional expertise in the field of internal medicine. With over two decades of experience, ${doctor.doctorName} is dedicated to providing compassionate care to her patients. Her warm demeanor and thorough approach make her a trusted figure in the medical community. Patients commend her for her clear communication style and ability to explain complex medical concepts in easily understandable terms.Docs commitment to staying abreast of the latest advancements ensures that her patients receive the highest standard of care. Whether diagnosing ailments or offering preventive health advice,Doc is committed to helping her patients achieve optimal health and well-being.")
                ],
              ),
              const SizedBox(height: 8),
             
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAvailableSlots(BuildContext context) {
    List<String> timeSlots = [
      '10:00 - 10:15 AM',
      '11:00 - 11:15 AM',
      '12:00 - 12:15 AM',
      '13:00 - 13:15 AM',
      '13:00 - 13:15 AM',
      '13:00 - 13:15 AM',
    ];

    String? selectedTimeSlot;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MaterialBanner(
          content: Text(
            'Available slots',
            style: TextStyle(color: Colors.white),
          ),
          leading: Icon(
            Icons.timer,
            color: Colors.white,
          ),
          backgroundColor: Color.fromRGBO(19, 35, 90, 1),
          actions: <Widget>[
            Icon(
              Icons.calendar_month,
              color: Colors.white,
            ),
          ],
        ),
        const SizedBox(height: 8),
        StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 2,
              childAspectRatio: 8,
              children: List.generate(timeSlots.length, (index) {
                return Card(
                  color: const Color.fromRGBO(240, 242, 245, 1),
                  child: RadioListTile<String>(
                    value: timeSlots[index],
                    groupValue: selectedTimeSlot,
                    title: Text(timeSlots[index]),
                    onChanged: (value) {
                      setState(() {
                        selectedTimeSlot = value;
                      });
                    },
                    activeColor: Colors.blueGrey,
                  ),
                );
              }),
            );
          },
        ),
        const SizedBox(height: 16),
        Center(
          child: ElevatedButton(
            onPressed: () {
              // Add your booking logic here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(19, 35, 90, 1),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text('Book Appointment'),
          ),
        ),
      ],
    );
  }
}
