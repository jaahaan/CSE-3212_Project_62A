import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_62a/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        // leading: Icon(Icons.home, color: Colors.amber),
        title: Text("HomePage"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),

      drawer: NavigationDrawer(
        children: [
          DrawerHeader(
            child: UserAccountsDrawerHeader(
              accountName: Text("Name"),
              accountEmail: Text("Email"),
              currentAccountPicture: Image.asset("assets/images/flutter.png"),
              currentAccountPictureSize: Size(50, 50),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProfilePage();
                  },
                ),
              );
            },
            leading: Icon(Icons.person),
            title: Text("Profile"),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Hello, Welcome to our project!!",
              style: GoogleFonts.lobster(
                textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
                fixedSize: Size(100, 20),
              ),
              child: Text("Click"),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
                fixedSize: Size(100, 20),
                shape: ContinuousRectangleBorder(),
              ),
              child: Text("Hello"),
            ),
            SizedBox(height: 20),

            OutlinedButton(onPressed: () {}, child: Text("OutlinedButton")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(
                //   'assets/images/images.jpeg',
                //   height: 400,
                //   fit: BoxFit.fill,
                // ),
                // Image.network(
                //   "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=500",
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
