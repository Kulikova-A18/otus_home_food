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

final List<_GroupControllers> _groupControllers = [];
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

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    createLists_menu(1, assets_1, "Пончики", "60 минут");
    createLists_menu(2, assets_2, "Домашние венские вафли", "10 минут");
    createLists_menu(3, assets_3, "Нежное печенье с шоколадной крошкой", "60 минут");
    createLists_menu(4, assets_4, "Домашний бургер", "35 минут");
    createLists_menu(5, assets_5, "Манты", "1 час 20 минут");
    createLists_menu(6, assets_6, "Паста болоньезе классическая", "1 час 10 минут");
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
                                Text(_titleTime, style: TextStyle(fontSize: 25, color: greenColor),),
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

    var name_imageCard = _create_newCard(_key, _image, _title, _time);

    setState(() {
      // List<Card>
      _groupControllers.add(group);
      _name_imageCard.add(name_imageCard);
    });
  }

  Widget _listView() {
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
              title: new Center(child: new Text("Рецепты", textAlign: TextAlign.center, style: unselectText,)),
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
                    Expanded(child: _listView()),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );

    throw UnimplementedError();
  }
}
