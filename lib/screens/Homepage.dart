import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:open_diary/model/data.dart';
import './detailsPage.dart';
import 'package:open_diary/widget/navigation_drawer_widget.dart';





class Homepage extends StatelessWidget {
  static final String title = 'Navigation Drawer';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primarySwatch: Colors.red),
    home: MainPage(),
  );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int indx = 0;
  int _selectedIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      drawer: NavigationDrawerWidget(),
      //endDrawer: NavigationDrawerWidget(),
      appBar: AppBar(

      ),
    body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(size.height * 0.05),
                        child: Container(
                            width: size.width * 0.9,
                            height: size.height * 0.07,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.circular(size.height * 0.05)),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      //color: Colors.white,
                                      height: constraints.maxHeight * 0.9,
                                      width: constraints.maxWidth * 0.2,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Icon(
                                          Icons.search,
                                          size: 30,
                                          color: Colors.black.withOpacity(0.4),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      //color: Colors.red,
                                        width: constraints.maxWidth * 0.6,
                                        height: constraints.maxHeight,
                                        child: TextField(
                                          decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                              filled: false,
                                              hintText: "Search by Title,Author,Genre",
                                              hintStyle: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.black
                                                          .withOpacity(0.4)))),
                                          cursorColor: Colors.black45,
                                          onChanged: (stringSearch) {},
                                        )),
                                    Container(
                                      //color: Colors.white,
                                      height: constraints.maxHeight * 0.9,
                                      width: constraints.maxWidth * 0.192,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Icon(
                                          Icons.filter_list,
                                          size: 30,
                                          color: Colors.black.withOpacity(0.8),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            )),
                      ),
                      SizedBox(
                        height: size.height * 0.006,
                      ),
                      Container(
                        height: size.height *
                            (1 +
                                (-0.07 -
                                    0.005 -
                                    0.1 -
                                    0.091 -
                                    0.042)), //color: Colors.red,

                        child: ListView(
                          children: [
                            Container(
                              //color: Colors.red,
                              height: size.height * 0.35,
                              width: double.infinity,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Column(
                                    children: [
                                      Container(
                                        //color: Colors.purple,
                                          width: constraints.maxWidth,
                                          height: constraints.maxHeight * 0.15,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: constraints.maxWidth * 0.03),
                                          child: LayoutBuilder(
                                            builder: (context, constraints) {
                                              return Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    color: Colors.white,
                                                    height: constraints.maxHeight,
                                                    width: constraints.maxWidth * 0.5,
                                                    child: FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: Text(
                                                        "Continue Reading",
                                                        style: GoogleFonts.lato(
                                                            textStyle: TextStyle(
                                                                fontWeight:
                                                                FontWeight.w600,
                                                                color: Colors.black
                                                                    .withOpacity(0.85),
                                                                fontSize: 25)),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    color: Colors.white,
                                                    height: constraints.maxHeight,
                                                    width: constraints.maxWidth * 0.2,
                                                    child: FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: Text(
                                                        "view all",
                                                        style: GoogleFonts.lato(
                                                            textStyle: TextStyle(
                                                                fontWeight:
                                                                FontWeight.w400,
                                                                color: Colors.black
                                                                    .withOpacity(0.5),
                                                                fontSize: 15)),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          )),
                                      Container(
                                        //color: Colors.green,
                                          height: constraints.maxHeight * 0.85,
                                          width: constraints.maxWidth,
                                          child: LayoutBuilder(
                                            builder: (context, constraints) {
                                              List<Booksdata> current = continueReading;
                                              return ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                itemCount: current.length,
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                DetailsPage(
                                                                  imageAddress:
                                                                  continueReading[index]
                                                                      .imagePath,
                                                                  authorname:
                                                                  continueReading[index]
                                                                      .authorName,
                                                                  bookname:
                                                                  continueReading[index]
                                                                      .bookname,
                                                                ),
                                                          ),
                                                        ),
                                                        child: Hero(
                                                          tag: Text("Haha"),
                                                          child: Container(
                                                            margin: EdgeInsets.symmetric(
                                                                horizontal:
                                                                constraints.maxWidth *
                                                                    0.025),
                                                            width: constraints.maxWidth *
                                                                0.34,
                                                            height:
                                                            constraints.maxHeight *
                                                                0.84,
                                                            decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius
                                                                    .circular(constraints
                                                                    .maxHeight *
                                                                    0.081),
                                                                image: DecorationImage(
                                                                    fit: BoxFit.cover,
                                                                    image: AssetImage(
                                                                        current[index]
                                                                            .imagePath)),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      blurRadius: 3,
                                                                      spreadRadius: 2,
                                                                      offset:
                                                                      Offset(4, 1),
                                                                      color: Colors.black
                                                                          .withOpacity(
                                                                          0.1))
                                                                ]),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: constraints.maxHeight *
                                                            0.01,
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.only(
                                                            left: constraints.maxWidth *
                                                                0.05),
                                                        height: constraints.maxHeight *
                                                            0.07,
                                                        width:
                                                        constraints.maxWidth * 0.39,
                                                        //color: Colors.red,
                                                        child: FittedBox(
                                                            alignment:
                                                            Alignment.centerLeft,
                                                            child: Text(
                                                              current[index].bookname,
                                                              style: GoogleFonts.lato(
                                                                  color: Color.fromRGBO(
                                                                      66, 66, 86, 1),
                                                                  fontWeight:
                                                                  FontWeight.w400),
                                                            )),
                                                      ),
                                                      Container(
                                                        height: constraints.maxHeight *
                                                            0.05,
                                                        width:
                                                        constraints.maxWidth * 0.39,
                                                        padding: EdgeInsets.only(
                                                            left: constraints.maxWidth *
                                                                0.05),
                                                        //color: Colors.red,
                                                        child: LayoutBuilder(
                                                          builder:
                                                              (context, constraints) {
                                                            return Row(
                                                              children: [
                                                                Container(
                                                                    height: constraints
                                                                        .maxHeight *
                                                                        0.60,
                                                                    width: constraints
                                                                        .maxWidth *
                                                                        0.8,
                                                                    decoration: BoxDecoration(
                                                                        color: Color
                                                                            .fromRGBO(
                                                                            230,
                                                                            230,
                                                                            232,
                                                                            1),
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                            constraints.maxHeight *
                                                                                0.3)),
                                                                    child: Stack(
                                                                      children: [
                                                                        Container(
                                                                          height: constraints
                                                                              .maxHeight,
                                                                          width: constraints
                                                                              .maxWidth *
                                                                              current[index]
                                                                                  .percentageCompleted *
                                                                              0.01,
                                                                          decoration: BoxDecoration(
                                                                              color: Color
                                                                                  .fromRGBO(
                                                                                  66,
                                                                                  66,
                                                                                  86,
                                                                                  1),
                                                                              borderRadius:
                                                                              BorderRadius.circular(constraints.maxHeight *
                                                                                  0.3)),
                                                                        )
                                                                      ],
                                                                    )),
                                                                Container(
                                                                  height: constraints
                                                                      .maxHeight,
                                                                  width: constraints
                                                                      .maxWidth *
                                                                      0.2,
                                                                  child: FittedBox(
                                                                      child: Text(
                                                                        current[index]
                                                                            .percentageCompleted
                                                                            .toString() +
                                                                            "%",
                                                                        style: GoogleFonts.lato(
                                                                            textStyle: TextStyle(
                                                                                fontWeight:
                                                                                FontWeight
                                                                                    .w400,
                                                                                color: Colors
                                                                                    .black
                                                                                    .withOpacity(
                                                                                    0.7))),
                                                                      )),
                                                                )
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      )
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          ))
                                    ],
                                  );
                                },
                              ),
                            ),
                            Container(
                              //color: Colors.red,
                              height: size.height * 0.45,
                              width: double.infinity,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Column(
                                    children: [
                                      Container(
                                        //color: Colors.purple,
                                          width: constraints.maxWidth,
                                          height: constraints.maxHeight * 0.1,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: constraints.maxWidth * 0.03),
                                          child: LayoutBuilder(
                                            builder: (context, constraints) {
                                              return Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    color: Colors.white,
                                                    height: constraints.maxHeight,
                                                    width: constraints.maxWidth * 0.5,
                                                    child: FittedBox(
                                                      alignment: Alignment.topLeft,
                                                      fit: BoxFit.scaleDown,
                                                      child: Text(
                                                        "Top Ten",
                                                        style: GoogleFonts.lato(
                                                            textStyle: TextStyle(
                                                                fontWeight:
                                                                FontWeight.w600,
                                                                color: Colors.black
                                                                    .withOpacity(0.85),
                                                                fontSize: 23)),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    color: Colors.white,
                                                    height: constraints.maxHeight,
                                                    width: constraints.maxWidth * 0.2,
                                                    child: FittedBox(
                                                      alignment: Alignment.centerRight,
                                                      fit: BoxFit.scaleDown,
                                                      child: Text(
                                                        "view all",
                                                        style: GoogleFonts.lato(
                                                            textStyle: TextStyle(
                                                                fontWeight:
                                                                FontWeight.w400,
                                                                color: Colors.black
                                                                    .withOpacity(0.5),
                                                                fontSize: 15)),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          )),
                                      Container(
                                        //color: Colors.red,
                                        width: constraints.maxWidth,
                                        height: constraints.maxHeight * 0.08,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: constraints.maxWidth * 0.03),
                                        child: LayoutBuilder(
                                          builder: (context, constraints) {
                                            return Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      indx = 0;
                                                    });
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal:
                                                        constraints.maxHeight *
                                                            0.33),
                                                    height: constraints.maxHeight * 0.8,
                                                    width: constraints.maxWidth / 5,
                                                    decoration: BoxDecoration(
                                                        color: indx == 0
                                                            ? Color.fromRGBO(
                                                            66, 66, 86, 1)
                                                            : Color.fromRGBO(
                                                            238, 238, 238, 1),
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            constraints.maxHeight *
                                                                0.3)),
                                                    child: FittedBox(
                                                        child: Text(
                                                          "Self-Help",
                                                          style: GoogleFonts.lato(
                                                              textStyle: TextStyle(
                                                                  color: indx == 0
                                                                      ? Colors.white
                                                                      : Color.fromRGBO(171,
                                                                      171, 179, 1))),
                                                        )),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      indx = 1;
                                                    });
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal:
                                                        constraints.maxHeight *
                                                            0.33),
                                                    height: constraints.maxHeight * 0.8,
                                                    width: constraints.maxWidth / 5,
                                                    decoration: BoxDecoration(
                                                        color: indx == 1
                                                            ? Color.fromRGBO(
                                                            66, 66, 86, 1)
                                                            : Color.fromRGBO(
                                                            238, 238, 238, 1),
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            constraints.maxHeight *
                                                                0.3)),
                                                    child: FittedBox(
                                                        child: Text(
                                                          "Finance",
                                                          style: GoogleFonts.lato(
                                                              textStyle: TextStyle(
                                                                  color: indx == 1
                                                                      ? Colors.white
                                                                      : Color.fromRGBO(171,
                                                                      171, 179, 1))),
                                                        )),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      indx = 2;
                                                    });
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal:
                                                        constraints.maxHeight *
                                                            0.33),
                                                    height: constraints.maxHeight * 0.8,
                                                    width: constraints.maxWidth / 5,
                                                    decoration: BoxDecoration(
                                                        color: indx == 2
                                                            ? Color.fromRGBO(
                                                            66, 66, 86, 1)
                                                            : Color.fromRGBO(
                                                            238, 238, 238, 1),
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            constraints.maxHeight *
                                                                0.3)),
                                                    child: FittedBox(
                                                        child: Text(
                                                          "Fantasy",
                                                          style: GoogleFonts.lato(
                                                              textStyle: TextStyle(
                                                                  color: indx == 2
                                                                      ? Colors.white
                                                                      : Color.fromRGBO(171,
                                                                      171, 179, 1))),
                                                        )),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      indx = 3;
                                                    });
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal:
                                                        constraints.maxHeight *
                                                            0.33),
                                                    height: constraints.maxHeight * 0.8,
                                                    width: constraints.maxWidth / 5,
                                                    decoration: BoxDecoration(
                                                        color: indx == 3
                                                            ? Color.fromRGBO(
                                                            66, 66, 86, 1)
                                                            : Color.fromRGBO(
                                                            238, 238, 238, 1),
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            constraints.maxHeight *
                                                                0.3)),
                                                    child: FittedBox(
                                                        child: Text(
                                                          "Comedy",
                                                          style: GoogleFonts.lato(
                                                              textStyle: TextStyle(
                                                                  color: indx == 3
                                                                      ? Colors.white
                                                                      : Color.fromRGBO(171,
                                                                      171, 179, 1))),
                                                        )),
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: constraints.maxHeight * 0.031,
                                      ),
                                      Container(
                                        //color: Colors.green,
                                          height: constraints.maxHeight * 0.7,
                                          width: constraints.maxWidth,
                                          child: LayoutBuilder(
                                            builder: (context, constraints) {
                                              return ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                itemCount: popular.length,
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.symmetric(
                                                            horizontal:
                                                            constraints.maxWidth *
                                                                0.025),
                                                        width:
                                                        constraints.maxWidth * 0.35,
                                                        height: constraints.maxHeight *
                                                            0.84,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                constraints
                                                                    .maxHeight *
                                                                    0.081),
                                                            image: DecorationImage(
                                                                fit: BoxFit.cover,
                                                                image: ExactAssetImage(
                                                                    popular[index]
                                                                        .imagePath)),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  blurRadius: 3,
                                                                  spreadRadius: 2,
                                                                  offset: Offset(4, 1),
                                                                  color: Colors.black
                                                                      .withOpacity(0.1))
                                                            ]),
                                                        child: Stack(
                                                          children: [
                                                            Positioned(
                                                              bottom:
                                                              constraints.maxWidth *
                                                                  0.02,
                                                              left:
                                                              constraints.maxWidth *
                                                                  0.02,
                                                              child: Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                    constraints
                                                                        .maxHeight *
                                                                        0.015),
                                                                decoration: BoxDecoration(
                                                                    color: Colors.white,
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        constraints
                                                                            .maxHeight *
                                                                            0.04)),
                                                                height: constraints
                                                                    .maxHeight *
                                                                    0.12,
                                                                width: constraints
                                                                    .maxWidth *
                                                                    0.12,
                                                                child: FittedBox(
                                                                  child: Text(
                                                                    "??? " +
                                                                        popular[index]
                                                                            .rating
                                                                            .toString(),
                                                                    style: GoogleFonts.lato(
                                                                        textStyle: TextStyle(
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .bold)),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: constraints.maxHeight *
                                                            0.01,
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: 10),
                                                        height: constraints.maxHeight *
                                                            0.07,
                                                        width:
                                                        constraints.maxWidth * 0.39,
                                                        //color: Colors.red,
                                                        child: FittedBox(
                                                            alignment:
                                                            Alignment.centerLeft,
                                                            child: Text(
                                                              popular[index].bookname,
                                                              style: GoogleFonts.lato(
                                                                  color: Color.fromRGBO(
                                                                      66, 66, 86, 1),
                                                                  fontWeight:
                                                                  FontWeight.w600),
                                                            )),
                                                      ),
                                                      Container(
                                                          height:
                                                          constraints.maxHeight *
                                                              0.05,
                                                          width: constraints.maxWidth *
                                                              0.39,
                                                          //color: Colors.red,
                                                          child: FittedBox(
                                                              child: Text(
                                                                popular[index].authorName,
                                                                style: GoogleFonts.lato(
                                                                    textStyle: TextStyle(
                                                                        fontWeight:
                                                                        FontWeight.w300,
                                                                        color: Colors.black
                                                                            .withOpacity(
                                                                            0.7))),
                                                              )))
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          ))
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),


              ),

              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    title: Text(
                      'Home',
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.all_inbox,
                    ),
                    title: Text(
                      'Subscription',
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.article,
                    ),
                    title: Text(
                      'Write',
                    ),
                  ),
                ],
                currentIndex: _selectedIndex,
                onTap: _onItemTap,
                selectedFontSize: 13.0,
                unselectedFontSize: 13.0,
              ),


            );
  }
}








