import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class ScreenShotviewer extends StatefulWidget {
  final capturedimage;

  ScreenShotviewer({required this.capturedimage});

  @override
  _ScreenShotviewerState createState() => _ScreenShotviewerState();
}

class _ScreenShotviewerState extends State<ScreenShotviewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Captured widget screenshot"),
        actions: [
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Downloading as pdf! Wait for a While"),
                  ),
                );
                pdfimage();
                // savepdf();
                print("done");
              },
              icon: Icon(Icons.save_alt_sharp))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 35, left: 35, top: 10),
          child: Center(
              child: widget.capturedimage != null
                  ? Image.memory(widget.capturedimage)
                  : Container()),
        ),
      ),
    );
  }

  Future<void> pdfimage() async {
    //Create a PDF document.
    PdfDocument document = PdfDocument();
    //Add a page and draw text
    document.pages.add().graphics.drawImage(
        PdfBitmap(widget.capturedimage), Rect.fromLTWH(20, 100, 450, 300));
    //Save the document
    List<int> bytes = document.save();
    //Dispose the document
    document.dispose();
    //Download the output file
    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download", "output.pdf")
      ..click();
  }
}
