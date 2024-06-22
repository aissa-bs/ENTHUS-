import 'package:flutter/material.dart';

import '../../../common/colo_extension.dart';
import '../../../common_widget/notification_row.dart';

class SportExpertNotificationView extends StatefulWidget {
  const SportExpertNotificationView({super.key});

  @override
  State<SportExpertNotificationView> createState() => _SportExpertNotificationViewState();
}

class _SportExpertNotificationViewState extends State<SportExpertNotificationView> {
  List notificationArr = [
    {"image": "assets/img/Workout1.png", "title": "Aissa Bensadia Just finished his day target", "time": "About 1 minutes ago"},
    {"image": "assets/img/Workout3.png", "title": "Khelifa Krike Just Start His workout", "time": "About 1 Min ago"},
    {"image": "assets/img/u2.png", "title": "Chahla Ben Send you A Reaquest", "time": "About 3 hours ago"},
    {"image": "assets/img/Workout1.png", "title": "Bouhadjeur Wahab Pay His monthly Subscribtion", "time": "29 May"},
    {"image": "assets/img/loading.png", "title": "Youcef koulal finished his monthly program", "time": "8 April"},
    {"image": "assets/img/payment.png", "title": "Check your payment Status", "time": "8 April"},
  ];

  @override
  Widget build(BuildContext context) {
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
          "Notification",
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
                width: 12,
                height: 12,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
      backgroundColor: TColor.white,
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        itemBuilder: ((context, index) {
          var nObj = notificationArr[index] as Map? ?? {};
          return NotificationRow(nObj: nObj);
      }), separatorBuilder: (context, index){
        return Divider(color: TColor.gray.withOpacity(0.5), height: 1, );
      }, itemCount: notificationArr.length),
    );
  }
}
