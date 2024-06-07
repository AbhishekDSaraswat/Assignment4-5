import 'package:flutter/material.dart';
import 'package:flutter_application_5/providers/Authentication.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_5/colors/color.dart';
import 'package:flutter_application_5/subpartofdisplay/appointment_progress.dart';
import 'package:flutter_application_5/screens/home_screen.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  // const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<AuthProvider>(context);
    var mediaquery = MediaQuery.of(context);
    var screenWidth = mediaquery.size.width;
    var screenHeight = mediaquery.size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // Sidebar
          Container(
            width: screenWidth * 0.16 < 300 ? 300 : screenWidth * 0.16,
            color: AppColors.primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'SAPDOS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _buildSidebarItem(Icons.dashboard, 'Categories'),
                _buildSidebarItem(Icons.calendar_today, 'Appointment'),
                _buildSidebarItem(Icons.chat, 'Chat'),
                _buildSidebarItem(Icons.settings, 'Settings'),
                _buildSidebarItem(Icons.logout, 'Logout'),
              ],
            ),
          ),
          // Main Content Area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hello!',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Dr. ${authprovider.getName()}",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                            'assets/images/person.jpg'), // Replace with actual image path
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Statistics
                  const Row(
                    children: [
                      AppointmentProgressItem(
                        title: "Pending Appointments",
                        total: 40,
                        progress: 19,
                      ),
                      SizedBox(width: 20),
                      // _buildStatCard('Completed Appointments', '21/40'),
                      AppointmentProgressItem(
                        title: "Completed Appointments",
                        total: 40,
                        progress: 21,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Appointments List
                  Expanded(
                    child: ListView(
                      children: [
                        AppointmentItem(
                          '10:00 AM',
                          'shivansh',
                          '24 years',
                          false,
                          () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen())),
                        ),
                        AppointmentItem(
                          '10:15 AM',
                          'prateek',
                          '13 years',
                          true,
                          () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen())),
                        ),
                        AppointmentItem(
                          '10:30 AM',
                          'devansh',
                          '19 years',
                          false,
                          () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen())),
                        ),
                        AppointmentItem(
                          '10:45 AM',
                          'sankalp',
                          '22 years',
                          true,
                          () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen())),
                        ),
                        AppointmentItem(
                          '11:00 AM',
                          'akshay',
                          '56',
                          true,
                          () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen())),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String count) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Text(
              count,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentItem(
      String time, String name, String age, bool isCompleted) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(isCompleted ? Icons.check_circle : Icons.schedule,
              color: isCompleted ? Colors.green : Colors.red),
          const SizedBox(width: 10),
          Text(time, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: const TextStyle(fontSize: 16)),
                  Text(age, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// *********************************************************

class AppointmentItem extends StatelessWidget {
  final String time;
  final String patientName;
  final String age;
  final bool isConfirmed;
  final VoidCallback onTap;

  AppointmentItem(
      this.time, this.patientName, this.age, this.isConfirmed, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: ListTile(
          title: Text('$time - $patientName - $age'),
          trailing: isConfirmed ? Icon(Icons.check) : Icon(Icons.close),
        ),
      ),
    );
  }
}
