import 'package:mypod_flutter/import_helper.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: const BoxDecoration(color: kPrimaryColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SignInWithGoogleButton(
            redirectUri: Uri.parse('https://004d-103-179-2-18.ngrok.io/'),
            caller: client.modules.auth,
            onSignedIn: () {
              router.goNamed(splashscreen);
            },
            onFailure: () {},
          ),
          SizedBox(height: 2.h),
          SignInWithAppleButton(
            caller: client.modules.auth,
            onSignedIn: () {},
            onFailure: () {},
          )
        ],
      ),
    );
  }
}
