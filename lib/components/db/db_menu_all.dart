part of 'package:otus_home_food/testexample.dart';

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
      title: "Домашние венские вафли",
      time: 10,
      id: 2,
      steps: List.empty(),
      ingredients: List.empty(),
      imgLocalSource: assets_vienneseWaffles));
  foods.add(Food(
      title: "Нежное печенье с шоколадной крошкой",
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
      title: "Паста болоньезе классическая",
      time: 70,
      id: 6,
      ingredients: List.empty(),
      steps: List.empty(),
      imgLocalSource: "photo_six_recipe.png"));
  foods.add(Food(
      title: "Тонкие блины на молоке",
      time: 30,
      id: 7,
      ingredients: List.empty(),
      steps: List.empty(),
      imgLocalSource: assets_thinPancakesWithMilk));
  return foods;
}
