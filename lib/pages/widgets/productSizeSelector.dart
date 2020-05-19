import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final List selectedsize = [];

class SizeSelector extends StatefulWidget {
  final List<String> sizes;
  SizeSelector({@required this.sizes});
  @override
  _SizeSelectorState createState() => new _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  int currentColorIndex = -1;
  bool isSelected ;

  List<Widget> SizeSelector() {
    List<Widget> sizeItemList = List();

    for (int i = 0; i < widget.sizes.length; i++) {
      isSelected = currentColorIndex == i;
      sizeItemList.add(sizeItem(
          size: widget.sizes[i],
          isSelected: isSelected,
          onTap: () {
            setState(() {
              currentColorIndex = i;
              selectedsize.clear();
              selectedsize.add(widget.sizes[i]);
            });
            print(selectedsize);
          }));
    }
    return sizeItemList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: SizeSelector(),
    );
  }

  Widget sizeItem({String size, bool isSelected, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Container(
          width: ScreenUtil().setWidth(75),
          height: ScreenUtil().setHeight(75),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.white : Colors.transparent,
              width: ScreenUtil().setWidth(8),
            ),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(0, 5),
                      blurRadius: 5,
                    )
                  ]),
                  child: Center(child: Text(size,style: TextStyle(color:Colors.white),)),
            ),
          ),
        ),
      ),
    );
  }
}