

import 'package:quizjets/export_files.dart';

class PopppinFont2 extends StatefulWidget {
  final text;
  final textSize;
  final textColor;
  final fontWeight;

  PopppinFont2(
      {@required this.text,
      @required this.textSize,
      @required this.textColor,
      @required this.fontWeight});
  @override
  State<StatefulWidget> createState() => _PopppinFont2State();
}

class _PopppinFont2State extends State<PopppinFont2> {
  @override
  Widget build(BuildContext context) => font();

  Widget font() => Text(
        widget.text,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: widget.textColor,
          fontFamily: Str.POPPINS,
          fontWeight: widget.fontWeight,
          letterSpacing: .7,
          fontSize: widget.textSize,
        ),
      );
}
