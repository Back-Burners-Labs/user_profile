import '../../../../core/app_export.dart';

class BackShadow extends StatelessWidget {
  const BackShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).brightness == Brightness.light
                    ? AppColor.blackPitch
                    : AppColor.blackPitch,
                Theme.of(context).brightness == Brightness.light
                    ? AppColor.blackPitch
                    : AppColor.blackPitch,
                AppColor.blackPitch.withOpacity(0.0),
              ],
              begin: const FractionalOffset(0.0, 0.9),
              end: const FractionalOffset(0.0, 0.0),
              stops: const [0.0, 0.25, 0.6],
            ),
          ),
        ),
      ],
    );
  }
}
