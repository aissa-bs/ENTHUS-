import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:fitness/services/programms/workoutprogram.dart';
import 'package:fitness/view/meal_planner/diet_program.dart';
import 'package:flutter/material.dart';


class NutExpertProgramsPage extends StatefulWidget {
  const NutExpertProgramsPage({super.key});

  @override
  State<NutExpertProgramsPage> createState() => _NutExpertProgramsPageState();
}

class _NutExpertProgramsPageState extends State<NutExpertProgramsPage> {
  @override
  Widget build(BuildContext context) {
    // Dummy workout program data
    List<WorkoutProgram> programs = [
      WorkoutProgram(
        name: 'Diet 1',
        image: 'assets/img/weight-gain.png',
        progress: 0.6,
        by : 'Gain Program '
      ),
      WorkoutProgram(
        name: 'Diet 2',
        image: 'assets/img/plan.png',
        progress: 0.3,
        by : 'Weight Lose '
      ),
      // Add more programs as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('         Your Created Programs', style: TextStyle(
            color: TColor.primaryColor1,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: programs.map((program) => ProgramCard2(program: program)).toList(),
      ),
    );
  }
}



class ProgramCard2 extends StatelessWidget {
  final WorkoutProgram program;

  const ProgramCard2({
    Key? key,
    required this.program,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180, // Set a fixed height for the container
      padding: const EdgeInsets.all(18), // Padding from all sides
      child: Card(
        color: Color.fromARGB(255, 236, 255, 246), 
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
                    child: Text( program.by
                      ,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                 
                  const SizedBox(height: 15),
                  
                     
                     
                ],
              ),
            ),
            Row(
                       children: [
                         Padding(
                           
                           padding:const EdgeInsets.only(left: 1,),
                           child: SizedBox(
                            width: 70 ,
                            height: 35,
                             child: Center(
                               child: RoundButton(
                                title: "View",
                                type: RoundButtonType.bgGradient,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                onPressed: () {
                                   WorkoutProgram sObj = program ;
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DietProgramView( 
                                      
                                    ),
                                  ),
                                );
                                   
                                }, ),
                             ),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(right: 10),
                           child: Icon(Icons.arrow_forward, color: TColor.primaryColor1),
                         ),
                       ],
                     ),
          ],
          
        ),
      ),
    );
  }
}
