import 'package:flutter/material.dart';

class StandardRaisedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;

  const StandardRaisedButton({Key key, this.child, this.onPressed, this.color,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      elevation: 10,
      padding: EdgeInsets.all(15),
      onPressed: this.onPressed,
      child: child,
    );
  }
}
