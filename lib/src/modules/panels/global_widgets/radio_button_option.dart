import '../../../core/app_export.dart';
import '../../../core/models/setting_option_model.dart';

class RadioButtonOption extends StatefulWidget {
  final String title;
  final List<OptionModel> _item;
  final bool? showDescription;
  final Function(OptionModel) onChanged;
  final double verticalMargin;
  const RadioButtonOption(this._item,
      {super.key,
      required this.onChanged,
      required this.title,
      this.showDescription,
      this.verticalMargin = 8});

  @override
  State<RadioButtonOption> createState() => _RadioButtonOptionState();
}

class _RadioButtonOptionState extends State<RadioButtonOption> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title == ""
              ? Container()
              : Text(
                  widget.title.tr,
                  style: TextStyleX.subHeading1(context),
                  maxLines: 1,
                ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: widget._item.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    for (var element in widget._item) {
                      element.isSelected = false;
                    }
                    widget._item[index].isSelected = true;
                    widget.onChanged(widget._item[index]);
                  });
                },
                child: RadioItem(
                    widget._item[index], widget.showDescription ?? false,
                    verticalMargin: widget.verticalMargin),
              );
            },
          ),
        ],
      ),
    );
  }
}
