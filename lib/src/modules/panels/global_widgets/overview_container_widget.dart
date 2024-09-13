import '../../../core/app_export.dart';

class OverviewContainerWidget extends StatelessWidget {
  final Widget child;

  const OverviewContainerWidget({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppRatioSize.getRatioWidth() / 24,
          vertical: AppRatioSize.getRatioHeight() / 50),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
