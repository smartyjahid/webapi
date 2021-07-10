// import 'package:crop/crop.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// import 'dart:math';

// import 'dart:ui' as ui;

// class MyHomePage2 extends StatefulWidget {
//   final getter;

//   const MyHomePage2({Key? key, required this.getter}) : super(key: key);
//   @override
//   _MyHomePage2State createState() => _MyHomePage2State();
// }

// class _MyHomePage2State extends State<MyHomePage2> {
//   final controller = CropController(aspectRatio: 1000 / 667.0);
//   double _rotation = 0;
//   BoxShape shape = BoxShape.rectangle;

//   void _cropImage() async {
//     final pixelRatio = MediaQuery.of(context).devicePixelRatio;
//     final cropped = await controller.crop(pixelRatio: pixelRatio);
//     // final  crp = Im.encodeJpg(widget.getter, quality: 85);
//     // final tempDir = await getTemporaryDirectory();
//     // final path = tempDir.path;
//     // int rand = new Math.Random().nextInt(10000);

//     // Im.Image? image = Im.decodeImage(widget.img.readAsBytesSync);
//     // // Im.Image smallerImage = Im.copyResize(
//     // //     image, 500); // choose the size here, it will maintain aspect ratio
//     // File unk = File(widget.img, "$path/jahid");
//     // var compressedImage = unk
//     //     .readAsBytesSync(Im.encodeJpg(image != null ? image : "", quality: 85));

//     // CompressObject compressObject = CompressObject(
//     //   //image
//     //   path: cropped.toString(), //compress to path
//     //   quality: 85, //first compress quality, default 80
//     //   step:
//     //       9, //compress quality step, The bigger the fast, Smaller is more accurate, default 6
//     //   mode: CompressMode.LARGE2SMALL, //default AUTO
//     // );
//     // Luban.compressImage(compressObject).then((_path) {
//     //   setState(() {
//     //     print(_path);
//     //   });
//     // });

//     setState(() {
//       print(
//           "${widget.getter.type} ${widget.getter.name} ${widget.getter.relativePath} ");
//     });
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => Scaffold(
//           appBar: AppBar(
//             title: Text('Crop Result'),
//             centerTitle: true,
//             actions: [
//               Builder(
//                 builder: (context) => IconButton(
//                   icon: Icon(Icons.save),
//                   onPressed: () async {
//                     //   final status = await Permission.storage.request();
//                     //   if (status == PermissionStatus.granted) {
//                     //  await _saveScreenShot(cropped);
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('Saved to gallery.'),
//                       ),
//                     );
//                     // }
//                   },
//                 ),
//               ),
//             ],
//           ),
//           body: Center(
//             child: RawImage(
//               image: cropped,
//             ),
//           ),
//         ),
//         fullscreenDialog: true,
//       ),
//     );
//   }

//   // void compressing() {
//   //   CompressObject compressObject = CompressObject(
//   //     imageFile: widget.img,
//   //     //compress to path
//   //     quality: 85, //first compress quality, default 80
//   //     step:
//   //         9, //compress quality step, The bigger the fast, Smaller is more accurate, default 6
//   //     mode: CompressMode.LARGE2SMALL,
//   //   );
//   //   Luban.compressImage(compressObject).then((_path) {
//   //     setState(() {
//   //       print(_path);
//   //     });
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Crop Demo'),
//         centerTitle: true,
//         actions: <Widget>[
//           IconButton(
//             onPressed: () {
//               _cropImage();
//               // compressing();
//             },
//             tooltip: 'Crop',
//             icon: Icon(Icons.crop),
//           )
//         ],
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: Container(
//               color: Colors.black,
//               padding: EdgeInsets.all(8),
//               child: Crop(
//                 onChanged: (decomposition) {
//                   if (_rotation != decomposition.rotation) {
//                     setState(() {
//                       _rotation = ((decomposition.rotation + 180) % 360) - 180;
//                     });
//                   }

//                   print(
//                       "Scale : ${decomposition.scale}, Rotation: ${decomposition.rotation}, translation: ${decomposition.translation}");
//                 },
//                 controller: controller,
//                 shape: shape,
//                 child: widget.getter,
//                 /* It's very important to set `fit: BoxFit.cover`.
//                    Do NOT remove this line.
//                    There are a lot of issues on github repo by people who remove this line and their image is not shown correctly.
//                 */
//                 foreground: IgnorePointer(
//                   child: Container(
//                     alignment: Alignment.bottomRight,
//                     child: Text(
//                       'Foreground Object',
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ),
//                 ),
//                 helper: shape == BoxShape.rectangle
//                     ? Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.white, width: 2),
//                         ),
//                       )
//                     : Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.white, width: 2),
//                         ),
//                       ),
//               ),
//             ),
//           ),
//           Row(
//             children: <Widget>[
//               IconButton(
//                 icon: Icon(Icons.undo),
//                 tooltip: 'Undo',
//                 onPressed: () {
//                   controller.rotation = 0;
//                   controller.scale = 1;
//                   controller.offset = Offset.zero;
//                   setState(() {
//                     _rotation = 0;
//                   });
//                 },
//               ),
//             ],
//           ),
//           Row(
//             children: <Widget>[
//               IconButton(
//                 icon: Icon(Icons.undo),
//                 tooltip: 'Undo',
//                 onPressed: () {
//                   controller.rotation = 0;
//                   controller.scale = 1;
//                   controller.offset = Offset.zero;
//                   setState(() {
//                     _rotation = 0;
//                   });
//                 },
//               ),
//               Expanded(
//                 child: SliderTheme(
//                   data: theme.sliderTheme.copyWith(
//                     trackShape: CenteredRectangularSliderTrackShape(),
//                   ),
//                   child: Slider(
//                     divisions: 360,
//                     value: _rotation,
//                     min: -180,
//                     max: 180,
//                     label: '$_rotation°',
//                     onChanged: (n) {
//                       setState(() {
//                         _rotation = n.roundToDouble();
//                         controller.rotation = _rotation;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               PopupMenuButton<BoxShape>(
//                 icon: Icon(Icons.crop_free),
//                 itemBuilder: (context) => [
//                   PopupMenuItem(
//                     child: Text("Box"),
//                     value: BoxShape.rectangle,
//                   ),
//                   PopupMenuItem(
//                     child: Text("Oval"),
//                     value: BoxShape.circle,
//                   ),
//                 ],
//                 tooltip: 'Crop Shape',
//                 onSelected: (x) {
//                   setState(() {
//                     shape = x;
//                   });
//                 },
//               ),
//               PopupMenuButton<double>(
//                 icon: Icon(Icons.aspect_ratio),
//                 itemBuilder: (context) => [
//                   PopupMenuItem(
//                     child: Text("Original"),
//                     value: 1000 / 667.0,
//                   ),
//                   PopupMenuDivider(),
//                   PopupMenuItem(
//                     child: Text("16:9"),
//                     value: 16.0 / 9.0,
//                   ),
//                   PopupMenuItem(
//                     child: Text("4:3"),
//                     value: 4.0 / 3.0,
//                   ),
//                   PopupMenuItem(
//                     child: Text("1:1"),
//                     value: 1,
//                   ),
//                   PopupMenuItem(
//                     child: Text("3:4"),
//                     value: 3.0 / 4.0,
//                   ),
//                   PopupMenuItem(
//                     child: Text("9:16"),
//                     value: 9.0 / 16.0,
//                   ),
//                 ],
//                 tooltip: 'Aspect Ratio',
//                 onSelected: (x) {
//                   controller.aspectRatio = x;
//                   setState(() {});
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// //     void compressImage() async {
// //   var imageFile = cropped;
// //   final tempDir = await getTemporaryDirectory();
// //   final path = tempDir.path;
// //   int rand = new Math.Random().nextInt(10000);

// //   Im.Image? image = Im.decodeImage(imageFile.readAsBytesSync());
// //   Im.Image smallerImage = Im.copyResize(image!, 500); // choose the size here, it will maintain aspect ratio

// //   var compressedImage = new File('$path/img_$rand.jpg')..writeAsBytesSync(Im.encodeJpg(image, quality: 85));
// // }

// // Future<dynamic> _saveScreenShot(ui.Image img) async {
// //     final tempDir = await getTemporaryDirectory();
// //   final path = tempDir.path;
// //   var byteData = await img.toByteData(format: ui.ImageByteFormat.png);
// //   var buffer = byteData!.buffer.asUint8List();
// //    var compressedImage = new File('$path/img_$rand.jpg')..writeAsBytesSync(Im.encodeJpg(byteData, quality: 85));
// //   final result = await ImageGallerySaver.saveImage(buffer);
// //   print(result);

// //   return result;
// // }

// class CenteredRectangularSliderTrackShape extends RectangularSliderTrackShape {
//   @override
//   void paint(
//     PaintingContext context,
//     ui.Offset offset, {
//     required RenderBox parentBox,
//     required SliderThemeData sliderTheme,
//     required Animation<double> enableAnimation,
//     required ui.Offset thumbCenter,
//     required ui.TextDirection textDirection,
//     bool isEnabled = false,
//     bool isDiscrete = false,
//   }) {
//     // If the slider track height is less than or equal to 0, then it makes no
//     // difference whether the track is painted or not, therefore the painting
//     // can be a no-op.
//     if (sliderTheme.trackHeight! <= 0) {
//       return;
//     }

//     // Assign the track segment paints, which are left: active, right: inactive,
//     // but reversed for right to left text.
//     final ColorTween activeTrackColorTween = ColorTween(
//         begin: sliderTheme.disabledActiveTrackColor,
//         end: sliderTheme.activeTrackColor);
//     final ColorTween inactiveTrackColorTween = ColorTween(
//         begin: sliderTheme.disabledInactiveTrackColor,
//         end: sliderTheme.inactiveTrackColor);
//     final Paint activePaint = Paint()
//       ..color = activeTrackColorTween.evaluate(enableAnimation)!;
//     final Paint inactivePaint = Paint()
//       ..color = inactiveTrackColorTween.evaluate(enableAnimation)!;

//     final Rect trackRect = getPreferredRect(
//       parentBox: parentBox,
//       offset: offset,
//       sliderTheme: sliderTheme,
//       isEnabled: isEnabled,
//       isDiscrete: isDiscrete,
//     );
//     final trackCenter = trackRect.center;
//     final Size thumbSize =
//         sliderTheme.thumbShape!.getPreferredSize(isEnabled, isDiscrete);
//     // final Rect leftTrackSegment = Rect.fromLTRB(
//     //     trackRect.left + trackRect.height / 2,
//     //     trackRect.top,
//     //     thumbCenter.dx - thumbSize.width / 2,
//     //     trackRect.bottom);
//     // if (!leftTrackSegment.isEmpty)
//     //   context.canvas.drawRect(leftTrackSegment, leftTrackPaint);
//     // final Rect rightTrackSegment = Rect.fromLTRB(
//     //     thumbCenter.dx + thumbSize.width / 2,
//     //     trackRect.top,
//     //     trackRect.right,
//     //     trackRect.bottom);
//     // if (!rightTrackSegment.isEmpty)
//     //   context.canvas.drawRect(rightTrackSegment, rightTrackPaint);

//     if (trackCenter.dx < thumbCenter.dx) {
//       final Rect leftTrackSegment = Rect.fromLTRB(
//           trackRect.left,
//           trackRect.top,
//           min(trackCenter.dx, thumbCenter.dx - thumbSize.width / 2),
//           trackRect.bottom);
//       if (!leftTrackSegment.isEmpty) {
//         context.canvas.drawRect(leftTrackSegment, inactivePaint);
//       }

//       final activeRect = Rect.fromLTRB(
//           trackCenter.dx, trackRect.top, thumbCenter.dx, trackRect.bottom);
//       if (!activeRect.isEmpty) {
//         context.canvas.drawRect(activeRect, activePaint);
//       }

//       final Rect rightTrackSegment = Rect.fromLTRB(
//           thumbCenter.dx + thumbSize.width / 2,
//           trackRect.top,
//           trackRect.right,
//           trackRect.bottom);
//       if (!rightTrackSegment.isEmpty) {
//         context.canvas.drawRect(rightTrackSegment, inactivePaint);
//       }
//     } else if (trackCenter.dx > thumbCenter.dx) {
//       final Rect leftTrackSegment = Rect.fromLTRB(trackRect.left, trackRect.top,
//           thumbCenter.dx + thumbSize.width / 2, trackRect.bottom);
//       if (!leftTrackSegment.isEmpty) {
//         context.canvas.drawRect(leftTrackSegment, inactivePaint);
//       }

//       final activeRect = Rect.fromLTRB(
//           thumbCenter.dx, trackRect.top, trackCenter.dx, trackRect.bottom);
//       if (!activeRect.isEmpty) {
//         context.canvas.drawRect(activeRect, activePaint);
//       }

//       final Rect rightTrackSegment = Rect.fromLTRB(
//           min(trackCenter.dx, thumbCenter.dx - thumbSize.width / 2),
//           trackRect.top,
//           trackRect.right,
//           trackRect.bottom);
//       if (!rightTrackSegment.isEmpty) {
//         context.canvas.drawRect(rightTrackSegment, inactivePaint);
//       }
//     } else {
//       final Rect leftTrackSegment = Rect.fromLTRB(
//           trackRect.left,
//           trackRect.top,
//           min(trackCenter.dx, thumbCenter.dx - thumbSize.width / 2),
//           trackRect.bottom);
//       if (!leftTrackSegment.isEmpty) {
//         context.canvas.drawRect(leftTrackSegment, inactivePaint);
//       }

//       final Rect rightTrackSegment = Rect.fromLTRB(
//           min(trackCenter.dx, thumbCenter.dx - thumbSize.width / 2),
//           trackRect.top,
//           trackRect.right,
//           trackRect.bottom);
//       if (!rightTrackSegment.isEmpty) {
//         context.canvas.drawRect(rightTrackSegment, inactivePaint);
//       }
//     }
//   }
// }
