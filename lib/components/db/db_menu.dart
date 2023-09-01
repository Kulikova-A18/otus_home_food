class FoodStep {
  String description;
  int id;
  //int timeSec;
  int foodId;
  int numberStep;
  bool isSuccessful;

  FoodStep({
    required this.description,
    required this.id,
    required this.foodId,
    //required this.timeSec,
    required this.numberStep,
    required this.isSuccessful,
  });

  // getTimeMinute() {
  //   int minute = timeSec ~/ 60;
  //   int sec = timeSec % 60;
  //   String txtMinute = minute < 10 ? "0$minute" : minute.toString();
  //   String txtSec = sec < 10 ? "0$sec" : sec.toString();
  //   return "$txtMinute:$txtSec";
  // }
}

class FoodIngredient {
  final int id;
  final int foodId;
  final String description;
  final String measurement;

  FoodIngredient({
    required this.id,
    required this.foodId,
    required this.description,
    required this.measurement,
  });
}

class Food {
  String title;
  int time;
  int id;
  String imgLocalSource;
  List<FoodStep> steps;
  List<FoodIngredient> ingredients;

  bool isFavorite = false;

  Food({
    required this.title,
    required this.time,
    required this.id,
    required this.imgLocalSource,
    required this.steps,
    required this.ingredients,
  });

  String getTimeValue() {
    if (time >= 60) {
      int hours = Duration(minutes: time).inHours;
      int minutes = time - Duration(hours: hours).inMinutes;
      if (hours < 21) {
        String str = "$hours ${_formatHours(hours)}";
        if (minutes > 0) {
          str += " $minutes ${_formatMinutes(minutes)}";
        }
        return str;
      } else {
        return "Более 20 часов";
      }
    }
    return "$time ${_formatMinutes(time)}";
  }

  String getLocalPath() => "assets/images/$imgLocalSource";

  String _formatHours(int hours) {
    if (hours == 1) {
      return "час";
    } else if (hours > 1 && hours < 5) {
      return "часа";
    } else {
      return "часов";
    }
  }

  String _formatMinutes(int minutes) {
    int remainder = minutes % 10;
    if (remainder == 1) {
      return "минута";
    } else if (remainder > 1 && remainder < 5) {
      return "минуты";
    } else {
      return "минут";
    }
  }
}
