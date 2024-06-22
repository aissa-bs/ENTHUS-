import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:flutter/material.dart';

class Food {
  final String name;
  final String image;
  bool isSelected;
  int quantity;

  Food({
    required this.name,
    required this.image,
    this.isSelected = false,
    this.quantity = 0,
  });
}

class FoodGroup {
  final String name;
  final List<Food> foods;
  bool isExpanded;

  FoodGroup({
    required this.name,
    required this.foods,
    this.isExpanded = false,
  });
}

class SubMealGroup {
  final String name;
  final List<FoodGroup> foodGroups;
  bool isExpanded;

  SubMealGroup({
    required this.name,
    required this.foodGroups,
    this.isExpanded = false,
  });
}

class MealGroup {
  final String name;
  final List<SubMealGroup> subMealGroups;

  MealGroup({required this.name, required this.subMealGroups});
}


class DietCreationPage extends StatefulWidget {
  @override
  _DietCreationPageState createState() => _DietCreationPageState();
}

class _DietCreationPageState extends State<DietCreationPage> {
  
  List<MealGroup> mealGroups = [
    MealGroup(
      name: 'Meal Groups',
      subMealGroups: [
        SubMealGroup(
          name: 'Breakfast',
          foodGroups: [
            FoodGroup(
              name: 'milks and Dairy products',
              foods: [
                Food(name: 'Milk', image: 'assets/img/milk.png'),
                Food(name: 'cheeze', image: 'assets/img/cheese.png'),
                Food(name: 'Yogurt', image: 'assets/img/yogurt.png'),
              ],
            ),
            FoodGroup(
              name: 'meats',
              foods: [
                Food(name: 'chiken', image: 'assets/img/chicken.png'),
                Food(name: 'Turkey escalope', image: 'assets/img/turkey.png'),
                Food(name: 'Beef', image: 'assets/img/beef.png'),
                Food(name: 'Sheep meat', image: 'assets/img/cheep.png'),
                Food(name: 'Fish', image: 'assets/img/fish.png'),
              ],
            ),
            // Add more FoodGroups if needed
          ],
        ),
        SubMealGroup(
          name: 'Meal',
          foodGroups: [
            FoodGroup(
              name: 'Breads',
              foods: [
                Food(name: 'barley bread', image: 'assets/img/bread.png'),
                Food(name: 'Whole wheat bread', image: 'assets/img/fbread.png'),
                Food(name: 'Rye bread', image: 'assets/img/ryebread.png'),
              ],
            ),
            FoodGroup(
              name: 'Grains',
              foods: [
                Food(name: 'Beans', image: 'assets/img/beans.png'),
                Food(name: 'Lentil', image: 'assets/img/lentils.png'),
                Food(name: 'Rice', image: 'assets/img/rice.png'),
                Food(name: 'Chickpeas', image: 'assets/img/chickpeas.png'),
              ],
            ),
            FoodGroup(
              name: 'meats',
              foods: [
                Food(name: 'chiken', image: 'assets/img/chicken.png'),
                Food(name: 'Turkey escalope', image: 'assets/img/turkey.png'),
                Food(name: 'Beef', image: 'assets/img/beef.png'),
                Food(name: 'Sheep meat', image: 'assets/img/cheep.png'),
                Food(name: 'Fish', image: 'assets/img/fish.png'),
              ],
            ),
            FoodGroup(
              name: 'Vegetables',
              foods: [
                Food(name: 'Potatoes', image: 'assets/img/potatoes.png'),
                Food(name: 'vegetables salad', image: 'assets/img/salad.png'),
                Food(name: 'Broccoli', image: 'assets/img/broccoli.png'),
                Food(name: 'Cauliflower', image: 'assets/img/cauliflower.png'),
              ],
            ),
            FoodGroup(
              name: 'Fruits',
              foods: [
                Food(name: 'َApple', image: 'assets/img/apple.png'),
                Food(name: 'Banana', image: 'assets/img/banana.png'),
                Food(name: 'Orange', image: 'assets/img/orange.png'),
                Food(name: 'Lemon', image: 'assets/img/lemon.png'),
                Food(name: 'Grape', image: 'assets/img/grape.png'),
                Food(name: 'Peach', image: 'assets/img/peach.png'),
                Food(name: 'Strawberrie', image: 'assets/img/strawberries.png'),
              ],
            ),
            // Add more FoodGroups if needed
          ],
        ),
        SubMealGroup(
          name: 'Dinner',
          foodGroups: [
           FoodGroup(
              name: 'Vegetables',
              foods: [
                Food(name: 'Potatoes', image: 'assets/img/potatoes.png'),
                Food(name: 'vegetables salad', image: 'assets/img/salad.png'),
                Food(name: 'Broccoli', image: 'assets/img/broccoli.png'),
                Food(name: 'Cauliflower', image: 'assets/img/cauliflower.png'),
              ],
            ),
            FoodGroup(
              name: 'Fruits',
              foods: [
                Food(name: 'َApple', image: 'assets/img/apple.png'),
                Food(name: 'Banana', image: 'assets/img/banana.png'),
                Food(name: 'Orange', image: 'assets/img/orange.png'),
                Food(name: 'Lemon', image: 'assets/img/lemon.png'),
                Food(name: 'Grape', image: 'assets/img/grape.png'),
                Food(name: 'Peach', image: 'assets/img/peach.png'),
                Food(name: 'Strawberrie', image: 'assets/img/strawberries.png'),
              ],
            ),
            FoodGroup(
              name: 'meats',
              foods: [
                Food(name: 'chiken', image: 'assets/img/chicken.png'),
                Food(name: 'Turkey escalope', image: 'assets/img/turkey.png'),
                Food(name: 'Beef', image: 'assets/img/beef.png'),
                Food(name: 'Sheep meat', image: 'assets/img/cheep.png'),
                Food(name: 'Fish', image: 'assets/img/fish.png'),
              ],
            ),
            // Add more FoodGroups if needed
          ],
        ),
        SubMealGroup(
          name: 'Preworkout',
          foodGroups: [
            FoodGroup(
              name: 'Snaks and Energy',
              foods: [
                Food(name: 'Snack bar', image: 'assets/img/snack.png'),
                Food(name: 'Energy drink', image: 'assets/img/energy-drink.png'),
                Food(name: 'Orange juice ', image: 'assets/img/orange-juice.png'),
                Food(name: 'Banana ', image: 'assets/img/banana.png'),
              ],
            ),
            // Add more FoodGroups if needed
          ],
        ),
        SubMealGroup(
          name: 'AfterWorkout',
          foodGroups: [
            FoodGroup(
              name: 'Dietary supplement',
              foods: [
                Food(name: 'Protein whey', image: 'assets/img/whey.png'),
                Food(name: 'Multi Vitamine', image: 'assets/img/vitamins.png'),
                Food(name: 'Creatine', image: 'assets/img/creatine.png'),
              ],
            ),
            FoodGroup(
              name: 'Reacupiration',
              foods: [
                Food(name: 'Rice', image: 'assets/img/rice.png'),
                Food(name: 'fruits', image: 'assets/img/fruits.png'),
                Food(name: 'vegetable salad', image: 'assets/img/salad.png'),
              ],
            ),
            FoodGroup(
              name: 'meats',
              foods: [
                Food(name: 'chiken', image: 'assets/img/chicken.png'),
                Food(name: 'Turkey escalope', image: 'assets/img/turkey.png'),
                Food(name: 'Beef', image: 'assets/img/beef.png'),
                Food(name: 'Sheep meat', image: 'assets/img/cheep.png'),
                Food(name: 'Fish', image: 'assets/img/fish.png'),
              ],
            ),
            // Add more FoodGroups if needed
          ],
        ),
         SubMealGroup(
          name: 'To Avoid',
          foodGroups: [
            FoodGroup(
              name: 'suger',
              foods: [
                Food(name: 'Sweets', image: 'assets/img/sweets.png'),
                Food(name: 'soda', image: 'assets/img/soda.png'),
                Food(name: 'Cakes', image: 'assets/img/cake.png'),
              ],
            ),
            FoodGroup(
              name: 'other',
              foods: [
                Food(name: 'white bread', image: 'assets/img/wbread.png'),
                Food(name: 'Oil', image: 'assets/img/oil.png'),
              ],
            ),
            // Add more FoodGroups if needed
          ],
        ),
      ],
    ),
  ];

  int currentDay = 1;
  bool isRestDay = false;
  Map<int, List<MealGroup>> weeklyProgram = {};
  int programDurationInMinutes = 0;

  @override
  void initState() {
    super.initState();
    initializeWeeklyProgram();
  }

  void initializeWeeklyProgram() {
  for (int i = 1; i <= 7; i++) {
    weeklyProgram[i] = mealGroups.map((mealGroup) {
      return MealGroup(
        name: mealGroup.name,
        subMealGroups: mealGroup.subMealGroups.map((subMealGroup) {
          return SubMealGroup(
            name: subMealGroup.name,
            foodGroups: subMealGroup.foodGroups.map((foodGroup) {
              return FoodGroup(
                name: foodGroup.name,
                foods: foodGroup.foods.map((food) {
                  return Food(
                    name: food.name,
                    image: food.image,
                    isSelected: food.isSelected,
                  );
                }).toList(),
                isExpanded: false,
              );
            }).toList(),
            isExpanded: false,
          );
        }).toList(),
      );
    }).toList();
  }
}

  void backDayProgram() {
    setState(() {
      if (currentDay > 1) {
        currentDay--;
        isRestDay = false;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProgramSummaryPage(weeklyProgram: weeklyProgram)),
        );
      }
    });
  }
  void saveDayProgram() {
    setState(() {
      if (currentDay < 7) {
        currentDay++;
        isRestDay = false;
        programDurationInMinutes = 0;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProgramSummaryPage(weeklyProgram: weeklyProgram)),
        );
      }
    });
  }

  void toggleRestDay() {
  setState(() {
    isRestDay = !isRestDay;
    if (isRestDay) {
      weeklyProgram[currentDay]?.forEach((mealGroup) {
        mealGroup.subMealGroups.forEach((subMealGroup) {
          subMealGroup.foodGroups.forEach((foodGroup) {
            foodGroup.foods.forEach((food) {
              food.isSelected = false;
            });
          });
        });
      });
    }
  });
}

   void showDurationPickerDialog() async {
    final result = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return DurationPickerDialog(
          min1: 0,
          max1: 23,
          min2: 0,
          max2: 59,
          title: 'Select workout Duration',
          d1: 'Hours : ',
          d2: ' Minutes : ',
          initialHours: programDurationInMinutes ~/ 60, // Extract hours from total minutes
          initialMinutes: programDurationInMinutes % 60, // Extract minutes from total minutes
        );
      },
    );

    if (result != null) {
      setState(() {
        // Convert hours and minutes to total minutes
        programDurationInMinutes = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Your Program '),
        backgroundColor: const Color.fromARGB(255, 234, 236, 253),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 150),
                child: Text(
                          'Day $currentDay',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 125),
                child: SizedBox(
                  width: 120,
                  height: 120,
                
                  child: Image.asset(
                                 'assets/img/on_3.png',
                              
                                       ),
                ),
              ),
        const SizedBox(height: 16),
                Container(
  child: ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: mealGroups.length,
    itemBuilder: (context, mealGroupIndex) {
      final mealGroup = mealGroups[mealGroupIndex];
      return Column(
        children: [
          ListTile(
            title: Text(
              mealGroup.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            children: mealGroup.subMealGroups.map((subMealGroup) {
               return Card(
                         color: subMealGroup.name == 'To Avoid'
                           ? Color.fromARGB(255, 255, 180, 174)
                        : Color.fromARGB(255, 237, 243, 236),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      subMealGroup.name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Icon(
                                      subMealGroup.isExpanded
                                          ? Icons.expand_less
                                          : Icons.expand_more,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        subMealGroup.isExpanded =
                                            !subMealGroup.isExpanded;
                                      });
                                    },
                                  ),
                                  Visibility(
                                    visible: subMealGroup.isExpanded,
                                    child: Column(
                                      children: subMealGroup.foodGroups.map((foodGroup) {
                                        return Card(
                                          color: Color.fromARGB(255, 218, 245, 253),
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                title: Text(
                                                  foodGroup.name,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                trailing: Icon(
                                                  foodGroup.isExpanded
                                                      ? Icons.expand_less
                                                      : Icons.expand_more,
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    foodGroup.isExpanded =
                                                        !foodGroup.isExpanded;
                                                  });
                                                },
                                              ),
                                              Visibility(
                                                visible: foodGroup.isExpanded,
                                                child: Column(
                                                  children: [
                                                    Column(
                                                      children: foodGroup.foods.map((food) {
                                                        return Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                                          child: Row(
                                                            children: [
                                                              Image.asset(
                                                                food.image,
                                                                width: 50,
                                                                height: 50,
                                                              ),
                                                              const SizedBox(width: 10),
                                                              Expanded(
                                                                child: Text(
                                                                  food.name,
                                                                  style: const TextStyle(fontSize: 16),
                                                                ),
                                                              ),
                                                              NumberPicker(
                                                                value: food.quantity,
                                                                minValue: 0,
                                                                maxValue: 100,
                                                                onChanged: (value) {
                                                                  setState(() {
                                                                    food.quantity = value;
                                                                  });
                                                                },
                                                              ),
                                                              Checkbox(
                                                                value: food.isSelected,
                                                                onChanged: (bool? value) {
                                                                  setState(() {
                                                                    food.isSelected = value!;
                                                                  });
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      }).toList(),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext context) {
                                                            return AddFoodDialog(
                                                              onAdd: (name, description, calories) {
                                                                setState(() {
                                                                  foodGroup.foods.add(Food(
                                                                    name: name,
                                                                    image: 'assets/img/toast.png',
                                                                    isSelected: false,
                                                                    quantity: 0,
                                                                  ));
                                                                });
                                                              },
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: const Text('Add Food Item'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            );
            }).toList(),
          ),
        ],
      );
    },
  ),
),
Padding(
                padding: const EdgeInsets.only(left: 135),
                child: SizedBox(
                  width: 100,
                  height: 100,
                
                  child: Image.asset(
                                 'assets/img/healthy.png',
                              
                                       ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    if (currentDay > 1)
                    SizedBox(
                      width: 100,
                        height: 50,
                      child: RoundButton(
                        
                        onPressed: backDayProgram,
                        title: 'Back',
                      ),
                    ),
                    Padding(
                      padding: currentDay == 1 ? const EdgeInsets.only(left: 270) :const EdgeInsets.only(left: 170) ,
                      child: SizedBox(
                        width: 100,
                            height: 50,
                        
                        child: RoundButton(
                          onPressed: saveDayProgram,
                          title: currentDay < 7 ? 'Next' : 'Finish',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class ProgramSummaryPage extends StatefulWidget {
  final Map<int, List<MealGroup>> weeklyProgram;

  ProgramSummaryPage({required this.weeklyProgram});

  @override
  _ProgramSummaryPageState createState() => _ProgramSummaryPageState();
}

class _ProgramSummaryPageState extends State<ProgramSummaryPage> {
  final _formKey = GlobalKey<FormState>();
  String programName = '';
  String programDescription = '';
    int programDurationInMinutes = 0;
void showDurationPickerDialog() async {
    final result = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return DurationPickerDialog(
          min1: 0,
          max1: 12,
          min2: 0,
          max2: 30,
          title: 'Select Diet Duration',
          d1: 'Months : ',
          d2: ' Days : ',
          initialHours: programDurationInMinutes ~/ 60, // Extract hours from total minutes
          initialMinutes: programDurationInMinutes % 60, // Extract minutes from total minutes
        );
      },
    );

    if (result != null) {
      setState(() {
        // Convert hours and minutes to total minutes
        programDurationInMinutes = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Program Summary'),
        backgroundColor: const Color.fromARGB(255, 234, 236, 253),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                 decoration: BoxDecoration(
          color: TColor.lightGray, borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'Diet Name', icon: Icon(Icons.insert_drive_file_outlined)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Diet name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    programName = value!;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
      decoration: BoxDecoration(
          color: TColor.lightGray, borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'Diet Description', icon: Icon(Icons.document_scanner_rounded)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Diet description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    programDescription = value!;
                  },
                ),
              ),
              const SizedBox(height: 40),
              Container(
  width: double.infinity,
  padding: const EdgeInsets.all(16.0),
  decoration: BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(10.0),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        ' Duration:',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        '${programDurationInMinutes ~/ 60} Months ${programDurationInMinutes % 60} Days',
        style: const TextStyle(fontSize: 14.0),
      ),
      ElevatedButton(
            onPressed: showDurationPickerDialog,
            child: const Text(
              'Choose',
              style: TextStyle(fontSize: 14.0),
            ),
          ),
    ],
  ),
),
          const SizedBox(height: 100),
              SizedBox(
                width: 200,
                            height: 50,
                child: RoundButton(
                  title: 'Save Program',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Save the program here
                      Navigator.pop(context);
                    }
                  },
                  
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class DurationPickerDialog extends StatefulWidget {
  final int initialHours;
  final int initialMinutes;
  final int min1;
  final int min2;
  final int max1;
  final int max2;

  final String title ;
  final String d1 ;
  final String d2 ;

  DurationPickerDialog({
    required this.initialHours,
    required this.initialMinutes, required this.title, required this.d1, required this.d2, required this.min1, required this.min2, required this.max1, required this.max2,

  });

  @override
  _DurationPickerDialogState createState() => _DurationPickerDialogState();
}

class _DurationPickerDialogState extends State<DurationPickerDialog> {
  late int selectedHours;
  late int selectedMinutes;

  @override
  void initState() {
    super.initState();
    selectedHours = widget.initialHours;
    selectedMinutes = widget.initialMinutes;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350, // Set the desired width here
        child: AlertDialog(
          title: Text(widget.title),
          content: Container(
            width: double.maxFinite,
            height: 200, // Set the desired height here
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.d1),
                    NumberPicker(
                      value: selectedHours,
                      minValue: widget.min1,
                      maxValue: widget.max1,
                      onChanged: (value) {
                        setState(() {
                          selectedHours = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.d2 ),
                    NumberPicker(
                      value: selectedMinutes,
                      minValue: widget.min2,
                      maxValue: widget.max2,
                      onChanged: (value) {
                        setState(() {
                          selectedMinutes = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                int totalMinutes = selectedHours * 60 + selectedMinutes;
                Navigator.of(context).pop(totalMinutes);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NumberPicker extends StatefulWidget {
  final int value;
  final int minValue;
  final int maxValue;
  final ValueChanged<int>? onChanged;

  const NumberPicker({
    Key? key,
    required this.value,
    required this.minValue,
    required this.maxValue,
    this.onChanged,
  }) : super(key: key);

  @override
  _NumberPickerState createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  late int _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (_currentValue > widget.minValue) {
                _currentValue--;
                if (widget.onChanged != null) {
                  widget.onChanged!(_currentValue);
                }
              }
            });
          },
        ),
        Text(_currentValue.toString().padLeft(2, '0')),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              if (_currentValue < widget.maxValue) {
                _currentValue++;
                if (widget.onChanged != null) {
                  widget.onChanged!(_currentValue);
                }
              }
            });
          },
        ),
      ],
    );
  }
}
class AddFoodDialog extends StatefulWidget {
  final Function(String, String, String) onAdd;

  const AddFoodDialog({required this.onAdd, Key? key}) : super(key: key);

  @override
  _AddFoodDialogState createState() => _AddFoodDialogState();
}

class _AddFoodDialogState extends State<AddFoodDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _caloriesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Food Item'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Item Name'),
          ),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Item Description'),
          ),
          TextField(
            controller: _caloriesController,
            decoration: const InputDecoration(labelText: 'Item Calories'),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final name = _nameController.text;
            final description = _descriptionController.text;
            final calories = _caloriesController.text;

            if (name.isNotEmpty && description.isNotEmpty && calories.isNotEmpty) {
              widget.onAdd(name, description, calories);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}

