import 'dart:async';
import 'dart:ui';

import '../app_export.dart';

class CountdownTimer extends StatefulWidget{
  final DateTime timeLeft;

  const CountdownTimer({super.key, required this.timeLeft});
  @override
  State<CountdownTimer> createState() => _CountdownTimerState();

}

class _CountdownTimerState extends State<CountdownTimer> {

  Timer? countdownTimer;
  Duration myDuration = const Duration(hours: 24,minutes: 60,seconds: 60);
  @override
  void initState() {
    myDuration = Duration(days:widget.timeLeft.day,hours: widget.timeLeft.hour,minutes: widget.timeLeft.minute,seconds: widget.timeLeft.second);
    startTimer();
    super.initState();
  }
  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
   if(mounted){
     setState(() {
       final seconds = myDuration.inSeconds - reduceSecondsBy;
       if (seconds < 0) {
         countdownTimer!.cancel();
       } else {
         myDuration = Duration(seconds: seconds);
       }
     });
   }
  }
  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    
    return Center(
        child: Column(
          children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(Get.width),
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: AppRatioSize.getRatioHeight() / 20,
            width: AppRatioSize.getRatioWidth() / 2.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    Get.width),
                border:Border.all(color: AppColor.white.withOpacity(0.6)),
                color: AppColor.white.withOpacity(
                    0.05)
            ),
            alignment: Alignment.center,
            child: Text(
              '${days=="01"?"":"${days}d "}${hours}h ${minutes}m ${seconds}s'
                  .tr,
              textAlign: TextAlign.center,
              style: TextStyleX.subHeading1(context).copyWith(
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                  fontSize: AppTextSizes.headerText2()
              ),
              maxLines: 1,
            ),
          ),
        ),
      ),
          ],
        ),
    );
  }
}