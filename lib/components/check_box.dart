import 'package:flutter/material.dart';
import 'package:shop/constants.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({Key? key,required this.size,}) : super(key: key);
  final double size;

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: (){
          setState(() {
            state = !state;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.size*0.33),
              border: Border.all(
                color:
                Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .color!
                  .withOpacity(0.3)),
          color: state? primaryColor : Colors.transparent
          ),
          child: Center(
            child: Icon(
              Icons.done,
              size: widget.size*0.8,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
