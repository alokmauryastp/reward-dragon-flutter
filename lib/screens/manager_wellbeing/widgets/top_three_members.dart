import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/screens/manager_wellbeing/model/team_wellbeing_top_three.dart';
import '../../../constants/literals.dart';

class TopThreeMembers extends StatelessWidget {
  const TopThreeMembers(this.topThreeLists, {super.key});
  final List<TopThreeList>? topThreeLists;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: topThreeLists?.length??0,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 10.w),
            child: Card(
              clipBehavior: Clip.none,
              elevation: 0.w,
              color: blackApp,
              child: Container(

                padding: EdgeInsets.zero,
                width: size.width * 1,
                height: 35.w,

                decoration: BoxDecoration(
                  gradient: blackGradient,
                  border: Border.all(color: yellow),
                  borderRadius: BorderRadius.circular(5.w),
                ),

                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 13.w,
                        backgroundColor: yellow,
                        child: CircleAvatar(
                          radius: 12.w,
                          child: Image.asset(topThreeLists![index].avatarImage,errorBuilder: (a,b,c)=>Image.asset('assets/images/logo.png'),),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        topThreeLists![index].username.toString(),
                        style: const TextStyle(color: white),
                      ),
                      const Spacer(),
                      Text(
                        '${topThreeLists![index].percent.toInt()}%',
                        style: const TextStyle(color: white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
