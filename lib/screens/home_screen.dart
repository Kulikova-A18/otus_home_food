import 'package:flutter/material.dart';

import 'package:otus_home_food/components/colors.dart';
import 'package:otus_home_food/components/textStyle.dart';
import 'package:otus_home_food/components/list_assets.dart';

import 'package:otus_home_food/components/db/db_menu.dart';

const TextStyle textbuttonSign = TextStyle(color: Colors.white, fontSize: 50);

void main(List<String> args) {
  runApp(HomeScreen());
}

List<_GroupControllers> _groupControllers = [];
List<Card> _name_imageCard = [];

class _GroupControllers {
  TextEditingController name_image = TextEditingController();

  void dispose() {
    name_image.dispose;
  }
}

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// РЕЦЕПТЫ
Widget _listViewMenu() {
  final children = [
    Column(
      children: [
        for (var i = 0; i < _groupControllers.length; i++) _name_imageCard[i]
      ],
    ),
  ];

  return SingleChildScrollView(
      child: Container(
    padding: const EdgeInsets.all(30.0),
    child: Column(
      children: children,
    ),
  ));
}

// ===========

TextEditingController loginController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController twopasswordController = TextEditingController();
List<Food> _generateFoods() {
  List<Food> foods = [];
  foods.add(
    Food(
        title: "Пончики",
        time: 60,
        id: 1,
        steps: List.empty(),
        ingredients: List.empty(),
        imgLocalSource: assets_donuts),
  );
  foods.add(Food(
      title: "Венские вафли",
      time: 10,
      id: 2,
      steps: List.empty(),
      ingredients: List.empty(),
      imgLocalSource: assets_vienneseWaffles));
  foods.add(Food(
      title: "Печенье с шоколадной крошкой",
      time: 60,
      id: 3,
      ingredients: List.empty(),
      steps: List.empty(),
      imgLocalSource: assets_delicateChocolateChipCookies));
  foods.add(Food(
      title: "Бургер",
      time: 35,
      id: 4,
      steps: List.empty(),
      ingredients: List.empty(),
      imgLocalSource: assets_burger));
  foods.add(Food(
      title: "Манты",
      time: 80,
      id: 5,
      ingredients: List.empty(),
      steps: List.empty(),
      imgLocalSource: assets_manti));
  foods.add(Food(
      title: "Паста болоньезе",
      time: 70,
      id: 6,
      ingredients: List.empty(),
      steps: List.empty(),
      imgLocalSource: assets_pastaBolognese));
  foods.add(Food(
      title: "Блины на молоке",
      time: 30,
      id: 7,
      ingredients: List.empty(),
      steps: List.empty(),
      imgLocalSource: assets_thinPancakesWithMilk));
  return foods;
}

class _HomeScreenState extends State<HomeScreen> {
  bool sign_bool = false;

  void auth_void() {
    print(sign_bool);
    print(loginController.text);
    print(passwordController.text);
    print(twopasswordController.text);

    loginController.clear();
    passwordController.clear();
    twopasswordController.clear();

    setState(() {
      sign_bool = !sign_bool;
    });
  }

  @override
  void initState() {
    List<Food> foods = _generateFoods();
    for (int i = 0; i < foods.length; i++) {
      var food = foods[i];
      createListsMenu(i, food.getLocalPath(), food.title, food.getTimeValue());
    }

    super.initState();
  }

  Card createNewCard(var _key, var _nameImage, var _titleName, var _titleTime) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Table(
          //border: TableBorder.all(),
          columnWidths: const <int, TableColumnWidth>{
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(100),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(15.0),
                  height: 220,
                  width: 180,
                  //color: Colors.red,
                  child: Image.asset(_nameImage, fit: BoxFit.cover),
                ),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          child: Center(
                            child: Text(
                              _titleName,
                              style: unselectTextName,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: Container(
                            padding: const EdgeInsets.only(left: 30),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  color: amberColor,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  _titleTime,
                                  style: TextStyle(
                                      fontSize: 25, color: amberColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: Container(
                            padding: const EdgeInsets.only(right: 30),
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                print(_key);
                              },
                              child: Text(
                                'Смотреть рецепт',
                                style: textbuttonShow,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ));
  }

  void createListsMenu(var _key, var _image, var _title, var _time) {
    var group = _GroupControllers();

    var nameImagecard = createNewCard(_key, _image, _title, _time);

    setState(() {
      // List<Card>
      _groupControllers.add(group);
      _name_imageCard.add(nameImagecard);
    });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: unselectTextColor,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (BuildContext context) {
        /* Flutter's SafeArea Widget is a handy way to 
        make sure your interface isn't clipped by any 
        of the notches and cutouts that are very common 
        on smartphone screens these days */
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Center(
                  child: Text(
                (_selectedIndex == 0) ? "Рецепты" : "",
                textAlign: TextAlign.center,
                style: unselectText,
              )),
              iconTheme: IconThemeData(color: iconColor),
              elevation: 0.0,
              backgroundColor: backgroundColor,
              automaticallyImplyLeading: true,
            ),
            //drawer: maindrawer(),
            body: Center(
              child: Container(
                alignment: Alignment.center,
                color: backgroundColor,
                child: Column(
                  children: [
                    if (_selectedIndex == 0)
                      Expanded(
                          child: SingleChildScrollView(
                              child: Container(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            for (var i = 0; i < _groupControllers.length; i++)
                              Column(
                                children: [
                                  _name_imageCard[i],
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 50,
                                  )
                                ],
                              ),
                          ],
                        ),
                      ))),
                    if (_selectedIndex == 1)
                      (sign_bool == false)
                          ?
                          // --------- РЕГИСТРАЦИЯ ---------
                          Expanded(
                              child: SingleChildScrollView(
                                  child: Container(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'HOME',
                                    style: unselectText,
                                  ),
                                  const Text(
                                    'OTUS',
                                    style: unselectText,
                                  ),
                                  const Text(
                                    'FOODS',
                                    style: unselectText,
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 50,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        child: TextField(
                                            cursorColor: Colors.black,
                                            controller: loginController,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: Colors.black)),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Colors
                                                                  .black)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: Colors.black)),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              hintText: 'Логин',
                                            ),
                                            style:
                                                const TextStyle(fontSize: 40)),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                50,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 10, 10, 0),
                                        child: TextField(
                                            cursorColor: Colors.black,
                                            obscureText: true,
                                            controller: passwordController,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: Colors.black)),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Colors
                                                                  .black)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: Colors.black)),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              hintText: 'Пароль',
                                            ),
                                            style:
                                                const TextStyle(fontSize: 40)),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                50,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 10, 10, 0),
                                        child: TextField(
                                            cursorColor: Colors.black,
                                            obscureText: true,
                                            controller: twopasswordController,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: Colors.black)),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Colors
                                                                  .black)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: Colors.black)),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              hintText: 'Пароль еще раз',
                                            ),
                                            style:
                                                const TextStyle(fontSize: 40)),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                50,
                                      ),
                                      Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              15,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          // padding: const EdgeInsets.fromLTRB(
                                          //     10, 0, 10, 0),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              backgroundColor:
                                                  amberColor, // Background color
                                            ),
                                            child: const Text(
                                              'Регистрация',
                                              style: textbuttonSign,
                                            ),
                                            onPressed: () {
                                              auth_void();
                                            },
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            )))
                          :
                          // --------- ВХОД ---------
                          Expanded(
                              child: SingleChildScrollView(
                                  child: Container(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'HOME',
                                    style: unselectText,
                                  ),
                                  const Text(
                                    'OTUS',
                                    style: unselectText,
                                  ),
                                  const Text(
                                    'FOODS',
                                    style: unselectText,
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        child: TextField(
                                            cursorColor: Colors.black,
                                            controller: loginController,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: Colors.black)),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Colors
                                                                  .black)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: Colors.black)),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              hintText: 'Логин',
                                            ),
                                            style: TextStyle(fontSize: 40)),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 10, 10, 0),
                                        child: TextField(
                                            cursorColor: Colors.black,
                                            obscureText: true,
                                            controller: passwordController,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: Colors.black)),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Colors
                                                                  .black)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: Colors.black)),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              hintText: 'Пароль',
                                            ),
                                            style:
                                                const TextStyle(fontSize: 40)),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Container(
                                          // height: 50,
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 20, 0),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              backgroundColor:
                                                  amberColor, // Background color
                                            ),
                                            child: const Text(
                                              'Вход',
                                              style: textbuttonSign,
                                            ),
                                            onPressed: () {
                                              auth_void();
                                            },
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ))),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 0,
              iconSize: 40,
              selectedFontSize: 40,
              unselectedFontSize: 25,
              selectedIconTheme:
                  const IconThemeData(color: Colors.amberAccent, size: 50),
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedIconTheme: const IconThemeData(
                color: iconColor,
              ),
              unselectedItemColor: iconColor,
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              backgroundColor: Colors.white,
              items: <BottomNavigationBarItem>[
                const BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.local_pizza),
                  label: 'Рецепты',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.people),
                  label: (sign_bool == false) ? 'Регистрация' : 'Вход',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
            ),
          ),
        );
      }),
    );

    //throw UnimplementedError();
  }
}
