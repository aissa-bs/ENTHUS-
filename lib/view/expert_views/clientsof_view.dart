import 'package:fitness/common_widget/clientrow.dart';
import 'package:flutter/material.dart';

class Clientsofview extends StatefulWidget {
  const Clientsofview({super.key});

  @override
  State<Clientsofview> createState() => _ClientsofviewState();
}

class _ClientsofviewState extends State<Clientsofview> {
  List clientsdt = [
    {
      "image": "assets/img/ml.png",
      "firstname": "Bensadia",
      "lastname": "Aissa",
    },
    {
      "image": "assets/img/ml.png",
      "firstname": "Khelifa",
      "lastname": "Krike",
    },
    {
      "image": "assets/img/ml.png",
      "firstname": "Koulal",
      "lastname": "Youcef",
    },
    {
      "image": "assets/img/ml.png",
      "firstname": "Bouhadjeur",
      "lastname": "Abdelouahab",
    } ,] ;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        title: const Text('My Clients '),
        backgroundColor: const Color.fromARGB(255, 234, 236, 253),
      ),
      body: 
       SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(16.0),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              Container(
      padding: EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          suffixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (value) {
          setState(() {
            
          });
        },
      ),
    ),
               SizedBox(
                           
                            
                           child : ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: clientsdt.length,
                              itemBuilder: (context, index) {
                                var wObj = clientsdt[index] as Map? ?? {};
                                return InkWell(
                                  onTap: (){
                                  },
                                  child:  Clientrow(wObj: wObj) );
                              }),
                          ),
             ],
           ),
         ),
       ),

    );
  }
}