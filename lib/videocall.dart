import 'package:flutter/material.dart';
import 'package:flutter_webrtc/rtc_video_view.dart';
import 'package:flutter_webrtc/webrtc.dart';

class VideoCallPart extends StatefulWidget {
  @override
  _VideoCallPartState createState() => _VideoCallPartState();
}

class _VideoCallPartState extends State<VideoCallPart> {
  final _localRenderer = new RTCVideoRenderer();

  @override
  void dispose() {
    _localRenderer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    initRenderers();
    _getUserMedia();
    super.initState();
  }

  _getUserMedia() async {
    final Map<String, dynamic> mediaConstraints = {
      'audio': false,
      'video': {
        'facingMode': 'user',
      },
    };

    MediaStream stream = await navigator.getUserMedia(mediaConstraints);

    _localRenderer.srcObject = stream;
  }

  void initRenderers() async {
    await _localRenderer.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.blue[100],
          ),
          Positioned(
            top: 10.0,
            left: 10.0,
            right: 10.0,
            bottom: 10.0,
            child: Container(
              child: new RTCVideoView(_localRenderer),
            ),
          ),
        ],
      ),
    );
  }
}
