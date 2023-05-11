import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/constants/literals.dart';

class TopBorderWidget extends StatelessWidget {
  const TopBorderWidget(this.text1, this.text2, this.image, {super.key});

  final String text1;
  final String text2;
  final String image;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: 100.w,
      width: size.width,
      decoration: BoxDecoration(
        border: Border.all(color: yellow),
        gradient: const LinearGradient(
            colors: [Color(0xff404040), Color(0xff010101)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.w), topRight: Radius.circular(10.w)),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: white),
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Expanded(
                    child: Text(
                      text2,
                      // '(Click to view  and accept)',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: white),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Image.asset(
              width:100.w,
              image.toString(),
              height: 75.w,
            )
          ],
        ),
      ),
    );
  }
}
