import 'package:flutter/material.dart' hide Page;


/// 搜索框
class SearchInputField extends StatefulWidget {
  final String? hintText;
  final IconData? icon;
  final ValueChanged<String>? onChanged;

  final TextInputType? textInputType;

  final FocusNode focusNode;

  final TextEditingController? textFieldContainer;

  final Function? clearInput;

  final VoidCallback? onFieldSubmitted;

  const SearchInputField({
    Key? key,
    this.hintText,
    this.icon,
    this.onChanged,
    this.textInputType,
    required this.focusNode,
    this.clearInput,
    this.textFieldContainer,
    this.onFieldSubmitted
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInputField> {

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return InputTextFieldContainer(
        focusNode: widget.focusNode,
        child: Stack(
          children: [
            // 可隐藏的icon
            Container(
              margin: EdgeInsets.only(top: 6 ,bottom: 6),
              alignment: Alignment.centerLeft,
              child: _isHiddenIconAndHintText(widget.focusNode.hasFocus),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(width: 20,),
                Expanded(child: TextField(
                  onSubmitted: (String value){

                  },

                  autofocus: false,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                  onChanged: widget.onChanged,
                  keyboardType: widget.textInputType,
                  controller: widget.textFieldContainer,
                  focusNode: widget.focusNode,
                  decoration: InputDecoration(
                      hintStyle:
                      const TextStyle(fontSize: 15, color: Colors.grey),
                      border: InputBorder.none, // 下划线隐藏
                      suffixIcon: _showDelIcon()),
                ))
              ],
            ),
          ],
        ));
  }

  _isHiddenIconAndHintText(bool hasFocus) {
    if(!hasFocus) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.search , size: 17,),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(widget.hintText ?? '' , style: TextStyle(fontSize: 15, color: Colors.grey),),
          )
        ],
      );
    }
    return Container();
  }

  _showDelIcon() {
    if (widget.textFieldContainer == null)
      return Container(
        width: 1,
      );
    return widget.textFieldContainer!.text.trim().isEmpty
        ? Container(
      width: 1,
    )
        : GestureDetector(
      onTap: () {
        if (widget.clearInput != null) {
          widget.focusNode.unfocus();
          widget.clearInput!();
        }
      },
      child: Container(
        child: const Icon(Icons.cancel , size: 17,),
      ),
    );
  }
}


class InputTextFieldContainer extends StatelessWidget {
  final Widget? child;

  final FocusNode? focusNode;

  final double height;

  InputTextFieldContainer({
    Key? key,
    this.child,
    this.focusNode,
    this.height= 46,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      height: height,
      padding: const EdgeInsets.only(left: 14, right: 6 ),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0, color: _borderColor()),
      ),
      child: child,
    );
  }

  _borderColor() {
    if(focusNode == null) return const Color(0xFFECECEC);;
    if(focusNode!.hasFocus) return Color(0xff29A0F2);
    return const Color(0xFFECECEC);
  }
}