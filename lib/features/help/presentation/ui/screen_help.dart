import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Help & Support'),
        backgroundColor: Colors.grey[50],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "🛎️ Help & Support",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Welcome, Admin! Find guidance for managing hotels, users, and bookings.",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 25),

                // Hotel Management Section
                _buildSection(
                  title: "🏨 Hotel Management",
                  content: [
                    "Add New Hotel: Go to the Hotels section → 'Add Hotel' → Fill in details like name, location, price, and amenities.",
                    "Edit Hotel: Click the Edit icon beside a hotel to update its details.",
                    "Remove a Hotel: Select the hotel → 'Delete' (this action is permanent).",
                  ],
                ),

                const SizedBox(height: 20),

                // User & Permission Control Section
                _buildSection(
                  title: "👥 User & Permission Control",
                  content: [
                    "Grant Access: In the Permissions section, assign roles (Manager, Staff, Viewer).",
                    "Revoke Access: Select a user and click 'Remove Permission' to restrict access.",
                    "View Activity Logs: Track admin activities in the Reports tab.",
                  ],
                ),

                const SizedBox(height: 20),

                // Booking Overview Section
                _buildSection(
                  title: "🧾 Bookings Overview",
                  content: [
                    "View all active and past bookings in the Reports section.",
                    "Filter bookings by date, hotel, or status.",
                    "Update booking status (Confirmed / Canceled / Completed) directly from the list.",
                  ],
                ),

                const SizedBox(height: 20),

                // Technical Issues Section
                _buildSection(
                  title: "⚙️ Technical Issues",
                  content: [
                    "Loading errors: Try refreshing the page or checking your internet connection.",
                    "Data not updating: Ensure your Firebase/Server connection is active.",
                    "UI issues: Clear browser cache or try another browser.",
                  ],
                ),

                const SizedBox(height: 20),

                // Contact Support Section
                _buildContactSection(),

                const SizedBox(height: 20),

                // Tips Section
                _buildSection(
                  title: "💡 Tips",
                  content: [
                    "Regularly back up your data.",
                    "Always log out from shared devices.",
                    "Check for app updates to get the latest features and fixes.",
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required List<String> content}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...content.map(
              (line) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("• ",
                        style: TextStyle(fontSize: 18, color: Colors.teal)),
                    Expanded(
                      child: Text(line,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black87)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactSection() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      color: Colors.teal[50],
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("💬 Contact Support",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("📧 Email: akshay08032002@gmail.com",
                style: TextStyle(fontSize: 15)),
            Text("📞 Phone: +91 97467 32747", style: TextStyle(fontSize: 15)),
            Text("🕒 Support Hours: Mon–Sat, 9:00 AM – 6:00 PM",
                style: TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
