import '../app_export.dart';

BottomNavigationBarItem bottomNavItemX(BuildContext context,
    {required iconPath}) {
  return BottomNavigationBarItem(
    icon: Column(
      children: [
        Icon(
          Icons.fiber_manual_record_rounded,
          size: 10,
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.black,
        ),
        Container(
            margin: const EdgeInsets.only(top: 2),
            height: AppRatioSize.getRatioHeight() / 32,
            width: AppRatioSize.getRatioHeight() / 32,
            child: Image.asset(
              iconPath,
              color: AppColor.menuGrey,
              fit: BoxFit.fill,
            )),
      ],
    ), //Icon(Icons.home_rounded),
    label: '',
    activeIcon: Column(
      children: [
        const Icon(
          Icons.fiber_manual_record_rounded,
          size: 10,
        ),
        Container(
            margin: const EdgeInsets.only(top: 2),
            height: AppRatioSize.getRatioHeight() / 32,
            width: AppRatioSize.getRatioHeight() / 32,
            child: Image.asset(iconPath,
                color: AppColor.primary, fit: BoxFit.fill)),
      ],
    ),
  );
}
