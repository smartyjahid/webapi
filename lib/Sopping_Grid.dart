import 'package:flutter/material.dart';

import 'package:webapi/cartvalue.dart';
import 'package:webapi/mapping.dart';

class Gridlist extends StatefulWidget {
  @override
  _GridlistState createState() => _GridlistState();
}

int counter = 0;

class _GridlistState extends State<Gridlist> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Hacker Shop by Self Deveoper'),
            centerTitle: true,
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartData(),
                      ));

                  setState(() {
                    print(counter);
                  });
                },
                child: Row(
                  children: [
                    Icon(Icons.card_giftcard_outlined),
                    Text("$counter")
                  ],
                ),
              )
            ]),
        body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: itemdetail.length,
          itemBuilder: (context, index) {
            return itentilee(
                itemdetail[index].productname,
                itemdetail[index].image,
                itemdetail[index].productprice,
                itemdetail[index].auther,
                itemdetail[index].srialno,
                itemdetail[index].isselected,
                index);
          },
        ));
  }

  Widget itentilee(pname, pimage, pprice, auther, serial, isselected, index) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
          width: 300,
          child: Card(
              elevation: 5,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          child: Image.network(pimage),
                        ),
                        SizedBox(width: 25),
                        Column(
                          children: [
                            Text(pname),
                            SizedBox(
                              height: 10,
                            ),
                            Text(auther),
                            Text(pprice)
                          ],
                        )
                      ]),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 40,
                      child: MaterialButton(
                        color: isselected ? Colors.brown : Colors.purpleAccent,
                        hoverColor: Colors.brown,
                        onPressed: () {
                          print(serial);
                          setState(() {
                            print(isselected);
                            itemdetail[index].isselected =
                                !itemdetail[index].isselected;
                            print(itemdetail[index].isselected);

                            if (itemdetail[index].isselected == true) {
                              cartlist.add(serial);
                              print(cartlist);
                            } else if (itemdetail[index].isselected == false) {
                              cartlist.remove(serial);
                            }
                            counter = itemdetail[index].isselected
                                ? counter + 1
                                : counter - 1;
                          });
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.card_travel,
                              color: isselected
                                  ? Colors.brown
                                  : Colors.purpleAccent,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text("Add To Cart"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}
