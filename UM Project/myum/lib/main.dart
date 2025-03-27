import 'package:flutter/material.dart';
import 'package:myum/customcard.dart';
import 'dashboard.dart';

void main() {
  runApp(const MyUM());
}

class MyUM extends StatelessWidget {
  const MyUM({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyUmApp(),
    );
  }
}

class MyUmApp extends StatefulWidget {
  const MyUmApp({super.key});

  @override
  State<MyUmApp> createState() => _MyUmAppState();
}

class _MyUmAppState extends State<MyUmApp> {
  int currentIndex = 0;

  var img = [
    // Page 2
    "https://news.miami.edu/_assets/images-stories/2020/08/lakeside-move-in-exterior.jpg", 
    "https://news.miami.edu/_assets/images-stories/2024/10/native-tree-study-hero-940x529.jpg",
    "https://news.miami.edu/_assets/images-stories/2020/08/image-canes-central-940x529.jpg",
    "https://news.miami.edu/libraries/_assets/images/images-stories/2025/01/dean-welcome-spring-2025-cascade-790px.jpg",
    "https://news.miami.edu/frost/_assets/images/images-stories/2025/02/bestschool790x527.png",
    "https://news.miami.edu/_assets/images-stories/2022/03/cosford22-hero-940x529.jpg",

    // Page 3
    "https://news.miami.edu/_assets/images-stories/2016/10/watsco_center_940x529",
    "https://news.miami.edu/frost/_assets/images/images-stories/2025/03/tf3940x529.png",
    "https://news.miami.edu/_assets/images-stories/2023/11/shalala-center-anniversary-hero-940x529.jpg",
    "https://news.miami.edu/frost/_assets/images/images-stories/2025/01/mcbridexlineup.png",
    "https://news.miami.edu/_assets/images-stories/2021/11/ringnovartsguide-hero-940x529.jpg",
    "https://news.miami.edu/frost/_assets/images/images-stories/2024/04/frostjazz940x529.png",

    // Page 4
    "https://scc.studentaffairs.miami.edu/about-us/our-spaces/u-statue/1240x550_ucstatue_sunshine.jpg",
    "https://news.miami.edu/as/_assets/images/images-stories/2024/12/slipstream-790x527.jpg",
    "http://news.miami.edu/studentaffairs/_assets/images/images-stories/16-9-stanford.jpg",
    "https://scc.studentaffairs.miami.edu/_assets/images/rock-plaza-images/1240x550_rockplaza_sebastian.jpg",
    "https://wellness.studentaffairs.miami.edu/_assets/images/facilities-images/cover.jpg",
    "https://news.miami.edu/_assets/images-stories/2021/11/everbrighterfestival-hero-940x529.jpg",
  ];

  var titles = [
    // Page 2
    "Lakeside Village",
    "Trees on Campus",
    "Canes Central",
    "Richter Library",
    "Frost School of Music",
    "Cosford Cinema",

    // Page 3
    "Watsco Center",
    "Gusman Concert Hall",
    "Shalala Student Center",
    "Frost Music Ensemble",
    "Jerry Herman Ring Theatre",
    "Frost Jazz Orchestra",

    // Page 4
    "U Statue",
    "Lowe Art Museum",
    "Stanford Residential College",
    "The Rock",
    "Wellness Center",
    "Foote Green",
  ];

  var summary = [
    // Page 2
    "Lakeside Village is a modern residential community with beautiful architecture and waterfront views.",
    "Iconic trees line the walkways across the University of Miami's Coral Gables campus.",
    "Canes Central is the hub for student services like registration and billing.",
    "The Richter Library provides access to digital and physical research resources.",
    "World-class training and performances happen every day at the Frost School of Music.",
    "The Cosford Cinema offers free movies and screenings to the UM community.",

    // Page 3
    "The Watsco Center is a venue for concerts, sports, and graduation ceremonies.",
    "Gusman Hall is home to student recitals and visiting music professionals.",
    "The Donna E. Shalala Student Center is a central hub for student life.",
    "Frost's ensemble spaces provide hands-on experience for music students.",
    "The Ring Theatre hosts major theatrical productions year-round.",
    "If You Go: The Frost Jazz Orchestra performs at 7:30pm on Thursday, April 11 at Gusman Concert Hall at the Frost School of Music.",

    // Page 4
    "A popular photo spot and symbol of 'Canes pride near the bookstore.",
    "Offers a wide range of exhibitions and cultural events.",
    "One of UM's traditional dorms for first-year students.",
    "A historic and symbolic outdoor gathering space for events and speeches.",
    "State-of-the-art facility offering fitness, wellness, and recreation.",
    "A large green space in the center of campus often used for fairs and activities.",
  ];

  final List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    pages.addAll([
      // Page 1: Dashboard
      Dashboard(),

      // Page 2
      ListView(
        children: List.generate(6, (index) {
          return Customcard(img[index], titles[index], summary[index]);
        }),
      ),

      // Page 3
      ListView(
        children: List.generate(6, (index) {
          return Customcard(img[index + 6], titles[index + 6], summary[index + 6]);
        }),
      ),

      // Page 4
      ListView(
        children: List.generate(6, (index) {
          return Customcard(img[index + 12], titles[index + 12], summary[index + 12]);
        }),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My UM"),
        backgroundColor: const Color.fromARGB(255, 255, 168, 238),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) => setState(() {
          currentIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages),
            label: "Page 2",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages),
            label: "Page 3",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages),
            label: "Page 4",
          ),
        ],
      ),
    );
  }
}
