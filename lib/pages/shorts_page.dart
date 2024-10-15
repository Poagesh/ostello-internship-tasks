import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ShortsPage extends StatefulWidget {
  final String videoUrl;
  final String title;
  final String description;
  final int views;

  const ShortsPage({
    Key? key,
    required this.videoUrl,
    required this.title,
    required this.description,
    required this.views,
  }) : super(key: key);

  @override
  _ShortsPageState createState() => _ShortsPageState();
}

class _ShortsPageState extends State<ShortsPage> {
  late VideoPlayerController _controller;
  bool isInterested = false; 

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      }).catchError((error) {
        print("Error initializing video player: $error");
      });
  }

  @override
  void dispose() {
    _controller.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Video Player
          _controller.value.isInitialized
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  child: SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),

          // Back button
          Positioned(
            top: MediaQuery.of(context).padding.top + 10, // Adjust for the status bar
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),

          // Bottom content
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        backgroundImage: AssetImage('assets/logo.png'),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Manoj Classes",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.title,
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.description,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: const [
                          Icon(Icons.thumb_up, color: Colors.white),
                          Text('Like', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(Icons.comment, color: Colors.white),
                          Text('Comment', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(Icons.share, color: Colors.white),
                          Text('Share', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Interested and Not Interested Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Interested button
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isInterested = true; // Update interested state
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: isInterested ? Colors.green : Colors.transparent,
                          side: BorderSide(color: Colors.white),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        ),
                        child: const Text(
                          'Interested',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      // Not Interested button
                      TextButton(
                        onPressed: () {
                          // Handle Not Interested button press
                          setState(() {
                            isInterested = false; // Reset interested state
                          });
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        ),
                        child: const Text(
                          'Not Interested',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
