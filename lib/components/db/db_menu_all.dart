part of 'package:otus_home_food/screens/home_screen.dart';

List<Food> _generateFoods() {
  List<Food> foods = [];
  foods.add(
    Food(
        title: "Пончики",
        time: 60,
        id: 1,
        steps: _generate_donutsSteps(1),
        ingredients: _generate_donutsIngredients(1),
        imgLocalSource: assets_donuts),
  );
  foods.add(Food(
      title: "Домашние венские вафли",
      time: 10,
      id: 2,
      steps: _generate_wafflesSteps(2),
      ingredients: _generate_wafflesIngredients(2),
      imgLocalSource: assets_vienneseWaffles));
  foods.add(Food(
      title: "Нежное печенье с шоколадной крошкой",
      time: 60,
      id: 3,
      steps: _generate_cookiesSteps(3),
      ingredients: _generate_cookiesIngredients(3),
      imgLocalSource: assets_delicateChocolateChipCookies));
  foods.add(Food(
      title: "Бургер",
      time: 35,
      id: 4,
      steps: _generate_burgerSteps(4),
      ingredients: _generate_burgerIngredients(4),
      imgLocalSource: assets_burger));
  foods.add(Food(
      title: "Манты",
      time: 80,
      id: 5,
      steps: _generate_mantiSteps(5),
      ingredients: _generate_mantiIngredients(5),
      imgLocalSource: assets_manti));
  foods.add(Food(
      title: "Паста болоньезе классическая",
      time: 70,
      id: 6,
      steps: _generate_pastaBologneseSteps(6),
      ingredients: _generate_pastaBologneseIngredients(6),
      imgLocalSource: assets_pastaBolognese));
  foods.add(Food(
      title: "Тонкие блины на молоке",
      time: 30,
      id: 7,
      steps: _generate_pancakesSteps(7),
      ingredients: _generate_pancakesIngredients(7),
      imgLocalSource: assets_thinPancakesWithMilk));
  return foods;
}
