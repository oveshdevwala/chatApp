import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/features/app/theme/colors_styles.dart';
import 'package:mangochatapp/constrains/widget/my_icon_button.dart';
class VideoMsgPlayer extends StatefulWidget {
  VideoMsgPlayer({super.key, required this.url});
  final String url;
  @override
  State<VideoMsgPlayer> createState() => _VideoMsgPlayerState();
}

class _VideoMsgPlayerState extends State<VideoMsgPlayer> {
  late VideoPlayerController mVideoPlayerContoller;
  late VideoPlayerController inilinezForThum;
  late CustomVideoPlayerController customVideoPlayerController;

  @override
  void initState() {
    super.initState();
    mVideoPlayerContoller =
        VideoPlayerController.networkUrl(Uri.parse(widget.url))
          ..initialize().then((value) {
            setState(() {});
          });
    customVideoPlayerController = CustomVideoPlayerController(
        context: context, videoPlayerController: mVideoPlayerContoller);
    inilinezForThum = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize();
  }

  @override
  void dispose() {
    super.dispose();
    mVideoPlayerContoller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          mVideoPlayerContoller.play();
          popUpVideo(context);
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.zero,
            bottomLeft: Radius.circular(12),
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12)),
        child: AspectRatio(
          aspectRatio: inilinezForThum.value.aspectRatio,
          child: Stack(
            children: [
              VideoPlayer(inilinezForThum),
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                    radius: 20,
                    backgroundColor: UIColors.white,
                    child: Icon(
                      CupertinoIcons.play_circle,
                      color: UIColors.primary,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> popUpVideo(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
            titlePadding: EdgeInsets.all(0),
            title: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CustomVideoPlayer(
                      customVideoPlayerController: customVideoPlayerController),
                ),
                Positioned(
                  right: 0,
                  child: MyIconButton(
                      onTap: () {
                        Navigator.pop(context);
                        mVideoPlayerContoller.pause();
                      },
                      icon: CupertinoIcons.clear_circled),
                )
              ],
            ));
      },
    );
  }
}
// class VideoMsgPlayer extends StatefulWidget {
//   VideoMsgPlayer({super.key, required this.url});
//   final String url;
//   @override
//   State<VideoMsgPlayer> createState() => _VideoMsgPlayerState();
// }

// class _VideoMsgPlayerState extends State<VideoMsgPlayer> {
//   late VideoPlayerController mVideoPlayerContoller;
//   late VideoPlayerController inilinezForThum;

//   @override
//   void initState() {
//     super.initState();
//     mVideoPlayerContoller =
//         VideoPlayerController.networkUrl(Uri.parse(widget.url))..initialize();

//     inilinezForThum = VideoPlayerController.networkUrl(Uri.parse(widget.url))
//       ..initialize();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     mVideoPlayerContoller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         setState(() {
//           mVideoPlayerContoller.play();
//           popUpVideo(context);
//         });
//       },
//       child: ClipRRect(
//         borderRadius: BorderRadius.only(
//             bottomRight: Radius.zero,
//             bottomLeft: Radius.circular(12),
//             topLeft: Radius.circular(12),
//             topRight: Radius.circular(12)),
//         child: AspectRatio(
//           aspectRatio: 16 / 9,
//           child: Stack(
//             children: [VideoPlayer(inilinezForThum)],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<dynamic> popUpVideo(BuildContext context) {
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Stack(
//             children: [
//               Column(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child: AspectRatio(
//                         aspectRatio: mVideoPlayerContoller.value.aspectRatio,
//                         child: VideoPlayer(mVideoPlayerContoller)),
//                   ),
//                   // Slider(
//                   //   value: mVideoPlayerContoller.value.position.inSeconds
//                   //       .toDouble(),
//                   //   min: 0,
//                   //   max: mVideoPlayerContoller.value.duration.inSeconds
//                   //       .toDouble(),
//                   //   onChanged: (value) {
//                   //     setState(() {
//                   //     mVideoPlayerContoller
//                   //         .seekTo(Duration(seconds: value.toInt()));


//                   //     });
//                   //   },
//                   // ),
               
//                   Align(
//                     alignment: Alignment.center,
//                     child: MyIconButton(
//                       icon: mVideoPlayerContoller.value.isPlaying
//                           ? CupertinoIcons.pause_circle
//                           : CupertinoIcons.play_circle,
//                       onTap: () {
//                         if (mVideoPlayerContoller.value.isPlaying) {
//                           mVideoPlayerContoller.pause();
//                         } else {
//                           mVideoPlayerContoller.play();
//                         }
//                         setState(() {});
//                       },
//                     ),
//                   )
//                 ],
//               ),
//               Positioned(
//                 right: 0,
//                 child: MyIconButton(
//                     onTap: () {
//                       Navigator.pop(context);
//                       mVideoPlayerContoller.dispose();
//                     },
//                     icon: CupertinoIcons.clear_thick_circled),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }


              // VideoPlayer(mVideoPlayerContoller),
              // allowToPlay
              //     ? Align(
              //         alignment: Alignment.center,
              //         child: MyIconButton(
              //           icon: mVideoPlayerContoller.value.isPlaying
              //               ? CupertinoIcons.pause_circle
              //               : CupertinoIcons.play_circle,
              //           onTap: () {
              //             if (mVideoPlayerContoller.value.isPlaying) {
              //               mVideoPlayerContoller.pause();
              //             } else {
              //               mVideoPlayerContoller.play();
              //             }
              //             setState(() {});
              //           },
              //         ),
              //       )
              //     : SizedBox(),