import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import '../app_export.dart';

class AppNetworkImage extends StatelessWidget {
  final String imagePath;
  final double height;
  final double width;
  final double boarderWidth;
  final double borderRadius;
  final bool? showBoarder;
  final Color? boarderColorLight;
  final Color? boarderColorDark;

  const AppNetworkImage({
    super.key,
    required this.imagePath,
    required this.height,
    required this.width,
    this.borderRadius = 1000,
    this.boarderWidth = 1,
    this.showBoarder = false,
    this.boarderColorLight = AppColor.grey,
    this.boarderColorDark = AppColor.grey,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
            color: Theme.of(context).brightness == Brightness.light
                ? boarderColorLight!
                : boarderColorDark!,
            width: showBoarder == true ? boarderWidth : 0),
        color: AppColor.lightGrey,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          imageUrl: imagePath,
          fit: BoxFit.cover,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: AppColor.grey.withOpacity(0.2),
            highlightColor: AppColor.lightGrey.withOpacity(0.4),
            child: Container(
              decoration: const BoxDecoration(
                color: AppColor.grey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Icon(
            Icons.image_not_supported_rounded,
            color: AppColor.grey.withOpacity(0.5),
            size: AppRatioSize.getRatioWidth() / 8,
          ),
        ),
      ),
    );
  }
}

class AppLocalImage extends StatelessWidget {
  final String imagePath;
  final double height;
  final double width;
  final double boarderWidth;
  final double borderRadius;
  final bool? showBoarder;
  final Color? boarderColorLight;
  final Color? boarderColorDark;

  const AppLocalImage({
    super.key,
    required this.imagePath,
    required this.height,
    required this.width,
    this.borderRadius = 1000,
    this.boarderWidth = 1,
    this.showBoarder = false,
    this.boarderColorLight = AppColor.grey,
    this.boarderColorDark = AppColor.grey,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
            color: Theme.of(context).brightness == Brightness.light
                ? boarderColorLight!
                : boarderColorDark!,
            width: showBoarder == true ? boarderWidth : 0),
        color: AppColor.lightGrey,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
