import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/meal_food_schedule_row.dart';
import 'package:fitness/common_widget/nutritions_row.dart';
import 'package:flutter/material.dart';

class DietProgramView extends StatefulWidget {
  const DietProgramView({super.key});

  @override
  State<DietProgramView> createState() => _DietProgramViewState();
}

class _DietProgramViewState extends State<DietProgramView> {

  Map<String, List> mealData = {
    'Mon': [
      {
        "breakfast": [
          {"name": "Honey Pancake", "time": "07:00am", "image": "assets/img/honey_pan.png"},
          {"name": "Coffee", "time": "07:30am", "image": "assets/img/coffee.png"},
        ],
        "lunch": [
          {"name": "Chicken Steak", "time": "01:00pm", "image": "assets/img/chicken.png"},
          {"name": "Milk", "time": "01:20pm", "image": "assets/img/glass-of-milk 1.png"},
        ],
        "snacks": [
          {"name": "Orange", "time": "04:30pm", "image": "assets/img/orange.png"},
          {"name": "Apple Pie", "time": "04:40pm", "image": "assets/img/apple_pie.png"},
        ],
        "dinner": [
          {"name": "Salad", "time": "07:10pm", "image": "assets/img/salad.png"},
          {"name": "Oatmeal", "time": "08:10pm", "image": "assets/img/oatmeal.png"},
        ],
      }
    ],
    'Tue': [
      {
        "breakfast": [
          {"name": "Toast", "time": "07:00am", "image": "assets/img/toast.png"},
          {"name": "Tea", "time": "07:30am", "image": "assets/img/tea.png"},
        ],
        "lunch": [
          {"name": "Fish", "time": "01:00pm", "image": "assets/img/fish.png"},
          {"name": "Juice", "time": "01:20pm", "image": "assets/img/orange-juice.png"},
        ],
        "snacks": [
          {"name": "Banana", "time": "04:30pm", "image": "assets/img/banana.png"},
          {"name": "Cookie", "time": "04:40pm", "image": "assets/img/cookies.png"},
        ],
        "dinner": [
          {"name": "Soup", "time": "07:10pm", "image": "assets/img/soup.png"},
          {"name": "Salmon", "time": "08:10pm", "image": "assets/img/salmon.png"},
        ],
      }
    ],
    'Wed': [
      {
        "breakfast": [
          {"name": "Toast", "time": "07:00am", "image": "assets/img/toast.png"},
          {"name": "coffee", "time": "07:30am", "image": "assets/img/coffee.png"},
        ],
        "lunch": [
          {"name": "beef stake", "time": "01:00pm", "image": "assets/img/beef.png"},
          {"name": "orange", "time": "01:20pm", "image": "assets/img/orange.png"},
        ],
        "snacks": [
          {"name": "snack bar", "time": "04:30pm", "image": "assets/img/snack.png"},
          {"name": "Yogurt", "time": "04:40pm", "image": "assets/img/yogurt.png"},
        ],
        "dinner": [
          {"name": "salad", "time": "07:10pm", "image": "assets/img/salad.png"},
          {"name": "chicken", "time": "08:10pm", "image": "assets/img/chicken.png"},
        ],
      }
    ],
    'Thu': [
      {
        "breakfast": [
          {"name": "Toast", "time": "07:00am", "image": "assets/img/toast.png"},
          {"name": "Milk", "time": "07:30am", "image": "assets/img/milk.png"},
        ],
        "lunch": [
          {"name": "Turkey stake", "time": "01:00pm", "image": "assets/img/turkey.png"},
          {"name": "grape", "time": "01:20pm", "image": "assets/img/grape.png"},
        ],
        "snacks": [
          {"name": "Banana", "time": "04:30pm", "image": "assets/img/banana.png"},
          {"name": "Cheese", "time": "04:40pm", "image": "assets/img/cheese.png"},
        ],
        "dinner": [
          {"name": "Soup", "time": "07:10pm", "image": "assets/img/soup.png"},
          {"name": "salad", "time": "08:10pm", "image": "assets/img/salad.png"},
        ],
      }
    ],
    'Fri': [
      {
        "breakfast": [
          {"name": "Honey Pancake", "time": "07:00am", "image": "assets/img/honey_pan.png"},
          {"name": "Coffee", "time": "07:30am", "image": "assets/img/coffee.png"},
        ],
        "lunch": [
          {"name": "Chicken Steak", "time": "01:00pm", "image": "assets/img/chicken.png"},
          {"name": "Milk", "time": "01:20pm", "image": "assets/img/glass-of-milk 1.png"},
        ],
        "snacks": [
          {"name": "Orange", "time": "04:30pm", "image": "assets/img/orange.png"},
          {"name": "Apple Pie", "time": "04:40pm", "image": "assets/img/apple_pie.png"},
        ],
        "dinner": [
          {"name": "Salad", "time": "07:10pm", "image": "assets/img/salad.png"},
          {"name": "Oatmeal", "time": "08:10pm", "image": "assets/img/oatmeal.png"},
        ],
      }
    ],
    'Sat': [
      {
        "breakfast": [
          {"name": "Toast", "time": "07:00am", "image": "assets/img/toast.png"},
          {"name": "Tea", "time": "07:30am", "image": "assets/img/tea.png"},
        ],
        "lunch": [
          {"name": "Fish", "time": "01:00pm", "image": "assets/img/fish.png"},
          {"name": "Juice", "time": "01:20pm", "image": "assets/img/orange-juice.png"},
        ],
        "snacks": [
          {"name": "Banana", "time": "04:30pm", "image": "assets/img/banana.png"},
          {"name": "Cookie", "time": "04:40pm", "image": "assets/img/cookies.png"},
        ],
        "dinner": [
          {"name": "Soup", "time": "07:10pm", "image": "assets/img/soup.png"},
          {"name": "Salmon", "time": "08:10pm", "image": "assets/img/salmon.png"},
        ],
      }
    ],
    'Sun': [
      {
        "breakfast": [
          {"name": "Milk", "time": "07:00am", "image": "assets/img/milk.png"},
          {"name": "Egg", "time": "07:30am", "image": "assets/img/egg.png"},
        ],
        "lunch": [
          {"name": "Rice", "time": "01:00pm", "image": "assets/img/rice.png"},
          {"name": "Juice", "time": "01:20pm", "image": "assets/img/orange-juice.png"},
        ],
        "snacks": [
          {"name": "Banana", "time": "04:30pm", "image": "assets/img/banana.png"},
          {"name": "Soda", "time": "04:40pm", "image": "assets/img/soda.png"},
        ],
        "dinner": [
          {"name": "Rey bread", "time": "07:10pm", "image": "assets/img/ryebread.png"},
          {"name": "Soup Potato", "time": "08:10pm", "image": "assets/img/potatsoup.png"},
        ],
      }
    ],
    // Repeat for the rest of the days...
  };

  List breakfastArr = [];
  List lunchArr = [];
  List snacksArr = [];
  List dinnerArr = [];

  List nutritionArr = [
    {
      "title": "Calories",
      "image": "assets/img/burn.png",
      "unit_name": "kCal",
      "value": "350",
      "max_value": "500",
    },
    {
      "title": "Proteins",
      "image": "assets/img/proteins.png",
      "unit_name": "g",
      "value": "300",
      "max_value": "1000",
    },
    {
      "title": "Fats",
      "image": "assets/img/egg.png",
      "unit_name": "g",
      "value": "140",
      "max_value": "1000",
    },
    {
      "title": "Carbo",
      "image": "assets/img/carbo.png",
      "unit_name": "g",
      "value": "140",
      "max_value": "1000",
    },
  ];

  DateTime _selectedDate = DateTime.now();
  final List<String> _weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final List<DateTime> _weekDates = [];
  late ScrollController _scrollController;
  bool _isInitialScrollSet = false;

  @override
  void initState() {
    super.initState();
    _generateWeekDates();
    _scrollController = ScrollController();
    _updateMeals(_weekDays[DateTime.now().weekday - 1]);
  }

  void _generateWeekDates() {
    final DateTime now = DateTime.now();
    final DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    for (int i = 0; i < 7; i++) {
      _weekDates.add(startOfWeek.add(Duration(days: i)));
    }
  }

  void _onDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
      _updateMeals(_weekDays[date.weekday - 1]);
    });
    final int selectedIndex = _weekDates.indexOf(date);
    final double scrollPosition = (selectedIndex * 70.0) - (MediaQuery.of(context).size.width / 2) + 30; // Center the selected day
    _scrollController.animateTo(scrollPosition,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _updateMeals(String day) {
    setState(() {
      breakfastArr = mealData[day]?[0]["breakfast"] ?? [];
      lunchArr = mealData[day]?[0]["lunch"] ?? [];
      snacksArr = mealData[day]?[0]["snacks"] ?? [];
      dinnerArr = mealData[day]?[0]["dinner"] ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialScrollSet) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final double initialScrollOffset = _calculateInitialScrollOffset(context);
        _scrollController.jumpTo(initialScrollOffset);
        setState(() {
          _isInitialScrollSet = true;
        });
      });
    }
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: TColor.lightGray,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "assets/img/black_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Diet Program",
          style: TextStyle(
              color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                "assets/img/more_btn.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
      backgroundColor: TColor.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            width: 500,
            child: Column(
              children: [
                const SizedBox(height: 15),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _weekDates.map((day) {
                          final bool isSelected = _selectedDate.day == day.day &&
                              _selectedDate.month == day.month &&
                              _selectedDate.year == day.year;

                          return GestureDetector(
                            onTap: () => _onDateSelected(day),
                            child: Container(
                              width: 60,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: isSelected ? TColor.primaryG : TColor.primaryGrey,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    _weekDays[day.weekday - 1],
                                    style: TextStyle(fontSize: 12, color: isSelected ? Colors.white : Colors.black),
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: media.width * 0.05,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "BreakFast",
                        style: TextStyle(
                            color: TColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "${breakfastArr.length} Items | 230 calories",
                          style: TextStyle(color: TColor.gray, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: breakfastArr.length,
                    itemBuilder: (context, index) {
                      var mObj = breakfastArr[index] as Map? ?? {};
                      return MealFoodScheduleRow(
                        mObj: mObj,
                        index: index,
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Lunch",
                        style: TextStyle(
                            color: TColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "${lunchArr.length} Items | 500 calories",
                          style: TextStyle(color: TColor.gray, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: lunchArr.length,
                    itemBuilder: (context, index) {
                      var mObj = lunchArr[index] as Map? ?? {};
                      return MealFoodScheduleRow(
                        mObj: mObj,
                        index: index,
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Snacks",
                        style: TextStyle(
                            color: TColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "${snacksArr.length} Items | 140 calories",
                          style: TextStyle(color: TColor.gray, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snacksArr.length,
                    itemBuilder: (context, index) {
                      var mObj = snacksArr[index] as Map? ?? {};
                      return MealFoodScheduleRow(
                        mObj: mObj,
                        index: index,
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dinner",
                        style: TextStyle(
                            color: TColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "${dinnerArr.length} Items | 120 calories",
                          style: TextStyle(color: TColor.gray, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dinnerArr.length,
                    itemBuilder: (context, index) {
                      var mObj = dinnerArr[index] as Map? ?? {};
                      return MealFoodScheduleRow(
                        mObj: mObj,
                        index: index,
                      );
                    }),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today Meal Nutritions",
                        style: TextStyle(
                            color: TColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: nutritionArr.length,
                    itemBuilder: (context, index) {
                      var nObj = nutritionArr[index] as Map? ?? {};

                      return NutritionRow(
                        nObj: nObj,
                      );
                    }),
                SizedBox(
                  height: media.width * 0.05,
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  double _calculateInitialScrollOffset(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final int initialIndex = now.difference(startOfWeek).inDays;
    return (initialIndex * 70.0) - (MediaQuery.of(context).size.width / 2) + 30; // Center the initial selected day
  }
}

