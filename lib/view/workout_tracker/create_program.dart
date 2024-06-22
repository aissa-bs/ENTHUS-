import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:flutter/material.dart';

class Exercise {
  final String name;
  final String image;
  bool isSelected;
  String difficulty;

  Exercise({
    required this.name,
    required this.image,
    this.isSelected = false,
    this.difficulty = 'Easy',
  });
}

class ExerciseGroup {
  final String name;
  final List<Exercise> exercises;
  bool isExpanded;

  ExerciseGroup({
    required this.name,
    required this.exercises,
    this.isExpanded = false,
  });
}

class ProgramCreationPage extends StatefulWidget {
  @override
  _ProgramCreationPageState createState() => _ProgramCreationPageState();
}

class _ProgramCreationPageState extends State<ProgramCreationPage> {
  
  List<ExerciseGroup> exerciseGroups = [
    ExerciseGroup(
      name: 'Top Body',
      exercises: [
        Exercise(name: 'Push Up', image: 'assets/img/img_2.png'),
        Exercise(name: 'Pull Up', image: 'assets/img/img_2.png'),
      ],
    ),
    ExerciseGroup(
      name: 'Lower Body',
      exercises: [
        Exercise(name: 'Squat', image: 'assets/img/img_2.png'),
        Exercise(name: 'Lunge', image: 'assets/img/img_2.png'),
      ],
    ),
    ExerciseGroup(
      name: 'Abs',
      exercises: [
        Exercise(name: 'Crunch', image: 'assets/img/img_2.png'),
        Exercise(name: 'Plank', image: 'assets/img/img_2.png'),
      ],
    ),
    ExerciseGroup(
      name: 'Back',
      exercises: [
        Exercise(name: 'Deadlift', image: 'assets/img/img_2.png'),
        Exercise(name: 'Bent Over Row', image: 'assets/img/img_2.png'),
      ],
    ),
    ExerciseGroup(
      name: 'Cardio',
      exercises: [
        Exercise(name: 'Running', image: 'assets/img/img_2.png'),
        Exercise(name: 'Cycling', image: 'assets/img/img_2.png'),
      ],
    ),
  ];

  int currentDay = 1;
  bool isRestDay = false;
  Map<int, List<ExerciseGroup>> weeklyProgram = {};
  int programDurationInMinutes = 0;

  @override
  void initState() {
    super.initState();
    initializeWeeklyProgram();
  }

  void initializeWeeklyProgram() {
    for (int i = 1; i <= 7; i++) {
      weeklyProgram[i] = exerciseGroups
          .map((group) => ExerciseGroup(
                name: group.name,
                exercises: group.exercises
                    .map((exercise) => Exercise(
                          name: exercise.name,
                          image: exercise.image,
                        ))
                    .toList(),
              ))
          .toList();
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
        weeklyProgram[currentDay]?.forEach((group) {
          for (var exercise in group.exercises) {
            exercise.isSelected = false;
          }
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
                padding: const EdgeInsets.only(bottom: 20, top: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 222, 233, 223), // Change the background color here
                    borderRadius: BorderRadius.circular(10), // Adjust the border radius to your liking
                  ),
                  padding: const EdgeInsets.all(10), // Add padding for some space around the checkbox
                  child: CheckboxListTile(
                    title: const Text('Rest Day',style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),),
                    value: isRestDay,
                    onChanged: (bool? value) {
                      toggleRestDay();
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Colors.blue, // Change the color of the checkmark when selected
                    checkColor: Colors.white, // Change the color of the checkmark itself
                  ),
                ),
              ),
              if (!isRestDay)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: exerciseGroups.length,
                  itemBuilder: (context, index) {
                    ExerciseGroup group = weeklyProgram[currentDay]![index];
                    return Card(
                      color: const Color.fromARGB(255, 234, 239, 253),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              group.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: Icon(
                              group.isExpanded
                                  ? Icons.expand_less
                                  : Icons.expand_more,
                            ),
                            onTap: () {
                              setState(() {
                                group.isExpanded = !group.isExpanded;
                              });
                            },
                          ),
                          Visibility(
                            visible: group.isExpanded,
                            child: Column(
                              children: group.exercises.map((exercise) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        exercise.image,
                                        width: 50,
                                        height: 50,
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          exercise.name,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      DropdownButton<String>(
                                        value: exercise.difficulty,
                                        items: <String>['Easy', 'Medium', 'Hard']
                                            .map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            exercise.difficulty = newValue!;
                                          });
                                        },
                                      ),
                                      Checkbox(
                                        value: exercise.isSelected,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            exercise.isSelected = value!;
                                          });
                                        },
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
                  },
                ),
              const SizedBox(height: 20),
              if (!isRestDay)
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
        '${programDurationInMinutes ~/ 60} hours ${programDurationInMinutes % 60} minutes',
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

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 60),
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
  final Map<int, List<ExerciseGroup>> weeklyProgram;

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
          title: 'Select Program Duration',
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
                  decoration: const InputDecoration(labelText: 'Program Name', icon: Icon(Icons.insert_drive_file_outlined)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a program name';
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
                  decoration: const InputDecoration(labelText: 'Program Description', icon: Icon(Icons.document_scanner_rounded)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a program description';
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


