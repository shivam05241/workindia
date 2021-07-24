import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool one = false;

  Widget items(String name, String price) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        width: 90,
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text('$name'),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "$price",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> map = [
    {"name": "Item 1", "price": "₹ 100", "extra": "Same day shipping"},
    {"name": "Item 2", "price": "₹ 400", "extra": "Same day shipping"},
    {"name": "Item 3", "price": "₹ 100", "extra": "Same day shipping"},
    {"name": "Item 4", "price": "₹ 80", "extra": null},
    {"name": "Item 5", "price": "₹ 190", "extra": null},
    {"name": "Item 6", "price": "₹ 70", "extra": null},
    {"name": "Item 7", "price": "₹ 190", "extra": null},
    {"name": "Item 8", "price": "₹ 190", "extra": null},
    {"name": "Item 9", "price": "₹ 190", "extra": null},
    {"name": "Item 10", "price": "₹ 190", "extra": null}
  ];

  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    searchController = TextEditingController();
    searchController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Color(0xffb5d3e7),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Explore',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Filter',
                            style: TextStyle(
                                color: Colors.lightGreen, fontSize: 18),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40)),
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: TextField(
                          controller: searchController,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Container(
                  child: one == false
                      ? ListView.builder(
                          itemCount: map.length,
                          itemBuilder: (Context, index) {
                            return searchController.text.isEmpty ||
                                    map[index]['name']
                                        .toString()
                                        .toUpperCase()
                                        .startsWith(
                                            searchController.text.toUpperCase())
                                ? Column(
                                    children: [
                                      Container(
                                        height: 60,
                                        color: Colors.white,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.grey[300]),
                                                  height: 50,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border(
                                                      bottom: BorderSide(
                                                          width: 1,
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                  height: 60,
                                                  padding:
                                                      EdgeInsets.only(left: 20),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Text(
                                                        map[index]['name'],
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Opacity(
                                                                  opacity: 0.5,
                                                                  child: Text(
                                                                      'MRP:')),
                                                              Text(
                                                                  '${map[index]['price']}'),
                                                            ],
                                                          ),
                                                          Expanded(
                                                            child: Opacity(
                                                              opacity: 0.5,
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: map[index]
                                                                            [
                                                                            'extra'] !=
                                                                        null
                                                                    ? Text(
                                                                        '${map[index]['extra']}',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12),
                                                                      )
                                                                    : SizedBox(),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Container();
                          })
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SingleChildScrollView(
                            child: Align(
                              alignment: Alignment.center,
                              child: Wrap(
                                children: map
                                    .map((item) =>
                                        searchController.text.isEmpty ||
                                                item['name']
                                                    .toString()
                                                    .toUpperCase()
                                                    .startsWith(searchController
                                                        .text
                                                        .toString()
                                                        .toUpperCase())
                                            ? items(item['name'], item['price'])
                                            : Container())
                                    .toList()
                                    .cast<Widget>(),
                              ),
                            ),
                          ),
                        ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            one = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: one == false ? Colors.green : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            one = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: one == true ? Colors.green : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
