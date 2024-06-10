// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_intership/core/color_constats.dart';
import 'package:shopping_cart_intership/presentation/home_screen/view/bottom_sheet.dart';
import 'package:shopping_cart_intership/repositary/api/get_product_list_api.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int? selectedindex;

  @override
  void initState() {
    getdata();
    super.initState();
  }

  Future<void> getdata() async {
    await Provider.of<GetProductListApicontroller>(context, listen: false)
        .fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    var providerapiget = Provider.of<GetProductListApicontroller>(
      context,
    );
    bool isfvorate = true;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(154, 207, 202, 202),
          title: Center(
            child: Text(
              "Shoppyfy",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: providerapiget.responselist?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 300,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10

                    //  crossAxisSpacing: 5
                    ),
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Bottomsheetcustomcard(
                                  onsavepressed: () {
                                    setState(() {});
                                  },
                                  titile: providerapiget
                                          .responselist?[index].title ??
                                      "",
                                  image: providerapiget
                                          .responselist?[index].image ??
                                      "",
                                  description: providerapiget
                                          .responselist?[index].description ??
                                      "",
                                  rating: providerapiget
                                          .responselist?[index].rating?.rate
                                          .toString() ??
                                      "",
                                  price: providerapiget
                                          .responselist?[index].price
                                          .toString() ??
                                      "")));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 237, 241, 237)
                          // border: Border.all(width: 1)
                          ),
                      child: Column(
                        children: [
                          Stack(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: 170,
                                width: double.infinity,
                                color: Colors.amber,
                                child: Image.network(
                                    providerapiget.responselist?[index].image ??
                                        "",
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Positioned(
                                right: 5,
                                top: 0,
                                child: InkWell(
                                    onTap: () {
                                      selectedindex = index;
                                      setState(() {});
                                    },
                                    child: selectedindex == index
                                        ? Icon(
                                            Icons.favorite,
                                            size: 32,
                                            color: Colors.black,
                                          )
                                        : Icon(
                                            Icons.favorite_border_outlined,
                                            size: 32,
                                            color: Colors.black,
                                          )))
                          ]),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              providerapiget.responselist?[index].title
                                      .toString() ??
                                  "",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          Text(
                            "\$${providerapiget.responselist?[index].price.toString() ?? ""} ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
