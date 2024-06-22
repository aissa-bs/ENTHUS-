import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/icon_title.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:fitness/services/programms/workoutprogram.dart';
import 'package:fitness/view/workout_tracker/exercises_stpe_details.dart';
import 'package:flutter/material.dart';
import '../../../common_widget/exercises_set_section.dart';

class SportProgramcreatedDetailView extends StatefulWidget {
  final WorkoutProgram dObj ;
  const SportProgramcreatedDetailView({super.key, required this.dObj});

  @override
  State<SportProgramcreatedDetailView> createState() => _SportProgramcreatedDetailViewState();
}

class _SportProgramcreatedDetailViewState extends State<SportProgramcreatedDetailView> {
  List<Map<String, dynamic>> youArr = [];
  List<Map<String, dynamic>> exercisesArr = [];

  List stepAr = [
    {
      "no": "01",
      "title": "Spread Your Arms",
      "detail":
          "To make the gestures feel more relaxed, stretch your arms as you start this movement. No bending of hands."
    },
    {
      "no": "02",
      "title": "Rest at The Toe",
      "detail":
          "The basis of this movement is jumping. Now, what needs to be considered is that you have to use the tips of your feet"
    },
    {
      "no": "03",
      "title": "Adjust Foot Movement",
      "detail":
          "Jumping Jack is not just an ordinary jump. But, you also have to pay close attention to leg movements."
    },
    {
      "no": "04",
      "title": "Clapping Both Hands",
      "detail":
          "This cannot be taken lightly. You see, without realizing it, the clapping of your hands helps you to keep your rhythm while doing the Jumping Jack"
    },
  ];



  List latestArr = [
    {
      "image": "assets/img/Workout1.png",
      "title": "Fullbody Workout",
      "time": "Today, 03:00pm"
    },
    {
      "image": "assets/img/Workout2.png",
      "title": "Upperbody Workout",
      "time": "June 05, 02:00pm"
    },
  ];

 

final Map<String, Map<String, List<Map<String, dynamic>>>> weekData = {
    'Mon': {
      'youArr': [
        {"image": "assets/img/barbell.png", "title": "Barbell"},
        {"image": "assets/img/skipping_rope.png", "title": "Skipping Rope"},
        {"image": "assets/img/bottle.png", "title": "Bottle 1 Liters"},
      ],
      'exercisesArr': [
        {
          "name": "Set 1",
          "set": [
            {"image": "assets/img/img_1.png", "title": "Warm Up", "value": "05:00"},
            {"image": "assets/img/img_2.png", "title": "Jumping Jack", "value": "12x"},
            {"image": "assets/img/img_1.png", "title": "Skipping", "value": "15x"},
            {"image": "assets/img/img_2.png", "title": "Squats", "value": "20x"},
            {"image": "assets/img/img_1.png", "title": "Arm Raises", "value": "00:53"},
            {"image": "assets/img/img_2.png", "title": "Rest and Drink", "value": "02:00"},
          ],
        },
        {
          "name": "Set 2",
          "set": [
            {"image": "assets/img/img_1.png", "title": "Warm Up", "value": "05:00"},
            {"image": "assets/img/img_2.png", "title": "Jumping Jack", "value": "12x"},
            {"image": "assets/img/img_1.png", "title": "Skipping", "value": "15x"},
            {"image": "assets/img/img_2.png", "title": "Squats", "value": "20x"},
            {"image": "assets/img/img_1.png", "title": "Arm Raises", "value": "00:53"},
            {"image": "assets/img/img_2.png", "title": "Rest and Drink", "value": "02:00"},
          ],
        },
      ],
    },
    'Tue': {
      'youArr': [
        {"image": "assets/img/mat.png", "title": "Mat"},
        {"image": "assets/img/abroller.jpg", "title": "Ab Roller"},
        {"image": "assets/img/rband.jfif", "title": "Resistence band"},
        {"image": "assets/img/bottle.png", "title": "Bottle 1 Liters"},
      ],
      'exercisesArr': [
        {
          "name": "Set 1",
          "set": [
            {"image": "assets/img/img_1.png", "title": "Warm Up", "value": "05:00"},
            {"image": "assets/img/plank.gif", "title": "Plank", "value": "12x"},
            {"image": "assets/img/crunch.gif", "title": "Crunch", "value": "15x"},
            {"image": "assets/img/sideplank.gif", "title": "Side Plank", "value": "20x"},
            {"image": "assets/img/rollout.gif", "title": " Barbell rollout", "value": "00:53"},
            {"image": "assets/img/rest.jpg", "title": "Rest and Drink", "value": "02:00"},
          ],
        },
        {
          "name": "Set 2",
          "set": [
            {"image": "assets/img/plank.gif", "title": "Plank ", "value": "05:00"},
            {"image": "assets/img/revcrunch.gif", "title": "Reverse crunch", "value": "12x"},
            {"image": "assets/img/climbers.gif", "title": "mountains climbers", "value": "15x"},
            {"image": "assets/img/legraise.gif", "title": "Leg raise", "value": "20x"},
            {"image": "assets/img/rtwist.gif", "title": "russian twist ", "value": "00:53"},
            {"image": "assets/img/rest.jpg", "title": "Rest and Drink", "value": "02:00"},
          ],
        },
      ],
    },
     'Wed': {
      'youArr': [
        {"image": "assets/img/barbell.png", "title": "Barbell"},
        {"image": "assets/img/skipping_rope.png", "title": "Skipping Rope"},
        {"image": "assets/img/bottle.png", "title": "Bottle 1 Liters"},
      ],
      'exercisesArr': [
        {
          "name": "Set 1",
          "set": [
            {"image": "assets/img/img_1.png", "title": "Warm Up", "value": "05:00"},
            {"image": "assets/img/img_2.png", "title": "Jumping Jack", "value": "12x"},
            {"image": "assets/img/img_1.png", "title": "Skipping", "value": "15x"},
            {"image": "assets/img/img_2.png", "title": "Squats", "value": "20x"},
            {"image": "assets/img/img_1.png", "title": "Arm Raises", "value": "00:53"},
            {"image": "assets/img/img_2.png", "title": "Rest and Drink", "value": "02:00"},
          ],
        },
        {
          "name": "Set 2",
          "set": [
            {"image": "assets/img/img_1.png", "title": "Warm Up", "value": "05:00"},
            {"image": "assets/img/img_2.png", "title": "Jumping Jack", "value": "12x"},
            {"image": "assets/img/img_1.png", "title": "Skipping", "value": "15x"},
            {"image": "assets/img/img_2.png", "title": "Squats", "value": "20x"},
            {"image": "assets/img/img_1.png", "title": "Arm Raises", "value": "00:53"},
            {"image": "assets/img/img_2.png", "title": "Rest and Drink", "value": "02:00"},
          ],
        },
      ],
    },
     'Thu': {
      'youArr': [
        {"image": "assets/img/barbell.png", "title": "Barbell"},
        {"image": "assets/img/skipping_rope.png", "title": "Skipping Rope"},
        {"image": "assets/img/bottle.png", "title": "Bottle 1 Liters"},
      ],
      'exercisesArr': [
        {
          "name": "Set 1",
          "set": [
            {"image": "assets/img/img_1.png", "title": "Warm Up", "value": "05:00"},
            {"image": "assets/img/img_2.png", "title": "Jumping Jack", "value": "12x"},
            {"image": "assets/img/img_1.png", "title": "Skipping", "value": "15x"},
            {"image": "assets/img/img_2.png", "title": "Squats", "value": "20x"},
            {"image": "assets/img/img_1.png", "title": "Arm Raises", "value": "00:53"},
            {"image": "assets/img/img_2.png", "title": "Rest and Drink", "value": "02:00"},
          ],
        },
        {
          "name": "Set 2",
          "set": [
            {"image": "assets/img/img_1.png", "title": "Warm Up", "value": "05:00"},
            {"image": "assets/img/img_2.png", "title": "Jumping Jack", "value": "12x"},
            {"image": "assets/img/img_1.png", "title": "Skipping", "value": "15x"},
            {"image": "assets/img/img_2.png", "title": "Squats", "value": "20x"},
            {"image": "assets/img/img_1.png", "title": "Arm Raises", "value": "00:53"},
            {"image": "assets/img/img_2.png", "title": "Rest and Drink", "value": "02:00"},
          ],
        },
      ],
    },
     'Fri': {
      'youArr': [
        {"image": "assets/img/barbell.png", "title": "Barbell"},
        {"image": "assets/img/skipping_rope.png", "title": "Skipping Rope"},
        {"image": "assets/img/bottle.png", "title": "Bottle 1 Liters"},
      ],
      'exercisesArr': [
        {
          "name": "Set 1",
          "set": [
            {"image": "assets/img/img_1.png", "title": "Warm Up", "value": "05:00"},
            {"image": "assets/img/img_2.png", "title": "Jumping Jack", "value": "12x"},
            {"image": "assets/img/img_1.png", "title": "Skipping", "value": "15x"},
            {"image": "assets/img/img_2.png", "title": "Squats", "value": "20x"},
            {"image": "assets/img/img_1.png", "title": "Arm Raises", "value": "00:53"},
            {"image": "assets/img/img_2.png", "title": "Rest and Drink", "value": "02:00"},
          ],
        },
        {
          "name": "Set 2",
          "set": [
            {"image": "assets/img/img_1.png", "title": "Warm Up", "value": "05:00"},
            {"image": "assets/img/img_2.png", "title": "Jumping Jack", "value": "12x"},
            {"image": "assets/img/img_1.png", "title": "Skipping", "value": "15x"},
            {"image": "assets/img/img_2.png", "title": "Squats", "value": "20x"},
            {"image": "assets/img/img_1.png", "title": "Arm Raises", "value": "00:53"},
            {"image": "assets/img/img_2.png", "title": "Rest and Drink", "value": "02:00"},
          ],
        },
      ],
    },
     'Sat': {
      'youArr': [
        {"image": "assets/img/barbell.png", "title": "Barbell"},
        {"image": "assets/img/skipping_rope.png", "title": "Skipping Rope"},
        {"image": "assets/img/bottle.png", "title": "Bottle 1 Liters"},
      ],
      'exercisesArr': [
        {
          "name": "Set 1",
          "set": [
            {"image": "assets/img/img_1.png", "title": "Warm Up", "value": "05:00"},
            {"image": "assets/img/img_2.png", "title": "Jumping Jack", "value": "12x"},
            {"image": "assets/img/img_1.png", "title": "Skipping", "value": "15x"},
            {"image": "assets/img/img_2.png", "title": "Squats", "value": "20x"},
            {"image": "assets/img/img_1.png", "title": "Arm Raises", "value": "00:53"},
            {"image": "assets/img/img_2.png", "title": "Rest and Drink", "value": "02:00"},
          ],
        },
        {
          "name": "Set 2",
          "set": [
            {"image": "assets/img/img_1.png", "title": "Warm Up", "value": "05:00"},
            {"image": "assets/img/img_2.png", "title": "Jumping Jack", "value": "12x"},
            {"image": "assets/img/img_1.png", "title": "Skipping", "value": "15x"},
            {"image": "assets/img/img_2.png", "title": "Squats", "value": "20x"},
            {"image": "assets/img/img_1.png", "title": "Arm Raises", "value": "00:53"},
            {"image": "assets/img/img_2.png", "title": "Rest and Drink", "value": "02:00"},
          ],
        },
      ],
    },
     'Sun': {
      'youArr': [
        {"image": "assets/img/barbell.png", "title": "Barbell"},
        {"image": "assets/img/skipping_rope.png", "title": "Skipping Rope"},
        {"image": "assets/img/bottle.png", "title": "Bottle 1 Liters"},
      ],
      'exercisesArr': [
        {
          "name": "Set 1",
          "set": [
            {"image": "assets/img/img_1.png", "title": "Warm Up", "value": "05:00"},
            {"image": "assets/img/img_2.png", "title": "Jumping Jack", "value": "12x"},
            {"image": "assets/img/img_1.png", "title": "Skipping", "value": "15x"},
            {"image": "assets/img/img_2.png", "title": "Squats", "value": "20x"},
            {"image": "assets/img/img_1.png", "title": "Arm Raises", "value": "00:53"},
            {"image": "assets/img/img_2.png", "title": "Rest and Drink", "value": "02:00"},
          ],
        },
        {
          "name": "Set 2",
          "set": [
            {"image": "assets/img/img_1.png", "title": "Warm Up", "value": "05:00"},
            {"image": "assets/img/img_2.png", "title": "Jumping Jack", "value": "12x"},
            {"image": "assets/img/img_1.png", "title": "Skipping", "value": "15x"},
            {"image": "assets/img/img_2.png", "title": "Squats", "value": "20x"},
            {"image": "assets/img/img_1.png", "title": "Arm Raises", "value": "00:53"},
            {"image": "assets/img/img_2.png", "title": "Rest and Drink", "value": "02:00"},
          ],
        },
      ],
    },
    // Add data for other days...
  };
 DateTime _selectedDate = DateTime.now();
  final List<String> _weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final List<DateTime> _weekDates = [];
  late ScrollController _scrollController;
  bool _isInitialScrollSet = false;
@override
   @override
  void initState() {
    super.initState();
    _generateWeekDates();
    _scrollController = ScrollController();
    _updateDataForSelectedDay(_selectedDate);
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
    });
    _updateDataForSelectedDay(date);
    final int selectedIndex = _weekDates.indexOf(date);
    final double scrollPosition = (selectedIndex * 70.0) - (MediaQuery.of(context).size.width / 2) + 30; // Center the selected day
    _scrollController.animateTo(scrollPosition,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _updateDataForSelectedDay(DateTime date) {
    final String weekDay = _weekDays[date.weekday - 1];
    setState(() {
      youArr = weekData[weekDay]?['youArr'] ?? [];
      exercisesArr = weekData[weekDay]?['exercisesArr'] ?? [];
    });
  }
  double _calculateInitialScrollOffset(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final int initialIndex = now.difference(startOfWeek).inDays;
    return (initialIndex * 70.0) - (MediaQuery.of(context).size.width / 2) + 30; // Center the initial selected day
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
    return Container(
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: TColor.primaryG)),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.transparent,
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
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leadingWidth: 0,
              leading: Container(),
              expandedHeight: media.width * 0.5,
              flexibleSpace: Align(
                alignment: Alignment.center,
                child: Image.asset(
                   widget.dObj.image ,
                  width: media.width * 0.75,
                  height: media.width * 0.8,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ];
        },
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: TColor.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 50,
                        height: 4,
                        decoration: BoxDecoration(
                            color: TColor.gray.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10,),
                                      child: Text(
                                        widget.dObj.name,
                                        style: TextStyle(
                                            color: TColor.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10,),
                                      child: Text(
                                        widget.dObj.by ,
                                        style: TextStyle(
                                            color: TColor.gray, fontSize: 12),
                                      ),
                                    ),
                                   
                                  ],
                                ),
                                 Padding(
                           
                           padding:const EdgeInsets.only(left: 130,),
                           child: SizedBox(
                            width: 130 ,
                            height: 35,
                             child: Center(
                               child: RoundButton(
                                title: "Edit Program",
                                type: RoundButtonType.bgGradient,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                onPressed: () {
                                  
                                   
                                }, ),
                             ),
                           ),
                         ),
                              ],
                              
                            ),
                          ),
                          
                        ],
                      ),
                      
                      
                      SizedBox(
                        height: media.width * 0.02,
                      ),
                      IconTitle(
                          icon: "assets/img/difficulity.png",
                          title: "Difficulity",
                          time: "Beginner",
                          color: TColor.secondaryColor2.withOpacity(0.3),
                          onPressed: () {}),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Items Needed",
                            style: TextStyle(
                                color: TColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "${youArr.length} Items",
                              style:
                                  TextStyle(color: TColor.gray, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.5,
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: youArr.length,
                            itemBuilder: (context, index) {
                              var yObj = youArr[index] as Map? ?? {};
                              return Container(
                                  margin: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: media.width * 0.35,
                                        width: media.width * 0.35,
                                        decoration: BoxDecoration(
                                            color: TColor.lightGray,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          yObj["image"].toString(),
                                          width: media.width * 0.2,
                                          height: media.width * 0.2,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          yObj["title"].toString(),
                                          style: TextStyle(
                                              color: TColor.black,
                                              fontSize: 12),
                                        ),
                                      )
                                    ],
                                  ));
                            }),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Exercises",
                            style: TextStyle(
                                color: TColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "${youArr.length} Sets",
                              style:
                                  TextStyle(color: TColor.gray, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: exercisesArr.length,
                          itemBuilder: (context, index) {
                            var sObj = exercisesArr[index] as Map? ?? {};
                            return ExercisesSetSection(
                              sObj: sObj,
                              onPressed: (obj) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ExercisesStepDetails(eObj:sObj , ),
                                  ),
                                );
                              },
                            );
                          }),
                      SizedBox(
                        height: media.width * 0.1,
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
