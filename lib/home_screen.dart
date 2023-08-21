import 'package:flutter/material.dart';
import 'package:otus_home_food/splash_screen.dart';

const TextStyle textbuttonShow =
    TextStyle(color: textbuttonColor, fontSize: 15);
const Color textbuttonColor = Color.fromRGBO(30, 89, 57, 0.965);

const Color backgroundColor = Color.fromRGBO(255, 255, 255, 0.965);
const Color iconColor = Color.fromRGBO(94, 110, 130, 10);

const TextStyle unselectTextName =
    TextStyle(color: unselectTextColor, fontSize: 35);
const Color unselectTextColor = Colors.black;

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
Widget _listView_menu() {
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
final sign_bool = false;

TextEditingController loginController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController twopasswordController = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  int a_len = 7;
  void auth_void() {
    print(sign_bool);
    print(loginController.text);
    print(passwordController.text);
    print(twopasswordController.text);

    loginController.clear();
    passwordController.clear();
    twopasswordController.clear();
  }

  @override
  void initState() {
    createLists_menu(1, assets_1, "Пончики", "60 минут");
    createLists_menu(2, assets_2, "Домашние венские вафли", "10 минут");
    createLists_menu(
        3, assets_3, "Нежное печенье с шоколадной крошкой", "60 минут");
    createLists_menu(4, assets_4, "Домашний бургер", "35 минут");
    createLists_menu(5, assets_5, "Манты", "1 час 20 минут");
    createLists_menu(
        6, assets_6, "Паста болоньезе классическая", "1 час 10 минут");
    createLists_menu(7, assets_7, "Тонкие блины на молоке", "30 минут");


    super.initState();
  }

  Card _create_newCard(
      var _key, var _nameImage, var _titleName, var _titleTime) {
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

  void createLists_menu(var _key, var _image, var _title, var _time) {
    var group = _GroupControllers();

    var nameImagecard = _create_newCard(_key, _image, _title, _time);

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
                    if(_selectedIndex == 0)
                      Expanded(
                          child: SingleChildScrollView(
                              child: Container(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                for (var i = 0; i < _groupControllers.length; i++)
                                   _name_imageCard[i]
                                  //Text(i.toString())
                              ],
                            ),
                          ],
                        ),))),
                      if(_selectedIndex == 1)
                        (sign_bool == false)
        ?
        // --------- РЕГИСТРАЦИЯ ---------
        Expanded(
            child: SingleChildScrollView(
                child: Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Text(
                  'HOME',
                  style: unselectTextName,
                ),
                Text(
                  'OTUS',
                  style: unselectTextName,
                ),
                Text(
                  'FOODS',
                  style: unselectTextName,
                ),SizedBox(height: 25,),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: loginController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Логин',
                        ),
                      ),
                    ),SizedBox(height: 25,),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Пароль',
                        ),
                      ),
                    ),SizedBox(height: 25,),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                        obscureText: true,
                        controller: twopasswordController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Пароль еще раз',
                        ),
                      ),
                    ),SizedBox(height: 25,),
                    Container(
                        height: 50,
                        width: 150,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          child: const Text('Вход'),
                          onPressed: () {
                            // print(loginController.text);
                            // print(passwordController.text);
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
                Text(
                  'HOME',
                  style: unselectTextName,
                ),
                Text(
                  'OTUS',
                  style: unselectTextName,
                ),
                Text(
                  'FOODS',
                  style: unselectTextName,
                ),SizedBox(height: 25,),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: loginController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Логин',
                        ),
                      ),
                    ),SizedBox(height: 25,),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Пароль',
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          child: const Text('Вход'),
                          onPressed: () {
                            // print(loginController.text);
                            // print(passwordController.text);
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
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_pizza),
                  label: 'Рецепты',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: 'Вход',
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

    throw UnimplementedError();
  }
}
