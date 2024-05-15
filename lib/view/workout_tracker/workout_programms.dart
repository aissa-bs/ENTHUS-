import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:fitness/services/programms/workoutprogram.dart';
import 'package:fitness/view/workout_tracker/program_details.dart';
import 'package:flutter/material.dart';
class WorkoutProgramsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy workout program data
    List<WorkoutProgram> programs = [
      WorkoutProgram(
        name: 'Program 1',
        image: 'assets/img/goal_1.png',
        progress: 0.6,
        by : 'coach 1 '
      ),
      WorkoutProgram(
        name: 'Program 2',
        image: 'assets/img/goal_3.png',
        progress: 0.3,
        by : 'Enthus App '
      ),
      // Add more programs as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Workout Programs', style: TextStyle(
            color: TColor.primaryColor1,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: programs.map((program) => ProgramCard(program: program)).toList(),
      ),
    );
  }
}



class ProgramCard extends StatelessWidget {
  final WorkoutProgram program;

  const ProgramCard({
    Key? key,
    required this.program,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220, // Set a fixed height for the container
      padding: const EdgeInsets.all(18), // Padding from all sides
      child: Card(
        color: const Color.fromARGB(255, 236, 242, 255), 
        margin: EdgeInsets.zero,
        child: Row(
          children: [
            SizedBox(
              width: 80,
              child: Image.asset(
                program.image,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      program.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('by :${program.by}'
                      ,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left:10, right: 10,bottom: 10),
                        child: SizedBox(
                          width: 220 ,
                          height: 8,
                          child: LinearProgressIndicator(
                            value: program.progress,
                            backgroundColor: Colors.grey[300], // Background color of the progress bar
                            valueColor: AlwaysStoppedAnimation<Color>(TColor.primaryColor1),
                          ),
                        ),
                      ),
                      Padding(
                    padding: const EdgeInsets.only(top: 10, left:10,bottom: 10),
                    child: Text(
                      '${(program.progress * 100).toInt()}% ', // Display percentage
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  
                     Row(
                       children: [
                         Padding(
                           
                           padding:const EdgeInsets.only(left: 190,),
                           child: SizedBox(
                            width: 70 ,
                            height: 35,
                             child: Center(
                               child: RoundButton(
                                title: "Go",
                                type: RoundButtonType.bgGradient,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                onPressed: () {
                                   WorkoutProgram sObj = program ;
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProgramDetailView(dObj: sObj, 
                                      
                                    ),
                                  ),
                                );
                                   
                                }, ),
                             ),
                           ),
                         ),
                         Icon(Icons.arrow_forward, color: TColor.primaryColor1),
                       ],
                     ),
                     
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
