import '../app_export.dart';

class AppExpendableWidget extends StatefulWidget{
  final String sectionTitle;
  final Widget child;
  final bool? defaultExpanded;

  const AppExpendableWidget({super.key,
    required this.sectionTitle, required this.child,
    this.defaultExpanded
  });

  @override
  State<AppExpendableWidget> createState() => _AppExpendableWidgetState();
}

class _AppExpendableWidgetState extends State<AppExpendableWidget> {
  bool _isExpanded=false;


  @override
  void initState() {
    _isExpanded=widget.defaultExpanded??false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        GestureDetector(
          onTap: (){
            setState(() {
              _isExpanded=!_isExpanded;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppSectionTitle(title: widget.sectionTitle, disableDefaultHPadding: true),
              Icon(_isExpanded?Icons.arrow_drop_up_rounded:Icons.arrow_drop_down_rounded,color: Theme.of(context).brightness==Brightness.light?AppColor.blackShade:AppColor.primary,)

            ],
          ),
        ),
        const SizedBox(height: 12,),
        _isExpanded?widget.child:Container()
      ],
    );
  }
}