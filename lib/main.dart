import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:webapi/Crop.dart';
import 'package:webapi/Sopping_Grid.dart';
import 'package:webapi/imagepicked.dart';
import 'package:webapi/rozer.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

// import 'package:webapi/Crop.dart';
// import 'package:webapi/Sopping_Grid.dart';
// import 'package:webapi/imagepicked.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  // Create the initilization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Myfirst();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}

class Myfirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firstweb Api',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      debugShowCheckedModeBanner: false,
      home: YoutubeAppDemo(),
    );
  }
}

///
class YoutubeAppDemo extends StatefulWidget {
  @override
  _YoutubeAppDemoState createState() => _YoutubeAppDemoState();
}

class _YoutubeAppDemoState extends State<YoutubeAppDemo> {
  String videoID = "3T0cq4JHM4o";
  //Text Widget
  Widget textField1(input) {
    return Text(
      input,
      style: TextStyle(
          color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
    );
  }

  Widget textField2(input) {
    return Text(
      input,
      style: TextStyle(
          color: Colors.yellowAccent,
          fontSize: 30,
          fontWeight: FontWeight.bold),
    );
  }

  // late Image _pickedImages;
  // Future<void> _pickImage() async {
  //   Image? fromPicker =
  //       (await ImagePickerWeb.getImage(outputType: ImageType.bytes)) as Image?;

  //   if (fromPicker != null) {
  //     setState(() {
  //       _pickedImages = fromPicker;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Self Developer Flutter Web Api"),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        automaticallyImplyLeading: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            child: new Center(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: new Column(
                  // center the children
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Welcome to the Flutter web Api"),
                    RawMaterialButton(
                      fillColor: Colors.yellow,
                      hoverColor: Colors.indigo,
                      splashColor: Colors.green,
                      shape: StadiumBorder(),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RazorPayWeb()));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => SamplePage()));
                        // print("done");
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.cut_outlined, color: Colors.grey),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Cropping Machine"),
                            Icon(Icons.arrow_forward),
                            SizedBox(
                              width: 7,
                            ),
                          ],
                        ),
                      ),
                    ),
                    RawMaterialButton(
                      fillColor: Colors.yellow,
                      hoverColor: Colors.indigo,
                      splashColor: Colors.green,
                      shape: StadiumBorder(),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RazorPayWeb()));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => SamplePage()));
                        // print("done");
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.cut_outlined, color: Colors.grey),
                            SizedBox(
                              width: 5,
                            ),
                            Text("paytm Gateway"),
                            Icon(Icons.arrow_forward),
                            SizedBox(
                              width: 7,
                            ),
                          ],
                        ),
                      ),
                    ),
                    textField1(
                        "Set the hideControls property to true, then you\n"
                        " can create your own custom controls using the controller obtained from onPlayerInitialized property."),
                    SizedBox(height: 20),
                    textField2(
                        "Set the hideControls property to true, then you\n"
                        " can create your own custom controls using the controller obtained\n from onPlayerInitialized property."),
                    SizedBox(height: 20),
                    youtplayer("OU6Pfja-FLM"),
                    Divider(),
                    textField1(
                        "Set the hideControls property to true, then you\n"
                        " can create your own custom controls using the controller obtained from onPlayerInitialized property."),
                    SizedBox(height: 20),
                    textField2(
                        "Set the hideControls property to true, then you\n"
                        " can create your own custom controls using the controller obtained from onPlayerInitialized property."),
                    youtplayer(videoID),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: RawMaterialButton(
        fillColor: Colors.yellow,
        hoverColor: Colors.indigo,
        splashColor: Colors.green,
        shape: StadiumBorder(),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Gridlist(),
              ));

          print("done");
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.shopping_bag, color: Colors.grey),
              SizedBox(
                width: 5,
              ),
              Text("Visit My Shop "),
              Icon(Icons.arrow_forward),
              SizedBox(
                width: 7,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget youtplayer(videoID) {
    return Material(
      color: Colors.transparent,
      child: YoutubeViewer(
        videoID,
      ),
    );
  }
}

class YoutubeViewer extends StatefulWidget {
  final String? videoID;
  YoutubeViewer(this.videoID);
  @override
  _YoutubeViewerState createState() => _YoutubeViewerState();
}

class _YoutubeViewerState extends State<YoutubeViewer> {
  // ignore: close_sinks
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoID!, // livestream example
      params: YoutubePlayerParams(
        startAt: Duration(minutes: 0, seconds: 10),
        enableCaption: false,
        showControls: false,
        autoPlay: true,
        mute: true,
        loop: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final player = YoutubePlayerIFrame();
    return YoutubePlayerControllerProvider(
        key: UniqueKey(),
        controller: _controller,
        child: Container(
          height: 400,
          child: player,
        ));
  }
}
////   data ferqeant



