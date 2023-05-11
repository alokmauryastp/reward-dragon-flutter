import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/screens/manager_wellbeing/model/team_wellbeing_list.dart';

import '../../../constants/literals.dart';

class ManagerWellbeingList extends StatelessWidget {

  const ManagerWellbeingList(this.teamWellbeingLists, {super.key});
  final List<IndividualTeamWellbeingPercentList>? teamWellbeingLists;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: teamWellbeingLists?.length??0,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 10.w),
            child: Container(
              width: size.width,
              height: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff414141),
                    Color(0xff000000),
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 20.w,
                      backgroundColor: yellow,
                      child: CircleAvatar(
                        radius: 19.w,
                        child: Image.network(teamWellbeingLists![index].avatarImage,errorBuilder: (a,b,c)=>Image.asset('assets/images/logo.png'),),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      teamWellbeingLists![index].username,
                      style: const TextStyle(color: white),
                    ),
                    const Spacer(),
                    Text(
                      '${teamWellbeingLists![index].percent.toInt()}%',
                      style: const TextStyle(color: white),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
