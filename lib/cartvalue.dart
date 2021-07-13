import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:webapi/Sopping_Grid.dart';
import 'package:webapi/mapping.dart';
import 'package:screenshot/screenshot.dart';
import 'package:webapi/rozer.dart';
import 'package:webapi/screenShot.dart';

class CartData extends StatefulWidget {
  const CartData({Key? key}) : super(key: key);

  @override
  _CartDataState createState() => _CartDataState();
}

class _CartDataState extends State<CartData> {
  ScreenshotController _controller = ScreenshotController();
  GlobalKey imagekey = GlobalKey();

  // Future<dynamic> screenshotview(BuildContext context,capturedImage) {
  //   return showDialog(
  //     useSafeArea: false,
  //     context: context,
  //     builder: (context) => Scaffold(
  //       appBar: AppBar(
  //         title: Text("Captured widget screenshot"),
  //       ),
  //       body: Center(
  //           child: capturedImage ! = null
  //               ? RawImage(image: capturedImage)
  //               : Container()),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Screenshot(
        controller: _controller,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Hacker  Cart'),
            centerTitle: true,
            actions: [
              MaterialButton(
                onPressed: () {
                  setState(() {
                    print(counter);
                  });
                },
                child: Row(
                  children: [
                    Icon(Icons.card_giftcard_outlined),
                    Text("$counter"),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RazorPayWeb()));
                        },
                        child: Text("Pay here")),
                  ],
                ),
              )
            ],
          ),
          body: ListView.builder(
            itemCount: itemdetail.length,
            itemBuilder: (context, index) {
              return cartlist.contains(itemdetail[index].srialno)
                  ? GridTilesCart(
                      butnvisible: false,
                      pname: itemdetail[index].productname,
                      pprice: itemdetail[index].productprice,
                      auther: itemdetail[index].auther,
                      serial: itemdetail[index].srialno,
                      pimage: itemdetail[index].image,
                    )
                  : Container();
            },
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () async {
                // RenderRepaintBoundary? imageobject = imagekey.currentContext!
                //     .findRenderObject() as RenderRepaintBoundary?;
                // /////////////////////////////png
                final pixelRatio = MediaQuery.of(context).devicePixelRatio;
                // final image = await imageobject!.toImage(pixelRatio: pixelRatio);
                // ByteData? byteData =
                //     await image.toByteData(format: ImageByteFormat.png);
                // final pngbyte = byteData!.buffer.asUint8List();
                // final base64byte = base64Encode(pngbyte);

                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => ScreenShotviewer(
                //               capturedimage: base64byte,
                //             )));

                _controller
                    .captureAsUiImage(delay: Duration(milliseconds: 10))
                    .then((capturedImage) async {
                  final cpi = await capturedImage
                      .toByteData(format: ImageByteFormat.png)
                      .then((v) => v!.buffer.asUint8List());

                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScreenShotviewer(
                                capturedimage: cpi,
                              )));

                  // screenshotview(context, cropped);
                }).catchError((onError) {
                  print(onError);
                });
              },
              child: Icon(Icons.fit_screen)),
        ));
  }
}

class GridTilesCart extends StatefulWidget {
  final bool butnvisible;
  final String pname, pimage, auther;
  final int serial, pprice;
  GridTilesCart(
      {required this.butnvisible,
      required this.pname,
      required this.pimage,
      required this.pprice,
      required this.auther,
      required this.serial});

  @override
  _GridTilesCartState createState() => _GridTilesCartState();
}

class _GridTilesCartState extends State<GridTilesCart> {
  Widget textData(data) {
    return Text(
      data,
      style: TextStyle(
          color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Card(
            elevation: 5,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 60,
                              width: 50,
                              child: Image.network(widget.pimage),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(widget.pname,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold)),
                                    ]),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.work,
                                        size: 14, color: Colors.black45),
                                    textData("  Experince : 6 Years  "),
                                    Icon(Icons.maps_home_work_rounded,
                                        size: 14, color: Colors.black45),
                                    textData(
                                        "  Book: Serial no.${widget.serial}  "),
                                  ],
                                ),
                                SizedBox(height: 7),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.location_on,
                                        size: 14, color: Colors.black45),
                                    textData("  Gohad  "),
                                    Icon(Icons.timer_sharp,
                                        size: 14, color: Colors.black45),
                                    textData(" Published by.${widget.auther} "),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: textData("Applied"),
                        )
                      ]),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            borderbox("Advance Hacking", Colors.black45,
                                Colors.cyan, 11),
                            borderbox(
                                "Blocking", Colors.black45, Colors.cyan, 11),
                          ],
                        ),
                        Row(
                          children: [
                            borderbox("Reward Rs.200", Colors.white,
                                Colors.black26, 18),
                            Icon(Icons.price_change),
                            Text("${widget.pprice}",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))
                          ],
                        )
                      ],
                    ),
                  )
                ]),
          )),
    ));
  }

  Widget borderbox(title, color, bgcolor, fsize) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Container(
        child: Card(
          elevation: 4,
          color: bgcolor,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              title,
              style: TextStyle(color: color, fontSize: fsize),
            ),
          ),
        ),
      ),
    );
  }
}
