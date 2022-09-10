

import 'package:quizjets/export_files.dart';

class PopppinFont extends StatefulWidget {
  final text;
  final textSize;
  final textColor;
  final fontWeight;

  PopppinFont(
      {@required this.text,
      @required this.textSize,
      @required this.textColor,
      @required this.fontWeight});
  @override
  State<StatefulWidget> createState() => _PopppinFontState();
}

class _PopppinFontState extends State<PopppinFont> {
  @override
  Widget build(BuildContext context) => font();

  Widget font() => Text(
        widget.text,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: widget.textColor,
          fontFamily: Str.POPPINS,
          fontWeight: widget.fontWeight,
          fontSize: widget.textSize,
        ),
      );
}
