part of 'package:otus_home_food/screens/home_screen.dart';

List<FoodStep> _generate_burgerSteps(int foodId) {
  List<FoodStep> steps = [];
  steps.add(FoodStep(
    description:
        'Добавим специи в фарш. Я не сторонник добавлять в бургеры лук, яйца или хлеб и что либо еще. Только мясо и черный молотый перец, только хардкор. Смочите руки водой и немного перемешайте фарш.',
    id: 1,
    foodId: foodId,
    // timeSec: 330,
    numberStep: 1,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description: 'Сформировать котлетки.',
    id: foodId,
    foodId: 2,
    // timeSec: 420,
    numberStep: 2,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description:
        'Помидоры моем и нарезаем кольцами. Открываем огурцы и тоже их нарезаем. Так как огурчики маленькие, я нарезал их не поперек, а под углом, чтобы кусочки были побольше. Нарезаем лук кольцами. Мы нарезали 2 вида лука, на любой вкус. Моем салат и немного его просушиваем.',
    id: 3,
    foodId: foodId,
    // timeSec: 360,
    numberStep: 3,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description:
        'Соус. Все на вкус, но это должен быть именно кетчуп с горчицей, а не горчица с кетчупом.',
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
        'На сцене появляется тяжелая артиллерия – чугунная сковорода-гриль. Разогреваем её и чуть смазываем/сбрызгиваем маслом. Кто-то предпочитает не использовать масло при жарке бургеров, но мне такой вариант не понравился. Кладем котлету (вот сейчас ее предварительно можно посолить немного) и жарим на среднем  огне 5-7 минут с каждой стороны.',
    id: 6,
    foodId: foodId,
    // timeSec: 900,
    numberStep: 6,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description:
        'собираем бургер: Лук-Соус-На котлеты в конце кладем по 2 кусочка чеддера-Огурчики-Помидор-Верхняя обжаренная булочка.',
    id: 7,
    foodId: foodId,
    // timeSec: 240,
    numberStep: 7,
    isSuccessful: false,
  ));

  return steps;
}
