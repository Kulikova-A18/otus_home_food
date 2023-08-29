part of 'package:otus_home_food/testexample.dart';

List<FoodStep> _generate_donutsSteps(int foodId) {
  List<FoodStep> steps = [];
  steps.add(FoodStep(
    description:
        'Соединить сахар, дрожжи, добавить теплую воду, молоко, соль,перемешать до растворения ингредиентов.',
    id: 1,
    foodId: foodId,
    // timeSec: 330,
    numberStep: 1,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description: 'Добавить яйцо, перемешать.',
    id: foodId,
    foodId: 2,
    // timeSec: 420,
    numberStep: 2,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description: 'Добавить просеянную муку, замесить хорошо тесто.',
    id: 3,
    foodId: foodId,
    // timeSec: 360,
    numberStep: 3,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description:
        'Добавить масло комнатной температуры, снова замесить тесто, чтобы оно хорошо отлипало от рук.',
    id: 4,
    foodId: foodId,
    // timeSec: 90,
    numberStep: 4,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description:
        'Присыпать тесто сахарной пудрой и снова хорошо замесить. Накрыть тесто и отправить в теплое место на минут 30. Достать,  еще раз руками замесить и еще на 30 минут отправить в теплое место.',
    id: 5,
    foodId: foodId,
    // timeSec: 360,
    numberStep: 5,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description:
        'Выложить тесто на присыпанную мукой рабочую поверхность и скалкой раскатать. Выдавить круги. В середине пончика выдавить маленький кружочек, накрыть полотенцем',
    id: 6,
    foodId: foodId,
    // timeSec: 900,
    numberStep: 6,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description:
        'Разогреть растительное масло и поджарить пончики до золотистого цвета с обоих сторон. Выложить пончики на бумажную салфетку и дать остыть.',
    id: 7,
    foodId: foodId,
    // timeSec: 240,
    numberStep: 7,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description:
        'Пончики посыпать сахарной пудрой или же каждый пончик обмакнуть в готовую кондитерскую глазурь.',
    id: 8,
    foodId: foodId,
    // timeSec: 240,
    numberStep: 8,
    isSuccessful: false,
  ));
  return steps;
}
