import 'package:flutter/material.dart';

import 'package:otus_home_food/components/list_assets.dart';
import 'package:otus_home_food/components/db/db_menu.dart';

part 'package:otus_home_food/components/db/db_menu_all.dart';

part 'package:otus_home_food/components/db/titles/db_titles_burger.dart';
part 'package:otus_home_food/components/db/titles/db_titles_cookies.dart';
part 'package:otus_home_food/components/db/titles/db_titles_donuts.dart';
part 'package:otus_home_food/components/db/titles/db_titles_manti.dart';
part 'package:otus_home_food/components/db/titles/db_titles_pancakes.dart';
part 'package:otus_home_food/components/db/titles/db_titles_pastaBolognese.dart';
part 'package:otus_home_food/components/db/titles/db_titles_waffles.dart';

part 'package:otus_home_food/components/db/steps/db_steps_burger.dart';
part 'package:otus_home_food/components/db/steps/db_steps_cookies.dart';
part 'package:otus_home_food/components/db/steps/db_steps_donuts.dart';
part 'package:otus_home_food/components/db/steps/db_steps_manti.dart';
part 'package:otus_home_food/components/db/steps/db_steps_pancakes.dart';
part 'package:otus_home_food/components/db/steps/db_steps_pastaBolognese.dart';
part 'package:otus_home_food/components/db/steps/db_steps_waffles.dart';

part 'package:otus_home_food/components/db/ingredients/db_ingredients_burger.dart';
part 'package:otus_home_food/components/db/ingredients/db_ingredients_cookies.dart';
part 'package:otus_home_food/components/db/ingredients/db_ingredients_donuts.dart';
part 'package:otus_home_food/components/db/ingredients/db_ingredients_manti.dart';
part 'package:otus_home_food/components/db/ingredients/db_ingredients_pancakes.dart';
part 'package:otus_home_food/components/db/ingredients/db_ingredients_pastaBolognese.dart';
part 'package:otus_home_food/components/db/ingredients/db_ingredients_waffles.dart';

class Testexample extends StatefulWidget {
  const Testexample({Key? key}) : super(key: key);

  @override
  _TestexampleState createState() => _TestexampleState();
}

class _TestexampleState extends State<Testexample> {
  @override
  void initState() {
    List<Food> foods = _generateFoods();
    var food = foods[1];
    print(foods.length);
    print(food.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: []));
  }
}
