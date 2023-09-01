import 'package:flutter/material.dart';

import 'package:otus_home_food/screens/home_screen.dart';

import 'package:otus_home_food/components/colors.dart';
import 'package:otus_home_food/components/textStyle.dart';
import 'package:otus_home_food/components/list_assets.dart';
import 'package:otus_home_food/components/db/db_menu.dart';

// ----------------
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
                scale: 1.6,
                child: Checkbox(
                  //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                  onChanged: (bool? value) {
                    setState(() {
                      widget.step.isSuccessful = !widget.step.isSuccessful;
                    });
                  },
                ),
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
      height: 550.0,
      child: _createWidget(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: _getBackgroundColor(),
      ),
    );
  }

  _getBackgroundColor() =>
      widget.isProcessingCooking ? amberColor : Color(0XFFECECEC);

  _getTextColorForDescription() =>
      widget.isProcessingCooking ? amberColor : amberColor;

  _getTextColorForNumberStep() =>
      widget.isProcessingCooking ? amberColor : Color(0XFFC2C2C2);

  _getTextColorForTime() =>
      widget.isProcessingCooking ? amberColor : Color(0XFF797676);

  _getColorForCheckBoxBorder() =>
      widget.isProcessingCooking ? amberColor : Color(0XFF797676);

  Color _getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return amberColor;
    }
    return amberColor;
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
      isProcessingCooking ? amberColor : Colors.white;

  ShapeBorder _getShapeForButton() => isProcessingCooking
      ? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(
            color: amberColor,
            width: 2.0,
          ))
      : RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        );

  Color _getColorForButton() => isProcessingCooking ? Colors.white : amberColor;
}

// ----------------
class AboutRecipeScreen extends StatefulWidget {
  //const AboutRecipeScreen({Key? key}) : super(key: key);
  final Food food;
  AboutRecipeScreen({
    required this.food,
  });
  @override
  _AboutRecipeScreenState createState() => _AboutRecipeScreenState();
}

class _AboutRecipeScreenState extends State<AboutRecipeScreen> {
  bool _isProcessingCooking = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  Text createNewTitleText() {
    return Text(widget.food.title, style: unselectTextName);
  }

  Text createNewTimeText() {
    return Text(widget.food.getTimeValue(),
        style: TextStyle(fontSize: 25, color: amberColor));
  }

  Padding createNewImage() {
    return Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            widget.food.getLocalPath(),
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
              itemCount: widget.food.ingredients.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: index == 0 ? 0.0 : 8.0,
                  ),
                  child: IngredientWidget(
                    foodIngredient: widget.food.ingredients[index],
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
              itemCount: widget.food.steps.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: StepWidget(
                    step: widget.food.steps[index],
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

  List<String> litems_createNewComment = [];
  TextEditingController litems_createNewCommentController =
      TextEditingController();
  final now = DateTime.now();
  Widget _listViewComment(BuildContext context) {
    final children = [
      Container(
        child: Column(
          children: [createCommentColumn(context)],
        ),
      )
    ];
    return SingleChildScrollView(
      child: Column(
        children: children,
      ),
    );
  }

  Container createCommentColumn(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 5,
        padding: const EdgeInsets.all(5),
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   border: Border.all(
        //     color: Colors.black,
        //     width: 2,
        //   ),
        //   borderRadius: BorderRadius.circular(12),
        // ),
        // color: Colors.green.withOpacity(0.9),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: litems_createNewComment.length,
                    itemExtent: MediaQuery.of(context).size.height / 10,
                    itemBuilder: (BuildContext ctxt, int Index) {
                      return Column(
                        children: [
                          Text(
                            textAlign: TextAlign.left,
                            now.toString(),
                            style: dateCommentText,
                          ),
                          Text(
                            "[user]: ${litems_createNewComment[Index]}",
                            style: commentText,
                          )
                        ],
                      );
                    })),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 10,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                // color: Colors.green.withOpacity(0.9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width / 1.35,
                      height: MediaQuery.of(context).size.height / 12,
                      child: Column(
                        children: [
                          Container(
                            child: TextFormField(
                              style: commentText,
                              autofocus: true,
                              controller: litems_createNewCommentController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                            width: MediaQuery.of(context).size.width / 1.35,
                            height: MediaQuery.of(context).size.height / 25,
                          ),
                        ],
                      ),
                    ),
                    Container(width: 10),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          litems_createNewComment
                              .add(litems_createNewCommentController.text);
                          litems_createNewCommentController.clear();
                        });
                      },
                      icon: const Icon(Icons.send),
                      iconSize: 25,
                    ),
                  ],
                )),
          ],
        ));
  }

  var likeAppbarAction = false;
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
                toolbarHeight: MediaQuery.of(context).size.height / 10,
                leading: IconButton(
                  iconSize: 45,
                  icon: const Icon(Icons.keyboard_backspace),
                  onPressed: () {
                    runApp(HomeScreen());
                  },
                ),
                actions: [
                  IconButton(
                    iconSize: 45,
                    icon: (!likeAppbarAction)
                        ? Icon(Icons.favorite_border)
                        : Icon(Icons.favorite),
                    onPressed: () {
                      setState(() {
                        likeAppbarAction = !likeAppbarAction;
                      });
                    },
                  ),
                ],
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
                                  createNewStepsColumn(),
                                  Divider(
                                    height: 20,
                                    thickness: 2,
                                  ),
                                  _listViewComment(context),
                                  SizedBox(
                                    height: 20,
                                  )
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
