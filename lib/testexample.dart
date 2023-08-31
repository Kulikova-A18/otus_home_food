import 'package:flutter/material.dart';
import 'package:otus_home_food/components/colors.dart';
import 'package:otus_home_food/components/textStyle.dart';
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

class IngredientWidget extends StatelessWidget {
  final FoodIngredient foodIngredient;

  IngredientWidget({
    required this.foodIngredient,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('\u2022 ${foodIngredient.description}',
            style: db_ingredientsTextName),
        Align(
          child:
              Text(foodIngredient.measurement, style: db_ingredientsTextName),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }
}

class StepWidget extends StatefulWidget {
  final FoodStep step;
  final bool isProcessingCooking;

  StepWidget({
    required this.step,
    required this.isProcessingCooking,
  });

  @override
  _StepWidgetState createState() => _StepWidgetState();
}

class _StepWidgetState extends State<StepWidget> {
  List<CrossAxisAlignment> getValues() {
    return [CrossAxisAlignment.start, CrossAxisAlignment.center];
  }

  _createWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: Text(widget.step.numberStep.toString(),
              style: db_stepsNumTextName),
        ),
        Expanded(
          flex: 3,
          child: Container(
              child:
                  Text('${widget.step.description}', style: db_stepsTextName)),
        ),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Transform.scale(
                child: Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: widget.step.isSuccessful,
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(_getColor),
                  side: BorderSide(
                    color: _getColorForCheckBoxBorder(),
                    width: 2.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.125),
                  ),
                  onChanged: widget.isProcessingCooking
                      ? (isChecked) {
                          setState(() {
                            widget.step.isSuccessful =
                                !widget.step.isSuccessful;
                          });
                        }
                      : null,
                ),
                scale: 1.6,
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: _createWidget(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: _getBackgroundColor(),
      ),
    );
  }

  _getBackgroundColor() =>
      widget.isProcessingCooking ? Color(0x262ECC71) : Color(0XFFECECEC);

  _getTextColorForDescription() =>
      widget.isProcessingCooking ? Color(0xFF2D490C) : Color(0XFF797676);

  _getTextColorForNumberStep() =>
      widget.isProcessingCooking ? Color(0xFF2ECC71) : Color(0XFFC2C2C2);

  _getTextColorForTime() =>
      widget.isProcessingCooking ? Color(0xFF165932) : Color(0XFF797676);

  _getColorForCheckBoxBorder() =>
      widget.isProcessingCooking ? Color(0xFF165932) : Color(0XFF797676);

  Color _getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Color(0xFF165932);
    }
    return Color(0xFF165932);
  }
}

class StartFinishCookingButton extends StatelessWidget {
  final bool isProcessingCooking;
  final Function onPressedButton;

  StartFinishCookingButton({
    required this.isProcessingCooking,
    required this.onPressedButton,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 232.0,
      height: 48.0,
      child: Text(
        _getTextForButton(),
        style: TextStyle(
          color: _getTextColorForButton(),
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      ),
      color: _getColorForButton(),
      shape: _getShapeForButton(),
      onPressed: () {
        onPressedButton();
      },
    );
  }

  String _getTextForButton() =>
      isProcessingCooking ? "Закончить готовить" : "Начать готовить";

  Color _getTextColorForButton() =>
      isProcessingCooking ? Color(0XFF165932) : Colors.white;

  ShapeBorder _getShapeForButton() => isProcessingCooking
      ? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(
            color: Color(0XFF165932),
            width: 2.0,
          ))
      : RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        );

  Color _getColorForButton() =>
      isProcessingCooking ? Colors.white : Color(0XFF165932);
}

class Testexample extends StatefulWidget {
  const Testexample({Key? key}) : super(key: key);

  @override
  _TestexampleState createState() => _TestexampleState();
}

var food;

class _TestexampleState extends State<Testexample> {
  bool _isProcessingCooking = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    List<Food> foods = _generateFoods();
    food = foods[1];
    super.initState();
  }

  Text createNewTitleText() {
    return Text(food.title, style: unselectTextName);
  }

  Text createNewTimeText() {
    return Text(food.getTimeValue(),
        style: TextStyle(fontSize: 25, color: amberColor));
  }

  Padding createNewImage() {
    return Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            food.getLocalPath(),
            height: (MediaQuery.of(context).size.width - 32) / 1.79,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width - 32,
          ),
        ));
  }

  Column createNewIngredientColumn() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 22.54,
          ),
          child: Text('Ингредиенты', style: unselectTextName),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 18.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF797676),
              width: 3.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 15.0,
              ),
              itemCount: food.ingredients.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: index == 0 ? 0.0 : 8.0,
                  ),
                  child: IngredientWidget(
                    foodIngredient: food.ingredients[index],
                  ),
                );
              }),
        ),
      ],
    );
  }

  Column createNewStepsColumn() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 19.0),
          child: Text('Шаги приготовления', style: unselectTextName),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 19.0),
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: food.steps.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: StepWidget(
                    step: food.steps[index],
                    isProcessingCooking: _isProcessingCooking,
                  ),
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 27.0,
            bottom: 81.0,
          ),
          child: Center(
            child: StartFinishCookingButton(
              onPressedButton: () {
                setState(() {
                  _scrollController.jumpTo(0);
                  _isProcessingCooking = !_isProcessingCooking;
                });
              },
              isProcessingCooking: _isProcessingCooking,
            ),
          ),
        )
      ],
    );
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
                  "Рецепт",
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
                      child: Column(children: [
                        Expanded(
                            child: SingleChildScrollView(
                                child: Container(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  // --------
                                  createNewTitleText(),
                                  createNewTimeText(),
                                  createNewImage(),
                                  createNewIngredientColumn(),
                                  createNewStepsColumn()
                                  // --------
                                ],
                              ),
                            ],
                          ),
                        )))
                      ])))),
        );
      }),
    );

    //throw UnimplementedError();
  }
}
