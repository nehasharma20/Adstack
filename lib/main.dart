import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Root widget
        home: Scaffold(
          appBar: AppBar(
            title: const Text('AdStack'),
            actions: [
              IconButton(onPressed: (){
              }, icon: Icon(Icons.search))
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue, // Customize header color
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        // Replace with user profile image
                        radius: 30,
                        backgroundImage: NetworkImage('https://hips.hearstapps.com/hmg-prod/images/dahlia-1508785047.jpg?crop=1.00xw:0.669xh;0,0.0136xh&resize=980:*'),
                      ),
                      SizedBox(height: 8),
                      Text('Pooja Mishra', style: TextStyle(color: Colors.white, fontSize: 16)),
                      Text('Admin', style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    // Navigate to Home screen
                    Navigator.pop(context); // Close the drawer
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text('Employees'),
                  onTap: () {
                    // Navigate to Employees screen
                    Navigator.pop(context);
                  },
                ),
                // ... other navigation items
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('WORKSPACES', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                ListTile(
                  title: Text('Adstacks'),
                  onTap: () {
                    // Handle Adstacks workspace
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Finance'),
                  onTap: () {
                    // Handle Finance workspace
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Setting'),
                  onTap: () {
                    // Navigate to Settings
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: () {
                    // Handle logout
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),

      body: SingleChildScrollView(
       padding: const EdgeInsets.all(16.0),
       child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
    // Top Section: Top Rating Project and Right Sidebar
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
    // Top Rating Project Card (Left)
               Expanded(
                 flex: 2, // Adjust flex as needed
                 child: _buildTopRatingProjectCard(),
               ),
            SizedBox(width: 16.0),
    // Right Sidebar (General Info, Birthday, Anniversary)
               Expanded(
                   flex: 1, // Adjust flex as needed
    child: Column(
    children: [
    _buildGeneralInfoCard(),
    SizedBox(height: 16.0),
    _buildBirthdayCard(),
    SizedBox(height: 16.0),
    _buildAnniversaryCard(),
    ],
    ),
    ),
    ],
    ),
    SizedBox(height: 16.0),

    // Middle Section: All Projects and Top Creators
    Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    // All Projects (Left)
    Expanded(
    flex: 1, // Adjust flex as needed
    child: _buildAllProjectsSection(),
    ),
    SizedBox(width: 16.0),
    // Top Creators (Right)
    Expanded(
    flex: 1, // Adjust flex as needed
    child: _buildTopCreatorsSection(),
    ),
    ],
    ),
    SizedBox(height: 16.0),

    // Bottom Section: Over All Performance
    _buildPerformanceChart(),
    ],
    ),

    ),
        )
    );
  }
  // Widget for the "Top Rating Project" card
  Widget _buildTopRatingProjectCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ETHEREUM 2.0',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 8.0),
            Text(
              'Top Rating Project',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Trending project and high rating project created by team.',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle Learn More action
              },
              child: Text('Learn More.'),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for the "General 10:00 AM to 7:00 PM" and Calendar card
  Widget _buildGeneralInfoCard() {
    final now = DateTime.now();
    final firstDayOfMonth = DateTime(now.year, now.month, 1);
    final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
    final daysInMonth = lastDayOfMonth.day;
    final weekdayOfFirstDay = firstDayOfMonth.weekday; // 1 for Monday, 7 for Sunday

    // Get the current day
    final currentDay = now.day;

    // Month abbreviations
    const monthAbbreviations = [
      '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];

    // Day abbreviations
    const dayAbbreviations = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'GENERAL 10:00 AM to 7:00 PM',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
            ),
            SizedBox(height: 6.0),
            // Calendar Widget
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Month and Year
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      '${monthAbbreviations[now.month]} ${now.year}',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                    ),
                  ),
                  // Days of the week
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: dayAbbreviations.map((day) =>
                        Text(day, style: TextStyle(fontSize: 8.0, color: Colors.grey))).toList(),
                  ),
                  SizedBox(height: 4.0),
                  // Calendar days grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: daysInMonth + weekdayOfFirstDay - 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 2.0,
                      childAspectRatio: 1.0,
                    ),
                    itemBuilder: (context, index) {
                      if (index < weekdayOfFirstDay - 1) {
                        // Empty cells for days before the first day of the month
                        return SizedBox.shrink();
                      }
                      final day = index - weekdayOfFirstDay + 2;
                      final isCurrentDay = day == currentDay;
                      return Center(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isCurrentDay ? Colors.blue : null,
                          ),
                          padding: EdgeInsets.all(isCurrentDay ? 2.0 : 0),
                          child: Text(
                            '$day',
                            style: TextStyle(
                              fontSize: 8.0,
                              color: isCurrentDay ? Colors.white : Colors.black,
                              fontWeight: isCurrentDay ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for the "General 10:00 AM to 7:00 PM" and Calendar card
  // Widget _buildGeneralInfoCard() {
  //   return Card(
  //     child: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             'GENERAL 10:00 AM to 7:00 PM',
  //             style: TextStyle(fontWeight: FontWeight.bold),
  //           ),
  //           SizedBox(height: 8.0),
  //           // Placeholder for the calendar widget
  //           Container(
  //             height: 100.0, // Adjust height as needed
  //             width: double.infinity,
  //             color: Colors.grey[200], // Placeholder color
  //             child: Center(child: Text('Calendar Widget')),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // // Widget for the "Today Birthday" card
  Widget _buildBirthdayCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.cake, color: Colors.orange),
                SizedBox(width: 8.0),
                Text(
                  'Today Birthday',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            // Placeholder for birthday profiles
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(child: Text('P1')), // Placeholder
                CircleAvatar(child: Text('P2')), // Placeholder
              ],
            ),
            SizedBox(height: 8.0),
            Text('Total', style: TextStyle(color: Colors.grey)),
            Text('2', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle Birthday Wishing action
              },
              child: Text('Birthday Wishing'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for the "Anniversary" card
  Widget _buildAnniversaryCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.favorite, color: Colors.pink),
                SizedBox(width: 8.0),
                Text(
                  'Anniversary',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            // Placeholder for anniversary profiles
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(child: Text('A1')), // Placeholder
                CircleAvatar(child: Text('A2')), // Placeholder
                CircleAvatar(child: Text('A3')), // Placeholder
              ],
            ),
            SizedBox(height: 8.0),
            Text('Total', style: TextStyle(color: Colors.grey)),
            Text('3', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle Anniversary Wishing action
              },
              child:Text('Anniversary Wishing'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for the "All Projects" section
  Widget _buildAllProjectsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Projects',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            // Placeholder for project list items
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // To avoid nested scrolling issues
              itemCount: 3, // Example number of projects
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 40.0,
                          height: 40.0,
                          color: Colors.blue[100], // Placeholder image/color
                          child: Icon(Icons.folder, color: Colors.blue),
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Technology behind the Blockchain', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text('Project details...', style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ),
                        Icon(Icons.more_vert),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget for the "Top Creators" section
  Widget _buildTopCreatorsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Creators',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            // Placeholder for top creators list
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4, // Example number of creators
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      CircleAvatar(child: Text('C${index + 1}')), // Placeholder avatar
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Text('Creator Name ${index + 1}', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Text('${(index + 1) * 100}', style: TextStyle(color: Colors.grey)), // Placeholder artworks
                      SizedBox(width: 8.0),
                      // Placeholder for rating bars
                      Container(
                        width: 50.0,
                        height: 10.0,
                        color: Colors.blue[200], // Placeholder rating bar
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget for the "Over All Performance" chart
  Widget _buildPerformanceChart() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Over All Performance',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            Text(
              'The Years',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 16.0),
            // Placeholder for the chart
            Container(
              height: 150.0, // Adjust height as needed
              width: double.infinity,
              color: Colors.grey[200], // Placeholder color
              child: Center(child: Text('Performance Chart')),
              // In a real implementation, you would use a widget like FlChart here
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildChartLegend('Pending', Colors.orange),
                SizedBox(width: 16.0),
                _buildChartLegend('Project Done', Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for chart legend
  Widget _buildChartLegend(String text, Color color) {
    return Row(
      children: [
        Container(width: 10.0, height: 10.0, color: color),
        SizedBox(width: 4.0),
        Text(text, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
