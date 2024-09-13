import '../app_export.dart';

const List<String> tabNameList = ["Tab1","Tab2","Tab3","Tab4"];
class AppSliverTab extends StatelessWidget{
  final TabController tabController;
  final List<String> tabNames;


  const AppSliverTab({super.key,
    required this.tabController,
    this.tabNames=tabNameList,
  });
  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 32),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Theme
                .of(context)
                .brightness == Brightness.light ? AppColor.white :AppColor.black,
            borderRadius: BorderRadius.circular(12)
        ),
        child: TabBar(
          padding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.zero,
          labelPadding: EdgeInsets.zero,
          controller: tabController,
          splashBorderRadius: BorderRadius.circular(Get.width),
          indicator: BoxDecoration(
              color: Theme
                  .of(context)
                  .brightness == Brightness.light ? AppColor.blackShade :AppColor.darkGrey,
              borderRadius: BorderRadius.circular(12)),
          tabs: [
            for(int index=0; index<tabNames.length;index++)
              Tab(
                iconMargin: EdgeInsets.zero,
                height: 40,
                child: Text(
                tabNames[index].tr,
                  textAlign: TextAlign.center,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(
                      color:  tabController.index==index? Theme
                          .of(context)
                          .brightness == Brightness.light ? AppColor.offWhite :AppColor.offWhite:
                      Theme
                          .of(context)
                          .brightness == Brightness.light ? AppColor.black :AppColor.darkGrey,
                      fontSize: AppTextSizes.titleText5()
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

}