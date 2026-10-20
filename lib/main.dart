import 'package:flutter/material.dart';

// All three packages are already in pubspec.yaml. Uncomment each import when we get to it.
// import 'package:cached_network_image/cached_network_image.dart'; // Step 2
// import 'package:shared_preferences/shared_preferences.dart'; // Step 6
// import 'package:url_launcher/url_launcher.dart'; // Step 12

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // A big photo on purpose (about 2 MB), so you can tell when it's downloading.
  // Its server allows requests from Chrome (CORS). Android doesn't need that, but web does.
  String myImage = "https://people.rit.edu/~jxtadm/340/nms_big.jpg";

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  // TODO Step 6: late SharedPreferences myPrefs;

  // TODO Step 7: initState() and init()

  // TODO Step 8: saveText()

  // TODO Step 9: loadText()

  // TODO Step 12: myURL and openURL()

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Week 9A"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== Part 1: Images =====
              Text(
                "Same photo, three ways",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      // The SizedBox holds this spot's size even when the download fails.
                      SizedBox(
                        width: 110,
                        height: 110,
                        child: Image.network(myImage, fit: BoxFit.cover),
                      ),
                      Text("Image.network"),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(myImage), // TODO Step 5
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(color: Colors.black, width: 3),
                        ),
                        child: Text(
                          "Hello",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Text("Container"),
                    ],
                  ),
                  Column(
                    children: [
                      // TODO Step 2: replace this SizedBox with a CachedNetworkImage
                      SizedBox(width: 110, height: 110),
                      Text("Cached"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),

              // ===== Part 2: Saving data =====
              Text(
                "Remember me",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // TODO Step 8: call saveText()
                    },
                    child: Text("Save"),
                  ),
                  SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      // TODO Step 9: call loadText()
                    },
                    child: Text("Load"),
                  ),
                ],
              ),
              SizedBox(height: 24),

              // ===== Part 3: Opening links =====
              Text(
                "Leave the app",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // TODO Step 12: call openURL()
                },
                child: Text("Open RIT"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
