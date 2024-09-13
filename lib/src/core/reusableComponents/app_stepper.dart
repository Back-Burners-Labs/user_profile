import '../app_export.dart';

class AppStepper extends StatelessWidget{
  final int currentIndex;
  final List<String> stepNames;

  const AppStepper(
  {super.key,
    required this.currentIndex,
    required this.stepNames
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return Row(
                  children: [
                    Container(
                      height: 2,
                      width: AppRatioSize.getRatioWidth()/8,
                      color: currentIndex>=index|| (currentIndex-1)>=index?
                      AppColor.secondaryGreyColor: AppColor.lightGrey,
                    ),
                    Icon(
                      currentIndex==index?Icons.fiber_manual_record_outlined
                          :
                      Icons.fiber_manual_record_rounded,
                      color:
                          currentIndex>=index|| (currentIndex-1)>=index?
                      AppColor.secondaryGreyColor: AppColor.lightGrey,),
                    Container(
                      height: 2,
                      width: AppRatioSize.getRatioWidth()/(index==2?8:12),
                      color: (currentIndex-1)>=index?
                      AppColor.secondaryGreyColor: AppColor.lightGrey,

                    ),
                  ],
                );
              }),
        ),
        SizedBox(
          height: 40,
          child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return Row(
                  children: [
                    SizedBox(
                      height: 2,
                      width: AppRatioSize.getRatioWidth()/9,
                    ),
                    Text(
                      stepNames[index],
                      style: TextStyleX.subHeading2(context),
                    ),
                    SizedBox(
                      height: 2,
                      width: AppRatioSize.getRatioWidth()/(index==2?10:22),

                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }

}