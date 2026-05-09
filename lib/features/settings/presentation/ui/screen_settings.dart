import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Settings'),
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
                  "⚙️ Settings",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Manage your account, notifications, and system preferences.",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 25),

                // Account Settings Section
                _buildSection(
                  title: "👤 Account Settings",
                  content: [
                    "Update Profile: Change your name, email, or profile picture.",
                    "Change Password: Update your password regularly for better security.",
                    "Two-Factor Authentication: Add an extra layer of protection to your account.",
                    "Logout: Securely sign out of your account from all devices.",
                  ],
                ),

                const SizedBox(height: 20),

                // Notification Preferences Section
                _buildSection(
                  title: "🔔 Notification Preferences",
                  content: [
                    "Booking Alerts: Receive alerts for new hotel bookings.",
                    "System Updates: Get notified when new features or updates are released.",
                    "Admin Messages: Receive important messages from system administrators.",
                    "Email Notifications: Enable or disable email updates.",
                  ],
                ),

                const SizedBox(height: 20),

                // System Settings Section
                _buildSection(
                  title: "🖥️ System Settings",
                  content: [
                    "Theme: Switch between Light and Dark modes.",
                    "Language: Choose your preferred language.",
                    "Data Backup: Manually back up all admin data to cloud storage.",
                    "Reset Defaults: Restore all settings to default values.",
                  ],
                ),

                const SizedBox(height: 20),

                // Privacy & Security Section
                _buildSection(
                  title: "🔒 Privacy & Security",
                  content: [
                    "Manage Access: Control user roles and permissions.",
                    "Data Privacy Policy: View how user data is handled securely.",
                    "Clear Cache: Remove temporary files for smoother performance.",
                    "Session History: Track your login sessions for security monitoring.",
                  ],
                ),

                const SizedBox(height: 20),

                // Support Section
                _buildSupportSection(),
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

  Widget _buildSupportSection() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      color: Colors.teal[50],
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("💬 Need Help?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              "If you face any technical issues or have feedback, please contact our support team:",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 8),
            Text("📧 Email: adminsupport@cocoonhotels.com",
                style: TextStyle(fontSize: 15)),
            Text("📞 Phone: +91 98765 43210", style: TextStyle(fontSize: 15)),
            Text("🕒 Support Hours: Mon–Sat, 9:00 AM – 6:00 PM",
                style: TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
