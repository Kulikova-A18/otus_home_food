import 'package:flutter/material.dart';
import 'package:otus_home_food/splash_screen.dart';

const TextStyle textbuttonShow =
    TextStyle(color: textbuttonColor, fontSize: 15);
const Color textbuttonColor = Color.fromRGBO(30, 89, 57, 0.965);

const TextStyle unselectText =
    TextStyle(color: unselectTextColor, fontSize: 70);

const Color backgroundColor = Color.fromRGBO(255, 255, 255, 0.965);
const Color iconColor = Color.fromRGBO(94, 110, 130, 10);

const TextStyle unselectTextName =
    TextStyle(color: unselectTextColor, fontSize: 35);
const Color unselectTextColor = Colors.black;

const TextStyle textbuttonSign = TextStyle(color: Colors.white, fontSize: 50);
const Color greenColor = Color.fromRGBO(83, 222, 145, 0.965);

const assets_1 = 'assets/1.png';
const assets_2 = 'assets/2.png';
const assets_3 = 'assets/3.png';
const assets_4 = 'assets/4.png';
const assets_5 = 'assets/5.png';
const assets_6 = 'assets/6.png';
const assets_7 = 'assets/7.png';

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
  const HomeScreen({Key? key}) : super(key: key);

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
    createListsMenu(1, assets_1, "Пончики", "60 минут");
    createListsMenu(2, assets_2, "Домашние венские вафли", "10 минут");
    createListsMenu(
        3, assets_3, "Нежное печенье с шоколадной крошкой", "60 минут");
    createListsMenu(4, assets_4, "Домашний бургер", "35 минут");
    createListsMenu(5, assets_5, "Манты", "1 час 20 минут");
    createListsMenu(
        6, assets_6, "Паста болоньезе классическая", "1 час 10 минут");
    createListsMenu(7, assets_7, "Тонкие блины на молоке", "30 минут");

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
                  child: Image.asset(_nameImage),
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
                                  color: greenColor,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  _titleTime,
                                  style: TextStyle(
                                      fontSize: 25, color: greenColor),
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
                //padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    if (_selectedIndex == 0)
                      Expanded(
                          child: SingleChildScrollView(
                              child: Container(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                for (var i = 0;
                                    i < _groupControllers.length;
                                    i++)
                                  _name_imageCard[i]
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
                                                      borderSide: const BorderSide(
                                                          color: Colors.black)),
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
                                            style: const TextStyle(fontSize: 40)),
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
                                                      borderSide: const BorderSide(
                                                          color: Colors.black)),
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
                                            style: const TextStyle(fontSize: 40)),
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
                                                      borderSide: const BorderSide(
                                                          color: Colors.black)),
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
                                            style: const TextStyle(fontSize: 40)),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Container(
                                          // height: 50,
                                          // width: 150,
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 10, 0),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              backgroundColor:
                                                  greenColor, // Background color
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
                                                  greenColor, // Background color
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
              items:  <BottomNavigationBarItem>[
                const BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.local_pizza),
                  label: 'Рецепты',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.people),
                  label: (sign_bool == false)
                          ? 'Регистрация' : 'Вход',
                ) ,
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
