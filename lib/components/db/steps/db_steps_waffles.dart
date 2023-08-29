part of 'package:otus_home_food/testexample.dart';

List<FoodStep> _generate_wafflesSteps(int foodId) {
  List<FoodStep> steps = [];
  steps.add(FoodStep(
    description: 'Мягкое сливочное масло растереть с сахаром.',
    id: 1,
    foodId: foodId,
    // timeSec: 330,
    numberStep: 1,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description: 'Затем добавить молоко и яйца.',
    id: foodId,
    foodId: 2,
    // timeSec: 420,
    numberStep: 2,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description: 'Все ингредиенты взбить венчиком.',
    id: 3,
    foodId: foodId,
    // timeSec: 360,
    numberStep: 3,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description: 'Дальше добавить муку и разрыхлитель.',
    id: 4,
    foodId: foodId,
    // timeSec: 90,
    numberStep: 4,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description: 'Тесто тщательно перемешать до однородного состояния.',
    id: 5,
    foodId: foodId,
    // timeSec: 360,
    numberStep: 5,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description:
        'В вафельницу залить тесто. На одну формочку я выливаю 2 столовые ложки теста. Разровнять по форме и закрыть.',
    id: 6,
    foodId: foodId,
    // timeSec: 900,
    numberStep: 6,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description:
        'Выпекать необходимое для вашей вафельницы время, примерно 3-5 минут.',
    id: 7,
    foodId: foodId,
    // timeSec: 240,
    numberStep: 7,
    isSuccessful: false,
  ));

  return steps;
}
