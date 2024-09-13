import '../app_export.dart';

class AppDivider extends StatelessWidget{
  final Color? color;
  final bool? disablePadding;

  const AppDivider({super.key,
    this.color=AppColor.white,
    this.disablePadding=false
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        disablePadding==true?Container():AppRatioSpaces.verticalSectionSpaceM(),
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 24),
            child: Divider(
              color: color!.withOpacity(0.6),
            )),
        disablePadding==true?Container():AppRatioSpaces.verticalSectionSpaceM(),
      ],
    );
  }



}