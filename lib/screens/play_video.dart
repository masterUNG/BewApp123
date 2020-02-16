import 'package:chewie/chewie.dart';
import 'package:enetb/models/job_model.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayVideo extends StatefulWidget {
  final JobModel jobModel;

  PlayVideo({Key key, this.jobModel}) : super(key: key);

  @override
  _PlayVideoState createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
//  Field
  JobModel _jobModel;
  String urlVideo;
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;

//  Method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _jobModel = widget.jobModel;
    urlVideo = _jobModel.pathVideo;

    videoPlayerController = VideoPlayerController.network(urlVideo);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3/2,
      autoPlay: true,
      looping: false,
    );
  }

  @override
  void dispose(){
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  Widget titleAppBar() {
    return Text(_jobModel.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: titleAppBar(),
      ),body: Center(child: Chewie(controller: chewieController,),),
    );
  }
}
