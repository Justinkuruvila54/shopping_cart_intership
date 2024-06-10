// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_intership/presentation/cart_added_list_screen/view/cart_list_screen.dart';
import 'package:shopping_cart_intership/repositary/api/get_product_list_api.dart';
import 'package:shopping_cart_intership/repositary/api/model/product_list_model.dart';

class Bottomsheetcustomcard extends StatefulWidget {
  Bottomsheetcustomcard({
    super.key,
    this.onsavepressed,
    required this.titile,
    required this.image,
    required this.description,
    required this.rating,
    required this.price,
  });

  final void Function()? onsavepressed;
  final String titile;
  final String image;
  final String description;
  final String rating;
  final String price;

  @override
  State<Bottomsheetcustomcard> createState() => _BottomsheetcustomcardState();
}

class _BottomsheetcustomcardState extends State<Bottomsheetcustomcard> {
  int slectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: StatefulBuilder(
            builder: (context, bottomsetState) => Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.favorite),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text(widget.rating),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        " \$${widget.price}",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.titile,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      // to show product item price to bottom sheet

                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Color.fromARGB(46, 24, 178, 96),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            textAlign: TextAlign.justify,
                            widget.description,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        Color.fromARGB(255, 45, 159, 13))),
                                onPressed: () {
                                  GetProductListApicontroller().addData(
                                    title: widget.titile,
                                    description: widget.description,
                                    price: widget.price,
                                    rating: widget.rating,
                                    img: widget.image,
                                  );
                                  // Navigate to the cart screen or perform any other action
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Cartscreen(),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.shopping_cart,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      "add to cart",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                )),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        Color.fromARGB(255, 206, 14, 4))),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "cancel",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
