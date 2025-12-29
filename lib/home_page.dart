import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_62a/auth/login_page.dart';
import 'package:project_62a/note_page.dart';
import 'package:project_62a/upload_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _supabase = Supabase.instance.client;

  Future<Map<String, dynamic>?> getCurrentUser() async {
    final user = _supabase.auth.currentUser;
    if (user == null) return null;
    final res =
        await _supabase.from("profiles").select().eq('id', user.id).single();
    return res;
  }

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
          IconButton(
            onPressed: () {
              _supabase.auth.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            icon: Icon(Icons.logout),
          ),
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
                    return NotePage();
                  },
                ),
              );
            },
            leading: Icon(Icons.person),
            title: Text("Note Page"),
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
            FutureBuilder(
              future: getCurrentUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Text("Error ${snapshot.error}");
                }
                if (!snapshot.hasData) {
                  return const Text("No User Found!!");
                }
                final profile = snapshot.data as Map<String, dynamic>;
                return SizedBox(
                  width: 300,
                  height: 300,
                  child: Card(
                    color: Colors.blueGrey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (profile['avatar_url'] != null)
                          Image.network(
                            profile['avatar_url'],
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),

                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return UploadPage();
                                },
                              ),
                            );
                          },

                          child: Text("Upload Image"),
                        ),
                        SizedBox(height: 10),
                        Text("Name: ${profile['name']}"),
                        SizedBox(height: 10),
                        Text("Email: ${profile['email']}"),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              },
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NotePage();
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
              ),
              child: Text("Note Page"),
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(onPressed: () {}, child: Text("OutlinedButton")),
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
                Column(
                  children: [
                    Text(
                      "Hello!",
                      style: GoogleFonts.lobster(
                        textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(onPressed: () {}, child: Text("data")),
                  ],
                ),
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
