import 'package:user_profile/src/core/constants/app_fonts.dart';

import '../models/setting_option_model.dart';
import '../app_export.dart';

class RadioItem extends StatelessWidget {
  final OptionModel _item;
  final bool showDescription;
  final double verticalMargin;
  const RadioItem(this._item,this.showDescription,{super.key, this.verticalMargin=8});
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: AppPaddings.radioOption(),
      decoration: BoxDecoration(
          color: Theme.of(context).brightness==Brightness.light?
          AppColor.black.withOpacity(0.1):AppColor.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8)
      ),
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      child:  Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           Icon(_item.isSelected?Icons.radio_button_checked_rounded:Icons.radio_button_off_rounded,
           size: AppRatioSize.getRatioWidth()/22,
           color: _item.isSelected?AppColor.primary:AppColor.grey),
           Expanded(
             child: Container(
              margin:  const EdgeInsets.only(left: 10.0),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _item.text.tr,
                    style: TextStyleX.subHeading3(context).copyWith(fontFamily: AppFonts.buttons),
                    maxLines: 3,
                  ),
                  (_item.description!="")?
                      const SizedBox(height: 2,):Container(),
                  (_item.description!="" && showDescription==true)?Text(
                    _item.description.tr,
                    maxLines: 3,
                    style: TextStyleX.body1(context).copyWith(fontFamily: AppFonts.buttons),
                  ):Container(),
                ],
              ),
          ),
           )
        ],
      ),
    );
  }
}
