import 'package:chef_frontend/common_widget/custom_GREEN/customgreen.dart';
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

        //  videoController = VideoPlayerController.networkUrl(Uri.parse(
        //       'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
        //       );


            final videoController = VideoPlayerController.networkUrl(
                          Uri.parse(
                              'https://ypc123.s3.ap-south-1.amazonaws.com/Crab_Biryani_How_To_Make_Crab_Rice_Quick_And_Easy_Crab_Rice_%E0%A4%9A%E0%A4%BF%E0%A4%82%E0%A4%AC%E0%A5%8B%E0%A4%B0%E0%A5%80.mp4'));

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
          icon: const Icon(Icons.keyboard_backspace_sharp),
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
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(
                            isPortrait ? screenWidth * 0.05 : 16.0),
                        child: Text(
                          productDetail?.text ?? '',
                          style: GoogleFonts.dmSans(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),





                      // Center(
                      //   child: LikeButton(
                      //     size: 20,
                      //     circleColor: const CircleColor(
                      //         start: Color(0xff00ddff), end: Color(0xff0099cc)),
                      //     bubblesColor: const BubblesColor(
                      //       dotPrimaryColor: Color(0xff33b5e5),
                      //       dotSecondaryColor: Color(0xff0099cc),
                      //     ),
                      //     likeBuilder: (bool isLiked) {
                      //       return Icon(
                      //         Icons.thumb_up,
                      //         color: isLiked
                      //             ? CustomColor.myRedColor
                      //             : Colors.grey,
                      //         size: 20,
                      //       );
                      //     },      
                      //     likeCount: 0,
                      //     countBuilder:
                      //         (int? count, bool isliked, String text) {
                      //       var color =
                      //           isliked ? CustomColor.myRedColor : Colors.grey;
                      //       Widget result;
                      //       if (count == 0) {
                      //         result = const Text("like");
                      //       } else {
                      //         result = Text(
                      //           text,
                      //           style: GoogleFonts.dmSans(color: color),
                      //         );
                      //         return result;
                      //       }
                      //     },
                      //     onTap: (isLiked) =>
                      //         onLikeButtonTapped(productDetail?.id, isLiked),
                      //   ),
                      // ),





     

// in backend userLikesReceipes this is not saving {important}

                      
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
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipOval(
                            child: Image.network(
                              // '$node${productDetail?.chefUrl}',
                              'http://192.168.29.223:4000/uploadimage/1698476769601.jpg',
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: GestureDetector(
                            onTap: () {
                              print(
                                  "productDetail?.chefIdproductDetail?.chefIdproductDetail?.chefId${{
                                productDetail?.chefId
                              }}");
                            
                            },
                            child: Text(
                              productDetail?.chefName ?? '',
                              style: GoogleFonts.dmSans(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),

             

                      
                      ],
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

                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      productDetail?.description ?? 'No description',
                      style: GoogleFonts.dmSans(
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
                                fontWeight: FontWeight.bold,
                                color: CustomColor.myRedColor),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          //      crossAxisAlignment: CrossAxisAlignment
                          //       .center,
                          children: <Widget>[
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 230, 229, 229))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Image.asset(
                                      'assets/oil.png',
                                      width: screenWidth * 0.077,
                                      height: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Column(
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    ingredient?.name ?? '',
                                    style: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(width: 50),

                            Column(
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.2,
                                  child: SizedBox(
                                    child: Text(
                                      ingredient?.quantity ?? '',

                                      // style: const GoogleFonts.dmSans(
                                      //   fontSize: 16,
                                      //   color: Colors.black,
                                      // ),

                                      style: GoogleFonts.dmSans(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        //     Center(
                        //   child: Row(
                        //     crossAxisAlignment: CrossAxisAlignment
                        //         .stretch,
                        //     children: <Widget>[
                        //       Image.asset(
                        //         'assets/oil.png',
                        //         width: 30,
                        //         height: 30,
                        //       ),
                        //       SizedBox(width: 8),
                        //       Text(
                        //         ingredient?.name ?? '',
                        //         style: const GoogleFonts.dmSans(
                        //           fontWeight: FontWeight.bold,
                        //           fontSize: 16,
                        //           color: Colors.black,
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: screenWidth * 0.18,
                        //         child: Text(
                        //           ingredient?.quantity ?? '',
                        //           style: const GoogleFonts.dmSans(
                        //             fontSize: 16,
                        //             color: Colors.black,
                        //             fontWeight: FontWeight.w300,
                        //             fontFamily: 'dmsans',
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      );
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // steps
                  // if( productDetail!.steps.isNotEmpty)
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
                              color: CustomColor.myRedColor,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: screenWidth * 0.07,
                              child: Text(
                                step?.stepNo ?? '',
                                style: GoogleFonts.dmSans(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.70,
                              child: Text(
                                step?.stepDescription ?? '',
                                style: GoogleFonts.dmSans(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
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



          // Expanded(
          //   child: SingleChildScrollView(
          //     child: Column(
          //       children: <Widget>[
          //         const SizedBox(height: 10),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           children: <Widget>[
          //             Padding(
          //               padding: EdgeInsets.all(
          //                   isPortrait ? screenWidth * 0.05 : 16.0),
          //               child: Text(
          //                 productDetail?.text ?? '',
          //                 style:  GoogleFonts.dmSans(
          //                   fontSize: 20,
          //                   color: Colors.black,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),

          //         // Divider
          //         Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //           child: Row(
          //             children: <Widget>[
          //               Expanded(
          //                 child: Container(
          //                   color: const Color.fromARGB(255, 202, 202, 202),
          //                   height: 1.0,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),

                 

              

          //         Padding(
          //           padding: const EdgeInsets.all(25.0),
          //           child: Text(
          //             productDetail?.description ?? 'No description found',
          //             style:  GoogleFonts.dmSans(
          //               fontSize: 16,
          //               color: Colors.black,
          //             ),
          //           ),
          //         ),

          //         // Divider
          //         Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //           child: Row(
          //             children: <Widget>[
          //               Expanded(
          //                 child: Container(
          //                   color: const Color.fromARGB(255, 202, 202, 202),
          //                   height: 1.0,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),

          //         const SizedBox(
          //           height: 10,
          //         ),

          //         // Ingredient
          //          Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //           child: Row(
          //             children: <Widget>[
          //               Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: Text(
          //                   "Ingredients",
          //                   style: GoogleFonts.dmSans(
          //                     fontSize: 16,
          //                     color: Colors.black,
          //                     fontWeight: FontWeight.bold,
                              
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),

          //         // Ingredient Rows
          //         ...List<Widget>.generate(
          //           productDetail?.ingredients.length ?? 0,
          //           (index) {
          //             final ingredient = productDetail?.ingredients[index];
          //             return Padding(
          //               padding: const EdgeInsets.all(16.0),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                 children: <Widget>[
                   
          //                   Text(
          //                     ingredient?.name ?? '',
          //                     style:  GoogleFonts.dmSans(
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 16,
          //                       color: Colors.black,
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     width: screenWidth * 0.18,
          //                     child: Text(
          //                       ingredient?.quantity ?? '',
          //                       style:  GoogleFonts.dmSans(
          //                         fontSize: 16,
          //                         color: Colors.black,
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             );
          //           },
          //         ),

          //       const SizedBox(
          //           height: 10,
          //         ),

          //         // steps
          //          Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //           child: Row(
          //             children: <Widget>[
          //               Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: Text(
          //                   "Steps",
          //                   style: GoogleFonts.dmSans(
          //                     fontSize: 16,
          //                     color: Colors.black,
          //                     fontWeight: FontWeight.bold,
                              
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),

          //         // Ingredient Rows
          //         ...List<Widget>.generate(
          //           productDetail?.steps.length ?? 0,
          //           (index) {
          //             final step = productDetail?.steps[index];
          //             return Padding(
          //               padding: const EdgeInsets.all(16.0),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                 children: <Widget>[
                   


          //                SizedBox(
          //                     width: screenWidth * 0.18,
          //                child:   Text(
          //                     step?.stepNo ?? '',
          //                     style:  GoogleFonts.dmSans(
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 16,
          //                       color: Colors.black,
          //                     ),
          //                   ),
          //                ),
          //                   SizedBox(
          //                     width: screenWidth * 0.18,
          //                     child: 
          //                     Text(
          //                       step?.stepDescription ?? '',
          //                       style:  GoogleFonts.dmSans(
          //                         fontSize: 16,
          //                         color: Colors.black,
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             );
          //           },
          //         ),


          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}