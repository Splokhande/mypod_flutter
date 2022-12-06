import 'package:mypod_flutter/import_helper.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      width: 100.w,
      height: 100.h,
      child: Center(
        child: customText(msg: 'Splash Screen'),
      ),
    );
  }
}
