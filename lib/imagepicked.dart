import 'package:flutter/material.dart';

import 'package:image_picker_web_redux/image_picker_web_redux.dart';
import 'package:webapi/Crop.dart';

class SamplePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  final _pickedImages = <Image>[];
  String _imageInfo = '';
  bool check = false;
  bool check1 = false;
  Future<void> _pickImage() async {
    Image fromPicker =
        await ImagePickerWeb.getImage(outputType: ImageType.widget);

    if (fromPicker != null) {
      setState(() {
        _pickedImages.clear();
        _pickedImages.add(fromPicker);
        check1 = true;
      });
    }
  }

  var infos;
  Future<void> _getImgFile() async {
    infos = await ImagePickerWeb.getImage(outputType: ImageType.bytes);

    setState(() {
      _imageInfo = 'Name: ${infos.name}\nRelative Path: ${infos.relativePath}';
      check = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Image here'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Wrap(
                // spacing: 15.0,
                children: <Widget>[
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    switchInCurve: Curves.easeIn,
                    child: SizedBox(
                      width: 500,
                      height: 200,
                      child: infos != null
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 1,
                              itemBuilder: (context, index) =>
                                  Image.memory(infos))
                          : Text("picked Image"),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    child: Text(_imageInfo, overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
                Visibility(
                  visible: check,
                  child: ElevatedButton(
                    onPressed: _pickImage,
                    child: const Text(' previw Image'),
                  ),
                ),
                // ElevatedButton(
                //   onPressed: _pickVideo,
                //   child: const Text('Select Video'),
                // ),
                // Visibility(
                //   visible: check,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => MyHomePage2(
                //                     getter: _pickedImages[0],
                //                   )));
                //     },
                //     child: const Text('Selec1 gi'),
                //   ),
                // ),
                ElevatedButton(
                  onPressed: _getImgFile,
                  child: const Text('Get Image File'),
                ),
                Visibility(
                  visible: check1,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CropSample(
                                    getter1: infos,
                                  )));
                    },
                    child: const Text('Crop, iT'),
                  ),
                ),
              ]),
            ]),
      ),
    );
  }
}
