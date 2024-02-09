import 'package:chef_frontend/service/post_api/product_detail_model.dart';
import 'package:chef_frontend/service/post_api/selectedvideo.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class Myvideospage2 extends StatefulWidget {


    static String route = '/user/videopage2';
  const Myvideospage2({super.key});

  @override
  State<Myvideospage2> createState() => _Myvideospage2State();
}




 
class _Myvideospage2State extends State<Myvideospage2> {

  VideoPlayerController? videoController;
  ProductDetail? productDetail; 
  bool isVideoLoading = true;
   @override
  void initState() {
    super.initState();
    fetchVideoDetails();
  
  }

  final GetVideoByUrl videoService = GetVideoByUrl();
  ChewieController? chewieController;

Future<void> fetchVideoDetails() async {
  try {
    // Fetch video details using the service
    productDetail = await videoService.selectedVideoUrl();
// print("videoUrlvideoUrlvideoUrlvideoUrlvideoUrl ${productDetail?.steps.length}");


    if (productDetail != null) {
   
      final String videoUrl = productDetail!.videoUrl;
      if (videoUrl != null && videoUrl.isNotEmpty) {
        // Initialize VideoPlayerController
        // videoController = VideoPlayerController.networkUrl(
        //   Uri.parse(videoUrl),
        // );

         videoController = VideoPlayerController.networkUrl(Uri.parse(
              'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
              );

        await videoController!.initialize();

        setState(() {
          isVideoLoading = false;
          chewieController = ChewieController(
            videoPlayerController: videoController!,
            aspectRatio: 16 / 9,
            autoPlay: false,
            looping: false,
            allowMuting: true,
            showControlsOnInitialize: true,
            deviceOrientationsAfterFullScreen: [
              DeviceOrientation.portraitUp,
            ],
            cupertinoProgressColors: ChewieProgressColors(
              playedColor: const Color.fromARGB(255, 190, 13, 0),
              bufferedColor: const Color.fromARGB(255, 211, 211, 211),
              handleColor: Colors.blue,
            ),
            materialProgressColors: ChewieProgressColors(
              playedColor: Colors.red,
              bufferedColor: const Color.fromARGB(255, 225, 225, 225),
              backgroundColor: Colors.grey,
            ),
            placeholder: Container(
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            showControls: true,
            showOptions: false,
          );
        });
      } else {
        print("No valid video URL found.");
        setState(() {
          isVideoLoading = false;
        });
      }
    } else {
      print("No video details found.");
      setState(() {
        isVideoLoading = false;
      });
    }
  } catch (e) {
    print("Error fetching video details: $e");
    setState(() {
      isVideoLoading = false;
    });
  }
}


  @override
  void dispose() {
    videoController?.dispose();
    chewieController?.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (chewieController != null) {
                if (videoController!.value.isPlaying) {
                  chewieController!.pause();
                } else {
                  chewieController!.play();
                }
              }
            },
            child: chewieController != null
                ? Container(
                    width: screenWidth,
                    height: isPortrait
                        ? screenWidth * 335 / 428
                        : screenHeight * 0.6,
                    child: Chewie(controller: chewieController!),
                  )
                : const CircularProgressIndicator(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(
                            isPortrait ? screenWidth * 0.05 : 16.0),
                        child: Text(
                          productDetail?.text ?? '',
                          style:  GoogleFonts.dmSans(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Divider
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            color: const Color.fromARGB(255, 202, 202, 202),
                            height: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),

                 

              

                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      productDetail?.description ?? 'No description found',
                      style:  GoogleFonts.dmSans(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  // Divider
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            color: const Color.fromARGB(255, 202, 202, 202),
                            height: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Ingredient
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Ingredients",
                            style: GoogleFonts.dmSans(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Ingredient Rows
                  ...List<Widget>.generate(
                    productDetail?.ingredients.length ?? 0,
                    (index) {
                      final ingredient = productDetail?.ingredients[index];
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                   
                            Text(
                              ingredient?.name ?? '',
                              style:  GoogleFonts.dmSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.18,
                              child: Text(
                                ingredient?.quantity ?? '',
                                style:  GoogleFonts.dmSans(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                const SizedBox(
                    height: 10,
                  ),

                  // steps
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Steps",
                            style: GoogleFonts.dmSans(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Ingredient Rows
                  ...List<Widget>.generate(
                    productDetail?.steps.length ?? 0,
                    (index) {
                      final step = productDetail?.steps[index];
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                   


                         SizedBox(
                              width: screenWidth * 0.18,
                         child:   Text(
                              step?.stepNo ?? '',
                              style:  GoogleFonts.dmSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                         ),
                            SizedBox(
                              width: screenWidth * 0.18,
                              child: 
                              Text(
                                step?.stepDescription ?? '',
                                style:  GoogleFonts.dmSans(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}