// import 'dart:io';
// import 'dart:convert';

import 'dart:typed_data';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class CropSample extends StatefulWidget {
  final Uint8List getter1;
  const CropSample({
    Key? key,
    required this.getter1,
  }) : super(key: key);
  @override
  _CropSampleState createState() => _CropSampleState();
}

class _CropSampleState extends State<CropSample> {
  final height = TextEditingController();
  final width = TextEditingController();
  var qualit = 100;
  static const _images = const [
    'assets/images/city.png',
    'assets/images/lake.png',
    'assets/images/train.png',
    'assets/images/turtois.png',
  ];

  final _cropController = CropController();
  final _imageDataList = <Uint8List>[];

  var _loadingImage = false;
  var _currentImage = 0;
  set currentImage(int value) {
    setState(() {
      _currentImage = value;
    });
    _cropController.image = _imageDataList[_currentImage];
  }

  var _isSumbnail = false;
  var _isCropping = false;
  var _isCircleUi = false;
  Uint8List? _croppedData;

  @override
  void initState() {
    _loadAllImages();
    super.initState();
  }

  Future<void> _loadAllImages() async {
    setState(() {
      _loadingImage = true;
    });
    if (widget.getter1 != null) {
      setState(() {
        _loadingImage = false;
      });
    }
  }

  Future<Uint8List> _load(String assetName) async {
    final assetData = await rootBundle.load(assetName);
    return assetData.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Visibility(
            visible: !_loadingImage && !_isCropping,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      _buildSumbnail(widget.getter1),
                      const SizedBox(width: 16),
                      // _buildSumbnail(_imageDataList[1]),
                      // const SizedBox(width: 16),
                      // _buildSumbnail(_imageDataList[2]),
                      // const SizedBox(width: 16),
                      // _buildSumbnail(_imageDataList[3]),
                    ],
                  ),
                ),
                Expanded(
                  child: Visibility(
                    visible: _croppedData == null,
                    child: Stack(
                      children: [
                        Crop(
                          controller: _cropController,
                          image: widget.getter1,
                          onCropped: (croppedData) {
                            setState(() {
                              _croppedData = croppedData;
                              _isCropping = false;
                            });
                          },
                          withCircleUi: _isCircleUi,
                          initialSize: 0.5,
                          maskColor: _isSumbnail ? Colors.white : null,
                          cornerDotBuilder: (size, index) => _isSumbnail
                              ? const SizedBox.shrink()
                              : const DotControl(),
                        ),
                        Positioned(
                          right: 16,
                          bottom: 16,
                          child: GestureDetector(
                            onTapDown: (_) =>
                                setState(() => _isSumbnail = true),
                            onTapUp: (_) => setState(() => _isSumbnail = false),
                            child: CircleAvatar(
                              backgroundColor: _isSumbnail
                                  ? Colors.blue.shade50
                                  : Colors.blue,
                              child: Center(
                                child: Icon(Icons.crop_free_rounded),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    replacement: Center(
                      child: _croppedData == null
                          ? SizedBox.shrink()
                          : Image.memory(_croppedData!),
                    ),
                  ),
                ),
                if (_croppedData == null)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.crop_7_5),
                              onPressed: () {
                                _isCircleUi = false;
                                _cropController.aspectRatio = 16 / 4;
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.crop_16_9),
                              onPressed: () {
                                _isCircleUi = false;
                                _cropController.aspectRatio = 16 / 9;
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.crop_5_4),
                              onPressed: () {
                                _isCircleUi = false;
                                _cropController.aspectRatio = 4 / 3;
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.crop_square),
                              onPressed: () {
                                _isCircleUi = false;
                                _cropController
                                  ..withCircleUi = false
                                  ..aspectRatio = 1;
                              },
                            ),
                            IconButton(
                                icon: Icon(Icons.circle),
                                onPressed: () {
                                  _isCircleUi = true;
                                  _cropController.withCircleUi = true;
                                }),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _isCropping = true;
                              });
                              _isCircleUi
                                  ? _cropController.cropCircle()
                                  : _cropController.crop();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text('CROP IT!'),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
              ],
            ),
            replacement: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  Expanded _buildSumbnail(Uint8List data) {
    final index = _imageDataList.indexOf(data);
    return Expanded(
      child: InkWell(
        onTap: () {
          // _croppedData = null;
          // currentImage = index;
        },
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            border: index == _currentImage
                ? Border.all(
                    width: 8,
                    color: Colors.blue,
                  )
                : null,
          ),
          child: Column(children: [
            Text(
              " Image Size in Bytes:${data.lengthInBytes}",
            ),
            // Container(
            //   height: 50,
            //   child: Row(children: [
            //     TextFormField(
            //       controller: height,
            //       decoration: InputDecoration(
            //           labelText: "height",
            //           hintText: "156",
            //           border: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(15.0))),
            //     ),
            //     Text("X"),
            //     TextFormField(
            //       controller: width,
            //       decoration: InputDecoration(
            //           labelText: "width",
            //           hintText: " Enter your Full name ",
            //           border: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(15.0))),
            //     ),
            //   ]),
            // ),
            // PopupMenuButton<int>(
            //   icon: Icon(Icons.aspect_ratio),
            //   itemBuilder: (context) => [
            //     PopupMenuItem(
            //       child: Text("Original"),
            //       value: 100,
            //     ),
            //     PopupMenuDivider(),
            //     PopupMenuItem(
            //       child: Text("40%"),
            //       value: 40,
            //     ),
            //     PopupMenuItem(
            //       child: Text("50"),
            //       value: 50,
            //     ),
            //     PopupMenuItem(
            //       child: Text("60%"),
            //       value: 60,
            //     ),
            //     PopupMenuItem(
            //       child: Text("70%"),
            //       value: 70,
            //     ),
            //     PopupMenuItem(
            //       child: Text("80%"),
            //       value: 80,
            //     ),
            //   ],
            //   tooltip: 'Quality',
            //   onSelected: (x) {
            //     qualit = x;
            //     setState(() {});
            //   },
            // ),
          ]),
        ),
      ),
    );
  }
}
