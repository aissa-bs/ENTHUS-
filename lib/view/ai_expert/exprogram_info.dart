import 'package:fitness/common/colo_extension.dart';
import 'package:flutter/material.dart';

import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';

class Iaexgetinfo extends StatefulWidget {
  const Iaexgetinfo({super.key});

  @override
  State<Iaexgetinfo> createState() => _IaexgetinfoState();
}

class _IaexgetinfoState extends State<Iaexgetinfo> {
  TextEditingController txtDate = TextEditingController();
  late final TextEditingController _goal ;
  late final TextEditingController _experience ;
  late final TextEditingController _weight ;
  late final TextEditingController _height ;
  late final TextEditingController _disability ;
  late final TextEditingController _injury ;
  int programDurationInMinutes = 0;

  @override
  void initState() {
    _goal = TextEditingController();
    _experience = TextEditingController();
    _weight = TextEditingController();
    _height = TextEditingController();
    _disability = TextEditingController();
    _injury = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _goal.dispose();
    _experience.dispose();
    _weight.dispose();
    _height.dispose();
    _disability.dispose() ;
    _injury.dispose();
    super.dispose();
  }
   void showDurationPickerDialog() async {
    final result = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return DurationPickerDialog(
          min1: 0,
          max1: 7,
          min2: 0,
          max2: 24,
          title: 'Select workout Duration',
          d1: 'Day per week : ',
          d2: ' Hours per day : ',
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
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nito (IA Expert)"),
        backgroundColor: TColor.white,
        foregroundColor: TColor.black,
        elevation: 0,
      ),
      backgroundColor: TColor.white,
      body: Container(
         decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/bg.png'), // Replace with your background image path
          fit: BoxFit.cover,
        ),
      ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Image.asset(
                    "assets/img/Nito2.png",
                    width: 250,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Text(
                    "Let’s Get some informations",
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "It will help Me to Give you the best results!",
                    style: TextStyle(color: TColor.gray, fontSize: 12),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: TColor.lightGray,
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    width: 50,
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    
                                    child: Image.asset(
                                      "assets/img/gender.png",
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.contain,
                                      color: TColor.gray,
                                    )),
                              
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                       
                                      items: ["Gain", "Lose weight","Phisic","Strangth","Flexibility"]
                                          .map((name) => DropdownMenuItem(
                                                value: name,
                                                child: Text(
                                                  name,
                                                  style: TextStyle(
                                                      color: TColor.gray,
                                                      fontSize: 14),
                                                ),
                                              ))
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                        _goal.text = value.toString();
                                        
        
                                                  });
                                      },
                                      isExpanded: true,
                                      
                                      hint: _goal.text.isEmpty? 
                                      Text(
                                        "Your Goal",
                                        style: TextStyle(
                                        color: TColor.gray,
                                          fontSize: 12),
                                          )
                                          : Text(
                                            _goal.text,
                                         style: TextStyle(
                                         color: TColor.gray,
                                         fontSize: 12),
                                         ),
                                    ),
                                  ),
                                ),
        
                               const SizedBox(width: 8,)
        
                              ],
                            ),),
                        SizedBox(
                          height: media.width * 0.04,
                        ),
                        RoundTextField(
                          controller: _experience,
                          hitText: "Your Experience with gym",
                          icon: "assets/img/date.png",
                        ),
                         SizedBox(
                          height: media.width * 0.04,
                        ),
                         Row(
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
          '${programDurationInMinutes ~/ 60} Day ${programDurationInMinutes % 60} Hours',
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
          SizedBox(
                          height: media.width * 0.04,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: TColor.lightGray,
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    width: 50,
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    
                                    child: Image.asset(
                                      "assets/img/wheelchair.png",
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.contain,
                                      color: TColor.gray,
                                    )),
                              
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                       
                                      items: ["Yes", "No"]
                                          .map((name) => DropdownMenuItem(
                                                value: name,
                                                child: Text(
                                                  name,
                                                  style: TextStyle(
                                                      color: TColor.gray,
                                                      fontSize: 14),
                                                ),
                                              ))
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                        _disability.text = value.toString();
                                        
        
                                                  });
                                      },
                                      isExpanded: true,
                                      
                                      hint: _disability.text.isEmpty
                                         ? Text(
                                        "Do you have any physical disability",
                                        style: TextStyle(
                                        color: TColor.gray,
                                          fontSize: 12),
                                          )
                                          : Text(
                                            _disability.text,
                                         style: TextStyle(
                                         color: TColor.gray,
                                         fontSize: 12),
                                         ),
                                    ),
                                  ),
                                ),
        
                               const SizedBox(width: 8,)
        
                              ],
                            ),),
                            SizedBox(
                          height: media.width * 0.04,
                        ),
                            if(_disability.text == 'Yes')
                        const RoundTextField(
                          
                          hitText: "EXplain Your condition ",
                          icon: "assets/img/wheelchair.png",
                        ),
                        SizedBox(
                          height: media.width * 0.04,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: TColor.lightGray,
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    width: 50,
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    
                                    child: Image.asset(
                                      "assets/img/disability.png",
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.contain,
                                      color: TColor.gray,
                                    )),
                              
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                       
                                      items: ["Yes", "No"]
                                          .map((name) => DropdownMenuItem(
                                                value: name,
                                                child: Text(
                                                  name,
                                                  style: TextStyle(
                                                      color: TColor.gray,
                                                      fontSize: 14),
                                                ),
                                              ))
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                        _injury.text = value.toString();
                                        
        
                                                  });
                                      },
                                      isExpanded: true,
                                      
                                      hint: _injury.text.isEmpty
                                         ? Text(
                                        "Do you have any  Physical injury",
                                        style: TextStyle(
                                        color: TColor.gray,
                                          fontSize: 12),
                                          )
                                          : Text(
                                            _injury.text,
                                         style: TextStyle(
                                         color: TColor.gray,
                                         fontSize: 12),
                                         ),
                                    ),
                                  ),
                                ),
        
                               const SizedBox(width: 8,)
        
                              ],
                            ),),
                        SizedBox(
                          height: media.width * 0.04,
                        ),
                        if(_injury.text == 'Yes')
                        const RoundTextField(
                          
                          hitText: "Explain your injury",
                          icon: "assets/img/disability.png",
                        ),
                        SizedBox(
                          height: media.width * 0.04,
                        ),
                        const RoundTextField(
                          
                          hitText: "Do you have any chronic disease",
                          icon: "assets/img/illness.png",
                        ),
                        SizedBox(
                          height: media.width * 0.04,
                        ),
                        const RoundTextField(
                          
                          hitText: " any Other health condition",
                          icon: "assets/img/heartrate.png",
                        ),
                        SizedBox(
                          height: media.width * 0.04,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RoundTextField(
                                controller: _weight,
                                hitText: "Your Weight",
                                icon: "assets/img/weight.png",
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: TColor.secondaryG,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                "KG",
                                style:
                                    TextStyle(color: TColor.white, fontSize: 12),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: media.width * 0.04,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RoundTextField(
                                controller: _height,
                                hitText: "Your Height",
                                icon: "assets/img/hight.png",
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: TColor.secondaryG,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                "CM",
                                style:
                                    TextStyle(color: TColor.white, fontSize: 12),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: media.width * 0.07,
                        ),
                        RoundButton(
                            title: "Next >",
                            onPressed: () {
                              
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
        width: 450, // Set the desired width here
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
