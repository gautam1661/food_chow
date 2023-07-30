import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_chow/models/product_model.dart';
import 'package:food_chow/provider/product_provider.dart';
import 'package:provider/provider.dart';

import 'helper_function/my_text_form_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      context
          .read<ProductProvider>()
          .readUser()
          .then((value) => print(value.data));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final productProvider = context.watch<ProductProvider>();
    // final UserList = productProvider.users;
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              color: Colors.tealAccent.shade700,
              iconSize: 25,
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        centerTitle: true,
        title: SizedBox(
          height: 35,
          child: Image.asset("asset/images/logo.png"),
        ),
        toolbarHeight: 60,
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.tealAccent.shade700,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.document_scanner_outlined,
              color: Colors.tealAccent.shade700,
              size: 25,
            ),
            tooltip: 'Scan Product',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      // body: Column(
      //   children: [
      //     MyTextFormField(
      //       hintText: "Search user...",
      //       contentPadding: const EdgeInsets.symmetric(
      //         horizontal: 20,
      //         vertical: 8,
      //       ),
      //     ),
      //   ],
      // ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: "Search Restaurant Name",
                  hintStyle: TextStyle(color: Colors.tealAccent.shade700),
                  suffixIcon: Icon(Icons.search,color: Colors.tealAccent.shade700,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  // final ProductModel user = productProvider.users.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.teal.shade700,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                child: Image.asset(
                                  "asset/images/food01.jpg",
                                  height: 200,
                                  width: 330,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            " OXI Tea Room",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 5),
                            child: Row(
                              children: [
                                Image.asset(
                                  "asset/images/dinner.png",
                                  height: 22,
                                  width: 27,
                                  color: Colors.tealAccent.shade700,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "pizza and Burger",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 5),
                            child: Row(
                              children: [
                                Text(
                                  "carlton carlton",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300),
                                ),
                                Icon(
                                  Icons.location_on,
                                  color: Colors.tealAccent.shade700,
                                ),
                                Text(
                                  "4 KM",
                                  style: TextStyle(
                                    color: Colors.tealAccent.shade700,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              Text(
                                "Dine IN ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                              ),
                              Icon(
                                Icons.circle_rounded,
                                size: 10,
                                color: Colors.black26,
                              ),
                              Text(
                                " TakeAway ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                              ),
                              Icon(
                                Icons.circle_rounded,
                                size: 10,
                                color: Colors.black26,
                              ),
                              Text(
                                " In APP Order",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                              ),
                            ]),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
