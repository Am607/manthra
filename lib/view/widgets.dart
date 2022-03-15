import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart' as a;
import 'package:nb_utils/nb_utils.dart';

InputDecoration textInputStyle(
    {required BuildContext context,
    bool? noneed = false,
    String? label,
    bool isMandatory = false,
    String? text,
    String prefixText = '',
    String? hintText}) {
  return InputDecoration(
    contentPadding: EdgeInsets.all(8),
    fillColor: Colors.grey.shade300.withOpacity(0.5),
    filled: false,
    labelStyle: primaryTextStyle(size: 16, color: textPrimaryBlackColor),
    hintStyle: TextStyle(height: 1.5),
    hintText: hintText,
    prefixText: prefixText,
    prefixStyle: primaryTextStyle(),
    alignLabelWithHint: true,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    labelText: text != null ? text : '$label${isMandatory ? '*' : ''}',
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(a.defaultRadius),
      borderSide: BorderSide(color: Colors.red, width: 1.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(a.defaultRadius),
      borderSide: BorderSide(color: Colors.red, width: 1.0),
    ),
    errorMaxLines: 2,
    errorStyle: primaryTextStyle(color: Colors.red, size: 12),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(a.defaultRadius),
      borderSide: BorderSide(width: 1.0, color: context.dividerColor),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(a.defaultRadius),
      borderSide: BorderSide(width: 1.0, color: context.dividerColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(a.defaultRadius),
      borderSide: BorderSide(color: context.dividerColor, width: 1.0),
    ),
  );
}

TextStyle boldTextStyle({
  int? size,
  Color? color,
  FontWeight? weight,
  String? fontFamily,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble() : textBoldSizeGlobal,
    color: color ?? textPrimaryColorGlobal,
    fontWeight: weight ?? fontWeightBoldGlobal,
    fontFamily: fontFamily ?? fontFamilyBoldGlobal,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    backgroundColor: backgroundColor,
  );
}

// Primary Text Style
TextStyle primaryTextStyle({
  int? size,
  Color? color,
  FontWeight? weight,
  String? fontFamily,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble() : textPrimarySizeGlobal,
    color: color ?? textPrimaryColorGlobal,
    fontWeight: weight ?? fontWeightPrimaryGlobal,
    fontFamily: fontFamily ?? fontFamilyPrimaryGlobal,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    backgroundColor: backgroundColor,
  );
}

// Secondary Text Style
TextStyle secondaryTextStyle({
  int? size,
  Color? color,
  FontWeight? weight,
  String? fontFamily,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble() : textSecondarySizeGlobal,
    color: color ?? textSecondaryColorGlobal,
    fontWeight: weight ?? fontWeightSecondaryGlobal,
    fontFamily: fontFamily ?? fontFamilySecondaryGlobal,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    backgroundColor: backgroundColor,
  );
}

//Color primaryColor = Colors.green;
Color primaryColor = Color(0xff3A96BE);
//Color primaryColor = Color(0xFF4974dc);
Color primaryDarkColor = Color(0xff0a0909);
Color appPrimaryColor = primaryColor;
const appSecondaryColor = Color(0xFFf68685);
const scaffoldDarkColors = Color(0xff0a0909);
const cardDarkColors = Color(0xff232121);
const cardSelectedColor = Color(0xff3e3b3b);
Color selectedColor = getColorFromHex('#e6ecfa');
const textPrimaryBlackColor = Color(0xFF000000);
const textSecondaryBlackColor = Color(0xFF575454);

//Error Color
const errorBackGroundColor = Color(0xFFFFCDD2);
const errorTextColor = Colors.red;

//Error Color
const successBackGroundColor = Color(0xFFDCEDC8);
const successTextColor = Colors.green;

const greenbackGroundColor = Colors.green;

const textPrimaryWhiteColor = Color(0xFFF0F8FF);
const textSecondaryWhiteColor = Color(0xFFc7daeb);

class AppBigButton extends StatelessWidget {
  final void Function() onPressed;
  final String name;

  const AppBigButton({Key? key, required this.name, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: appPrimaryColor),
        child: Center(
          child: Text(
            '$name',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

showtoast(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('$message')));
}
