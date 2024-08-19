import 'package:e_Chow/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key,
    required this.text});
  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}
class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;

  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight/5.63;

  @override
  void initState(){
    super.initState();
    //if the length is more it will surpass the height
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }else{
      firstHalf=widget.text;
      secondHalf="";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //if second half is empty just show first only
      child:secondHalf.isEmpty?SmallText(color: AppColors.paraColor,text:firstHalf, size: Dimensions.font16,):
      Column(
        children: [
          //height is like line spacing
          SmallText(height: 1.8,color: AppColors.paraColor,text:hiddenText?(firstHalf+"..."):(firstHalf+secondHalf)),
          InkWell(
            onTap: (){
              //set state is used for triggering withdraw
              setState(() {
                //based on the bool, as it's, here will be false
                hiddenText=!hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: "Show more",size: Dimensions.font16,color: AppColors.mainColor,),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up, color: AppColors.mainColor,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
