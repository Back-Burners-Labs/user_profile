import 'package:flutter/cupertino.dart';
import 'package:user_profile/src/core/app_export.dart';

class ScaleWidget extends StatefulWidget {
  final FixedExtentScrollController scaleController;
  final List<int> scaleIntList;
  final String scaleType;
  final void Function(int) onChange;

  const ScaleWidget(
      {super.key,
      required this.scaleController,
      required this.scaleIntList,
      required this.onChange,
      required this.scaleType});

  @override
  State<ScaleWidget> createState() => _ScaleWidgetState();
}

class _ScaleWidgetState extends State<ScaleWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppRatioSize.getRatioHeight() / 8,
      width: Get.width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            margin: EdgeInsets.only(
                bottom: AppRatioSize.getRatioHeight() / 44,
                left: AppRatioSize.getRatioWidth() / 16,
                right: AppRatioSize.getRatioWidth() / 16),
            decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.creamColor
                    : AppColor.black,
                borderRadius: BorderRadius.circular(12)),
            child: RotatedBox(
              quarterTurns: -1,
              child: ListWheelScrollView(
                controller: widget.scaleController,
                itemExtent: 70,
                physics: const FixedExtentScrollPhysics(),
                useMagnifier: true,
                magnification: 1.1,
                diameterRatio: 1.5,
                squeeze: 1.5,
                perspective: 0.003,
                overAndUnderCenterOpacity: 0.4,
                scrollBehavior: const CupertinoScrollBehavior(),
                onSelectedItemChanged: (index) {
                  setState(() {
                    widget.onChange(widget.scaleIntList[index]);
                  });
                },
                children: widget.scaleIntList.map((feet) {
                  return RotatedBox(
                    quarterTurns: 1,
                    child: Center(
                      child: Text.rich(
                        style: TextStyleX.body2(context).copyWith(
                          fontSize: 20,
                        ),
                        TextSpan(
                          children: [
                            TextSpan(text: "$feet"),
                            TextSpan(
                              text: ' ${widget.scaleType}'.tr,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Container(
              width: AppRatioSize.getRatioWidth() / 10,
              height: AppRatioSize.getRatioHeight() / 12,
              decoration: const BoxDecoration(),
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                AppIcon.pinIcon,
                color: AppColor.primary,
                fit: BoxFit.contain,
              )),
        ],
      ),
    );
  }
}
