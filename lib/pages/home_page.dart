import 'package:flutter/material.dart';
import 'package:ostello_app/widgets/banners.dart';
import 'package:ostello_app/widgets/filter_container.dart';
import 'package:ostello_app/widgets/toggle_button.dart';
import 'package:ostello_app/widgets/video_card.dart';
import 'package:ostello_app/widgets/video_card_small.dart';
import '../widgets/category_container.dart';
import '../widgets/search_bar.dart';
import 'shorts_page.dart';
import '../widgets/reel_container.dart';

class ShortVideoData {
  final String videoUrl;
  final String title;
  final String description;
  final int views;

  ShortVideoData({
    required this.videoUrl,
    required this.title,
    required this.description,
    required this.views,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Create a GlobalKey for the Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Sample list of short videos
  final List<ShortVideoData> shortVideos = [
    ShortVideoData(
      videoUrl: 'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
      title: 'Short Video 1',
      description: 'Description of short video 1',
      views: 1200,
    ),
    ShortVideoData(
      videoUrl: 'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
      title: 'Short Video 2',
      description: 'Description of short video 2',
      views: 3000,
    ),
    ShortVideoData(
      videoUrl: 'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
      title: 'Short Video 3',
      description: 'Description of short video 3',
      views: 1500,
    ),
    // Add more videos here as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the GlobalKey to the Scaffold
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // Open the drawer using the GlobalKey
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(onPressed: () {}, child: const Text('12th IIT JEE >')),
            const SizedBox(width: 4),
            const Icon(Icons.chevron_right, color: Colors.white),
          ],
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            ),
            onPressed: () {
              // Handle coin button click
            },
            child: Row(
              children: [
                const Icon(
                  Icons.monetization_on,
                  color: Color.fromARGB(255, 255, 183, 0),
                ),
                const SizedBox(width: 4),
                Text('300'),
              ],
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple, 
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dashboard',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Welcome to the dashboard!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); 
              },
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Courses'),
              onTap: () {
               
                Navigator.pop(context); 
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
               
                Navigator.pop(context); 
              },
            ),
           
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              SearchAndFilterBar(
                onSearchChanged: (searchText) {
                  // Handle search text changes here
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 10),
                  CategoryContainer(
                    imagePath: 'assets/category1.png',
                    buttonText: 'Career Trend',
                    onPressed: () {
                      // Handle button press
                    },
                  ),
                  const SizedBox(width: 10),
                  CategoryContainer(
                    imagePath: 'assets/category2.png',
                    buttonText: 'Assessment',
                    onPressed: () {
                      // Handle button press
                    },
                  ),
                  const SizedBox(width: 10),
                  CategoryContainer(
                    imagePath: 'assets/category3.png',
                    buttonText: 'Popular Skills',
                    onPressed: () {
                      // Handle button press
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              NewsCarousel(), // Banner
              const SizedBox(height: 30),
              Text("Recommended For You"),
              const SizedBox(height: 10),
              SizedBox(
                height: 180, // height for the video container
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: shortVideos.length,
                  itemBuilder: (context, index) {
                    final video = shortVideos[index];
                    return ShortVideoContainer(
                      videoUrl: video.videoUrl,
                      title: video.title,
                      description: video.description,
                      views: video.views,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShortsPage(
                              videoUrl: video.videoUrl,
                              title: video.title,
                              description: video.description,
                              views: video.views,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Find the Best Coach to help you with your 10th Class",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 135, 135, 135),
                ),
              ),
              const SizedBox(height: 10),
              const FilterContainer(),
              const SizedBox(height: 20),
              Text(
                "Ongoing Classes",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 10),
              CourseToggleButton(),
              const SizedBox(height: 20),
              VideoCard(),
              const SizedBox(height: 10),
              VideoCardSmall(),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  ),
                  child: Text(
                    'View More Classes',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
