import '../app_export.dart';

class AppContainerWidget extends StatelessWidget {
  final Widget child;
  final bool disableDefaultHPadding;
  final bool disableDefaultVPadding;
  final double shadowOpacity;
  final double? borderRadius;

  const AppContainerWidget(
      {super.key,
      required this.child,
      this.disableDefaultHPadding = false,
      this.disableDefaultVPadding = false,
      this.shadowOpacity = 0.07,
      this.borderRadius});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal:
            disableDefaultHPadding ? 0 : AppRatioSize.getRatioWidth() / 44,
        vertical:
            disableDefaultVPadding ? 0 : AppRatioSize.getRatioWidth() / 44,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColor.blackShade.withOpacity(shadowOpacity)
                : AppColor.white.withOpacity(shadowOpacity),
            spreadRadius: 1.5,
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: child,
    );
  }
}
