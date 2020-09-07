import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final double size;
  final Color colors;

  Circle({
    Key key,
    @required this.size,
    @required this.colors,
  })  : assert(size != null && size > 0),
        assert(colors != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: this.colors,
      ),
    );
  }
}
