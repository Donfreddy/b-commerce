import 'package:flutter/material.dart';
import '../utils/ScreenHeightAndWidth.dart';

class CustomButton extends StatefulWidget {
  final Function pressEvent;
  final buttonText;
  final Color buttonColor;
  final Color textColor;



  const CustomButton(
      {@required this.pressEvent,@required this.buttonText,@required this.buttonColor,@required this.textColor});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  Animation<double> _scale;

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context) / 1.2,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0)),
        onPressed: widget.pressEvent,
        color:  widget.buttonColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 14.0,
          ),
          child: Text(
            widget.buttonText,
            style: TextStyle(fontSize: 18.0,color: widget.textColor),
          ),
        ),
      ),
    );
  }

}
