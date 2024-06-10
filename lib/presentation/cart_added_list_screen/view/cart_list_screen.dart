// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:http/http.dart';
// import 'package:provider/provider.dart';
// import 'package:shopping_cart_intership/presentation/home_screen/view/bottom_sheet.dart';
// import 'package:shopping_cart_intership/repositary/api/get_product_list_api.dart';

// class Cartlistscreen extends StatefulWidget {
//   const Cartlistscreen({
//     super.key,
//   });

//   @override
//   State<Cartlistscreen> createState() => _CartlistscreenState();
// }

// class _CartlistscreenState extends State<Cartlistscreen> {
//   @override
//   Widget build(BuildContext context) {
//     final providercart = Provider.of<GetProductListApicontroller>(context);

//     return Scaffold(
//         body: ListView.builder(
//       itemCount: 2,
//       itemBuilder: (context, index) => ListTile(
//         leading: CircleAvatar(
//           radius: 20,
//           backgroundColor: Colors.amber,
//         ),
//         title: Text(""),
//       ),
//     ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_intership/presentation/home_screen/view/home_screen.dart';
import 'package:shopping_cart_intership/repositary/api/get_product_list_api.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({Key? key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  Widget build(BuildContext context) {
    final homescreenProvider =
        Provider.of<GetProductListApicontroller>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Homescreen(),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: homescreenProvider.myBox.length,
            itemBuilder: (context, index) {
              var product = homescreenProvider.myBox.getAt(index);
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(product['img'] ?? ""),
                        ),
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['title'] ?? "",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "\$${product['price'] ?? ""}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          WidgetStatePropertyAll(Colors.red)),
                                  onPressed: () {
                                    // Call the deleteData method when the "Remove" button is tapped
                                    homescreenProvider.deleteData(index);
                                    setState(() {});
                                  },
                                  child: Text("delete",
                                      style: TextStyle(color: Colors.white)))
                              // InkWell(
                              //   onTap: () {
                              //     // Call the deleteData method when the "Remove" button is tapped
                              //     homescreenProvider.deleteData(index);
                              //     setState(() {});
                              //   },
                              //   child: Container(
                              //     padding: const EdgeInsets.symmetric(
                              //       horizontal: 10,
                              //       vertical: 5,
                              //     ),
                              //     decoration: BoxDecoration(
                              //       border: Border.all(color: Colors.blue),
                              //       borderRadius: BorderRadius.circular(100),
                              //     ),
                              //     child: const Text("Delete"),
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    color: Colors.amber,
                    child: Center(
                        child: Text(
                      "Total :279.00",
                      style: TextStyle(fontSize: 30),
                    )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 50,
                    color: Colors.green,
                    child: Center(
                        child: Text(
                      "Buy Now",
                      style: TextStyle(fontSize: 30),
                    )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
