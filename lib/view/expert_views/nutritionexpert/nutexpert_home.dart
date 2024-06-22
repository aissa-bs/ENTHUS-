import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/common_widget/createdietrow.dart';
import 'package:fitness/common_widget/dietrow.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:fitness/core/constants/vice_ui_consts.dart';
import 'package:fitness/core/shared/domain/entities/magazine3.dart';
import 'package:fitness/core/shared/presentation/widgets/numagazine_cover_image.dart';
import 'package:fitness/features/home/presentation/widgets/infinite_dragable_slider.dart';
import 'package:fitness/view/chats/chatsview.dart';
import 'package:fitness/view/expert_views/clientsof_view.dart';
import 'package:fitness/view/expert_views/nutritionexpert/nuexpert_notification.dart';
import 'package:fitness/view/home/activity_tracker_view.dart';
import 'package:fitness/view/home/finished_workout_view.dart';
import 'package:fitness/view/home/navbar.dart';
import 'package:fitness/view/meal_planner/create_diet.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../common/colo_extension.dart';

class NutExpertHome extends StatefulWidget {
  const NutExpertHome({super.key});

  @override
  State<NutExpertHome> createState() => _NutExpertHomeState();
}

class _NutExpertHomeState extends State<NutExpertHome> {
   List whatArr = [
    {
      "image": "assets/img/diet.png",
      "title": "Create Diets and programs",
      "exercises": "-",
      "time": "-"
    }, ] ;
   List whatdiet = [
    {
      "image": "assets/img/progress_each_photo.png",
      "title": "Complete with  your diet",
      "exercises": "-",
      "time": "-"
    }, ] ;
   String _firstName = ''; 
  String _lastName = '';
   int yourInitialIndex = 0;
   @override
  void initState() {
    super.initState();
    // Call a method to fetch user data when the widget is initialized
    fetchUserData();
    
  }
  
  Future<void> fetchUserData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;          
                           String userId = user!.uid;

                         QuerySnapshot snapshot = await FirebaseFirestore.instance
                          .collection('expert')
                          .where('expert_id', isEqualTo: userId)
                           .get();
                           DocumentSnapshot userDoc = snapshot.docs.first;
                           String id = userDoc.id;
                            
      // Query Firestore to get the user document
      DocumentSnapshot<Map<String, dynamic>> snapshots =
          await FirebaseFirestore.instance.collection('expert').doc(id).get(); // Replace 'user_id_here' with the actual user ID

      // Extract first name and last name from the document data
      String firstName = snapshots.get('firstname');
      String lastName = snapshots.get('lastname');
      // Update state with the fetched data
      setState(() {
        _firstName = firstName;
        _lastName = lastName;
      });
    } catch (error) {
      // Handle errors here (e.g., show error message)
      print('Error fetching exp user data: $error');
    }
  }
  List lastWorkoutArr = [
    {
      "name": "Aissa Bensadia (Breakfast)",
      "image": "assets/img/toast.png",
      "kcal": "500",
      "time": "20 Minutes",
      "progress": 0.3
    },
    {
      "name": "Khelifa Krike (Preworkout)",
      "image": "assets/img/energy-drink.png",
      "kcal": "200",
      "time": "30 Minutes",
      "progress": 0.4
    },
    {
      "name": "Bouhadjeyr Wahab (Dinner)",
      "image": "assets/img/dinner.png",
      "kcal": "300",
      "time": "10 Hours",
      "progress": 0.7
    },
  ];
  List<int> showingTooltipOnSpots = [21];

  List<FlSpot> get allSpots => const [
        FlSpot(0, 20),
        FlSpot(1, 25),
        FlSpot(2, 40),
        FlSpot(3, 50),
        FlSpot(4, 35),
        FlSpot(5, 40),
        FlSpot(6, 30),
        FlSpot(7, 20),
        FlSpot(8, 25),
        FlSpot(9, 40),
        FlSpot(10, 50),
        FlSpot(11, 35),
        FlSpot(12, 50),
        FlSpot(13, 60),
        FlSpot(14, 40),
        FlSpot(15, 50),
        FlSpot(16, 20),
        FlSpot(17, 25),
        FlSpot(18, 40),
        FlSpot(19, 50),
        FlSpot(20, 35),
        FlSpot(21, 80),
        FlSpot(22, 30),
        FlSpot(23, 20),
        FlSpot(24, 25),
        FlSpot(25, 40),
        FlSpot(26, 50),
        FlSpot(27, 35),
        FlSpot(28, 50),
        FlSpot(29, 60),
        FlSpot(30, 40)
      ];

  List waterArr = [
    {"title": "6am - 8am", "subtitle": "600ml"},
    {"title": "9am - 11am", "subtitle": "500ml"},
    {"title": "11am - 2pm", "subtitle": "1000ml"},
    {"title": "2pm - 4pm", "subtitle": "700ml"},
    {"title": "4pm - now", "subtitle": "900ml"},
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: allSpots,
        isCurved: false,
        barWidth: 3,
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(colors: [
            TColor.primaryColor2.withOpacity(0.4),
            TColor.primaryColor1.withOpacity(0.1),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        dotData: FlDotData(show: false),
        gradient: LinearGradient(
          colors: TColor.primaryG,
        ),
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];

    return DecoratedBox(
      decoration: ViceUIConsts.gradientDecoration,
      child: Scaffold(
        drawer: const NavBar() ,
      
        backgroundColor: const Color.fromARGB(255, 242, 239, 252),
         appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 222, 220, 248),
          elevation: 0,
          title:Row(
      children: [
        Text(
          "Welcome ,  ",
          style: TextStyle(color: TColor.gray, fontSize: 12,fontWeight: FontWeight.w700,),
        ),
        Text(
          "$_firstName $_lastName",
          style: TextStyle(
            color: TColor.black,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
        ),
          actions: [
            
            IconButton(
              icon: Image.asset(
                            "assets/img/notification_active.png",
                            width: 25,
                            height: 25,
                            fit: BoxFit.fitHeight,
                          ),
              onPressed: () {
                Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  const NuExpertNotificationView(),
                              ),
                            );
              },
            ),
            IconButton(
              padding: const EdgeInsets.symmetric( horizontal: 20, ), 
              
              icon: Image.asset(
                            "assets/img/messenger.png",
                            width: 25,
                            height: 25,
                            fit: BoxFit.fitHeight,
                          ),
              onPressed: () {
                Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Chatsview(),
                              ),
                            );
              },
            ),
          ],
        ),
        
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                        ],
                      ),
                      
                    ],
                  ),
                  
                Center(
                  child: SizedBox(
                  height: media.width * 0.8,
                  width:  media.width * 0.6,
                  
                  child: InfiniteDragableSlider(
                    iteamCount: Magazine3.fakeMagazinesValues.length,
                    itemBuilder: (context, index) => NuMagazineCoverImage(
                      magazine: Magazine3.fakeMagazinesValues[index],
                    ),
                    index: yourInitialIndex,
                    onSlideTap: (index) {
                      // Handle slide tap event here
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Clientsofview(),
                          ),
                        );
                      } else if (index == 1) {
                        
                      } else if (index == 2) {
                        
                      } else if (index == 3) {
                        
                      }
                    },
                  ),
                              ),
                ),
                SizedBox(
                    height: media.width * 0.1,
                  ),
                  
                  SizedBox(
                    height: media.width * 0.3,
                    
                   child : ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: whatArr.length,
                      itemBuilder: (context, index) {
                        var wObj = whatArr[index] as Map? ?? {};
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  DietCreationPage() ));
                          },
                          child:  Createdietrow(wObj: wObj) );
                      }),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  
                  Container(
                    height: media.width * 0.4,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: TColor.primaryb),
                        borderRadius: BorderRadius.circular(media.width * 0.075)),
                    child: Stack(alignment: Alignment.center, children: [
                      Image.asset(
                        "assets/img/bg_dots.png",
                        height: media.width * 0.4,
                        width: double.maxFinite,
                        fit: BoxFit.fitHeight,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Completed Day Target",
                                  style: TextStyle(
                                      color: TColor.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "By Your clients",
                                  style: TextStyle(
                                      color: TColor.white.withOpacity(0.7),
                                      fontSize: 12),
                                ),
                                SizedBox(
                                  height: media.width * 0.05,
                                ),
                                SizedBox(
                                    width: 120,
                                    height: 35,
                                    child: RoundButton(
                                        title: "View More",
                                        type: RoundButtonType.bgSGradient,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        onPressed: () {}))
                              ],
                            ),
                            AspectRatio(
                              aspectRatio: 1,
                              child: PieChart(
                                PieChartData(
                                  pieTouchData: PieTouchData(
                                    touchCallback:
                                        (FlTouchEvent event, pieTouchResponse) {},
                                  ),
                                  startDegreeOffset: 250,
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  sectionsSpace: 1,
                                  centerSpaceRadius: 0,
                                  sections: showingSections(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    decoration: BoxDecoration(
                      color: TColor.primaryColor2.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today Status",
                          style: TextStyle(
                              color: TColor.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 70,
                          height: 25,
                          child: RoundButton(
                            title: "Check",
                            type: RoundButtonType.bgGradient,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ActivityTrackerView(),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Text(
                    "Clients Activity Status",
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: media.width * 0.02,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: media.width * 0.4,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: TColor.primaryColor2.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                                ShaderMask(
                                  blendMode: BlendMode.srcIn,
                                  shaderCallback: (bounds) {
                                    return LinearGradient(
                                            colors: TColor.primaryG,
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight)
                                        .createShader(Rect.fromLTRB(
                                            0, 0, bounds.width, bounds.height));
                                  },
                                  child: Text(
                                    "78 H",
                                    style: TextStyle(
                                        color: TColor.white.withOpacity(0.7),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          LineChart(
                            LineChartData(
                              showingTooltipIndicators:
                                  showingTooltipOnSpots.map((index) {
                                return ShowingTooltipIndicators([
                                  LineBarSpot(
                                    tooltipsOnBar,
                                    lineBarsData.indexOf(tooltipsOnBar),
                                    tooltipsOnBar.spots[index],
                                  ),
                                ]);
                              }).toList(),
                              lineTouchData: LineTouchData(
                                enabled: true,
                                handleBuiltInTouches: false,
                                touchCallback: (FlTouchEvent event,
                                    LineTouchResponse? response) {
                                  if (response == null ||
                                      response.lineBarSpots == null) {
                                    return;
                                  }
                                  if (event is FlTapUpEvent) {
                                    final spotIndex =
                                        response.lineBarSpots!.first.spotIndex;
                                    showingTooltipOnSpots.clear();
                                    setState(() {
                                      showingTooltipOnSpots.add(spotIndex);
                                    });
                                  }
                                },
                                mouseCursorResolver: (FlTouchEvent event,
                                    LineTouchResponse? response) {
                                  if (response == null ||
                                      response.lineBarSpots == null) {
                                    return SystemMouseCursors.basic;
                                  }
                                  return SystemMouseCursors.click;
                                },
                                getTouchedSpotIndicator:
                                    (LineChartBarData barData,
                                        List<int> spotIndexes) {
                                  return spotIndexes.map((index) {
                                    return TouchedSpotIndicatorData(
                                      FlLine(
                                        color: Colors.red,
                                      ),
                                      FlDotData(
                                        show: true,
                                        getDotPainter:
                                            (spot, percent, barData, index) =>
                                                FlDotCirclePainter(
                                          radius: 3,
                                          color: Colors.white,
                                          strokeWidth: 3,
                                          strokeColor: TColor.secondaryColor1,
                                        ),
                                      ),
                                    );
                                  }).toList();
                                },
                                touchTooltipData: LineTouchTooltipData(
                                  tooltipBgColor: TColor.secondaryColor1,
                                  tooltipRoundedRadius: 20,
                                  getTooltipItems:
                                      (List<LineBarSpot> lineBarsSpot) {
                                    return lineBarsSpot.map((lineBarSpot) {
                                      return LineTooltipItem(
                                        "${lineBarSpot.x.toInt()} mins ago",
                                        const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    }).toList();
                                  },
                                ),
                              ),
                              lineBarsData: lineBarsData,
                              minY: 0,
                              maxY: 130,
                              titlesData: FlTitlesData(
                                show: false,
                              ),
                              gridData: FlGridData(show: false),
                              borderData: FlBorderData(
                                show: true,
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                 
                  SizedBox(
                    height: media.width * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Clients ",
                        style: TextStyle(
                            color: TColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Container(
                          height: 30,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: TColor.primaryG),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              items: ["Weekly", "Monthly"]
                                  .map((name) => DropdownMenuItem(
                                        value: name,
                                        child: Text(
                                          name,
                                          style: TextStyle(
                                              color: TColor.gray, fontSize: 14),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {},
                              icon: Icon(Icons.expand_more, color: TColor.white),
                              hint: Text(
                                "Monthly",
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: TColor.white, fontSize: 12),
                              ),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 15),
                      height: media.width * 0.5,
                      width: double.maxFinite,
                      child: LineChart(
                        LineChartData(
                          showingTooltipIndicators:
                              showingTooltipOnSpots.map((index) {
                            return ShowingTooltipIndicators([
                              LineBarSpot(
                                tooltipsOnBar,
                                lineBarsData.indexOf(tooltipsOnBar),
                                tooltipsOnBar.spots[index],
                              ),
                            ]);
                          }).toList(),
                          lineTouchData: LineTouchData(
                            enabled: true,
                            handleBuiltInTouches: false,
                            touchCallback: (FlTouchEvent event,
                                LineTouchResponse? response) {
                              if (response == null ||
                                  response.lineBarSpots == null) {
                                return;
                              }
                              if (event is FlTapUpEvent) {
                                final spotIndex =
                                    response.lineBarSpots!.first.spotIndex;
                                showingTooltipOnSpots.clear();
                                setState(() {
                                  showingTooltipOnSpots.add(spotIndex);
                                });
                              }
                            },
                            mouseCursorResolver: (FlTouchEvent event,
                                LineTouchResponse? response) {
                              if (response == null ||
                                  response.lineBarSpots == null) {
                                return SystemMouseCursors.basic;
                              }
                              return SystemMouseCursors.click;
                            },
                            getTouchedSpotIndicator: (LineChartBarData barData,
                                List<int> spotIndexes) {
                              return spotIndexes.map((index) {
                                return TouchedSpotIndicatorData(
                                  FlLine(
                                    color: Colors.transparent,
                                  ),
                                  FlDotData(
                                    show: true,
                                    getDotPainter:
                                        (spot, percent, barData, index) =>
                                            FlDotCirclePainter(
                                      radius: 3,
                                      color: Colors.white,
                                      strokeWidth: 3,
                                      strokeColor: TColor.secondaryColor1,
                                    ),
                                  ),
                                );
                              }).toList();
                            },
                            touchTooltipData: LineTouchTooltipData(
                              tooltipBgColor: TColor.secondaryColor1,
                              tooltipRoundedRadius: 20,
                              getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                                return lineBarsSpot.map((lineBarSpot) {
                                  return LineTooltipItem(
                                    "${lineBarSpot.x.toInt()} mins ago",
                                    const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                          lineBarsData: lineBarsData1,
                          minY: -0.5,
                          maxY: 110,
                          maxX: 10,
                          
                          titlesData: FlTitlesData(
                              show: true,
                              leftTitles: AxisTitles(
                              ),
                              topTitles: AxisTitles(),
                              bottomTitles: AxisTitles(
                                sideTitles: bottomTitles,
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: rightTitles,
                              )),
                          gridData: FlGridData(
                            show: true,
                            drawHorizontalLine: true,
                            horizontalInterval: 25,
                            drawVerticalLine: false,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(
                                color: TColor.gray.withOpacity(0.15),
                                strokeWidth: 2,
                              );
                            },
                          ),
                          borderData: FlBorderData(
                            show: true,
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Latest Clients Activities",
                        style: TextStyle(
                            color: TColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "See More",
                          style: TextStyle(
                              color: TColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: lastWorkoutArr.length,
                      itemBuilder: (context, index) {
                        var wObj = lastWorkoutArr[index] as Map? ?? {};
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const FinishedWorkoutView(),
                                ),
                              );
                            },
                            child: DietRow(wObj: wObj));
                      }),
                  SizedBox(
                    height: media.width * 0.1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      2,
      (i) {
        var color0 = TColor.secondaryColor1;

        switch (i) {
          case 0:
            return PieChartSectionData(
                color: color0,
                value: 33,
                title: '',
                radius: 55,
                titlePositionPercentageOffset: 0.55,
                badgeWidget: const Text(
                  "20,1",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ));
          case 1:
            return PieChartSectionData(
              color: Colors.white,
              value: 75,
              title: '',
              radius: 45,
              titlePositionPercentageOffset: 0.55,
            );

          default:
            throw Error();
        }
      },
    );
  }

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
      ];

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        gradient: LinearGradient(colors: [
          TColor.primaryColor2.withOpacity(0.5),
          TColor.primaryColor1.withOpacity(0.5),
        ]),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 35),
          FlSpot(2, 70),
          FlSpot(3, 40),
          FlSpot(4, 80),
          FlSpot(5, 25),
          FlSpot(6, 70),
          FlSpot(7, 35),
        ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        gradient: LinearGradient(colors: [
          TColor.secondaryColor2.withOpacity(0.5),
          TColor.secondaryColor1.withOpacity(0.5),
        ]),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
        ),
        spots: const [
          FlSpot(1, 80),
          FlSpot(2, 50),
          FlSpot(3, 90),
          FlSpot(4, 40),
          FlSpot(5, 80),
          FlSpot(6, 35),
          FlSpot(7, 60),
        ],
      );

  SideTitles get rightTitles => SideTitles(
        getTitlesWidget: rightTitleWidgets,
        showTitles: true,
        interval: 20,
        reservedSize: 40,
      );

  Widget rightTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 20:
        text = '10';
        break;
      case 40:
        text = '20';
        break;
      case 60:
        text = '40';
        break;
      case 80:
        text = '60';
        break;
      case 100:
        text = '80';
        break;
      default:
        return Container();
    }

    return Text(text,
        style: TextStyle(
          color: TColor.gray,
          fontSize: 12,
        ),
        textAlign: TextAlign.center);
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = TextStyle(
      color: TColor.gray,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('Jan', style: style);
        break;
      case 2:
        text = Text('Fiv', style: style);
        break;
      case 3:
        text = Text('Mar', style: style);
        break;
      case 4:
        text = Text('Avr', style: style);
        break;
      case 5:
        text = Text('mai', style: style);
        break;
      case 6:
        text = Text('Jui', style: style);
        break;
      case 7:
        text = Text('Jly', style: style);
        break;
        case 8:
        text = Text('Aug', style: style);
        break;
        case 9:
        text = Text('Sep', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }
}
