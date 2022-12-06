import 'package:mypod_flutter/import_helper.dart';

double defaultFontSize = 12.sp;
double maxWidth = 0.9.w;
FontWeight defaultFontWeight = FontWeight.normal;
TextOverflow defaultOverFlow = TextOverflow.ellipsis;

customText({
  required String msg,
  double? fontSize,
  double? width,
  Color? color,
  TextOverflow? overFlow,
  FontWeight? fontWeight,
  double? padding,
}) {
  return Padding(
    padding: EdgeInsets.all(padding ?? 4.0),
    child: Text(
      msg,
      style: TextStyle(
        fontSize: fontSize ?? defaultFontSize,
        color: color ?? kTitleColor,
        overflow: overFlow ?? defaultOverFlow,
        fontWeight: fontWeight ?? defaultFontWeight,
      ),
    ),
  );
}
