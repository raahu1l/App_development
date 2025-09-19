import 'package:flutter/material.dart';

void main() => runApp(const ProfileApp());

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfileScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedTab = 0;

  final tabTitles = [
    'Info',
    'Activity',
    'Notifications',
    'Messages',
    'Tasks',
    'Stats',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade800, Colors.blue.shade300],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 36,
                        child: Icon(Icons.person, size: 48, color: Colors.blue),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Jane Doe',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Level 15',
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.white70,
                thickness: 0.5,
                indent: 20,
                endIndent: 20,
              ),
              drawerItem(Icons.contact_mail, 'Contact Us'),
              drawerItem(Icons.support_agent, 'Support'),
              drawerItem(Icons.help_outline, 'Help'),
              drawerItem(Icons.settings, 'Settings'),
              drawerItem(Icons.logout, 'Log Out'),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        elevation: 4,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text(
          'PROFILE',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.shade100.withOpacity(0.6),
                  blurRadius: 10,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(tabTitles.length, (i) {
                final selected = selectedTab == i;
                return Expanded(
                  child: InkWell(
                    onTap: () => setState(() => selectedTab = i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: selected
                            ? Colors.blue.shade700
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        tabTitles[i],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: selected
                              ? FontWeight.bold
                              : FontWeight.w600,
                          color: selected
                              ? Colors.white
                              : Colors.blueGrey.shade900,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade200, Colors.blue.shade50],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: SizedBox(
                  width: 380,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    children: [
                      Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadowColor: Colors.blue.shade300,
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 66,
                                backgroundColor: Colors.grey.shade300,
                                child: const Icon(
                                  Icons.person,
                                  size: 100,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Jane Doe',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Level 15',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        child: getTabContent(selectedTab),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerItem(IconData icon, String label) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  Widget getTabContent(int index) {
    switch (index) {
      case 0:
        return buildInfo();
      case 1:
        return buildActivity();
      case 2:
        return buildNotifications();
      case 3:
        return buildMessages();
      case 4:
        return buildTasks();
      case 5:
        return buildStats();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget buildInfo() {
    return cardWrapper(
      key: const ValueKey('Info'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          infoRow(Icons.phone, 'Phone: (555-123-667)'),
          infoRow(Icons.email, 'Email: jane.doe@gmail.com'),
          infoRow(Icons.location_on, 'Location: New York, USA'),
          infoRow(Icons.link, 'Links: @janedoe , www.doe.com'),
          infoRow(Icons.calendar_today, 'Account Created on 12 March 2025'),
        ],
      ),
    );
  }

  Widget buildActivity() {
    final activities = [
      'Logged in 2 Hours ago',
      'Updated profile picture yesterday',
      'Changed password 3 hours ago',
      'Added new post on April 10 2025',
      'Commented on a post on 20 April 2025',
      'Completed onboarding tutorial last week',
      'Visited Settings page 2 months ago',
      'Connected with 5 new friends in last 3 months',
    ];

    return cardWrapper(
      key: const ValueKey('Activity'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: activities.map(activityBullet).toList(),
      ),
    );
  }

  Widget buildNotifications() {
    final notifications = [
      'Your password will expire in 5 days.',
      'New login from Chrome on Windows.',
      'Scheduled maintenance on Sep 20, 2025.',
    ];

    return cardWrapper(
      key: const ValueKey('Notifications'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: notifications.map(activityBullet).toList(),
      ),
    );
  }

  Widget buildMessages() {
    final messages = [
      'Message from Admin: Welcome to the platform!',
      'Reminder: Update your profile details.',
      'Offer: Get 20% off premium membership.',
    ];

    return cardWrapper(
      key: const ValueKey('Messages'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: messages.map(activityBullet).toList(),
      ),
    );
  }

  Widget buildTasks() {
    final tasks = [
      'Complete profile verification.',
      'Upload a profile picture.',
      'Connect with 3 new friends.',
      'Review community guidelines.',
    ];

    return cardWrapper(
      key: const ValueKey('Tasks'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: tasks.map(activityBullet).toList(),
      ),
    );
  }

  Widget buildStats() {
    return cardWrapper(
      key: const ValueKey('Stats'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Statistics & Performance',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          buildStatRow('Posts', 123),
          buildStatRow('Followers', 456),
          buildStatRow('Following', 78),
          buildStatRow('Likes Received', 342),
        ],
      ),
    );
  }

  Widget cardWrapper({Key? key, required Widget child}) {
    return Card(
      key: key,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(padding: const EdgeInsets.all(22), child: child),
    );
  }

  Widget buildStatRow(String title, int number) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          Text(
            number.toString(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget infoRow(IconData icon, String data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue.shade800),
          const SizedBox(width: 12),
          Flexible(child: Text(data, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }

  Widget activityBullet(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(Icons.circle, size: 9, color: Colors.blue.shade900),
          const SizedBox(width: 13),
          Flexible(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
