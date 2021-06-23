import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/aap_text_styles.dart';
import 'package:payflow/shared/widgets/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.36,
              color: AppColors.primary,
            ),
            _personImage(),
            _bottomWidgets(),
          ],
        ),
      ),
    );
  }

  Widget _personImage() {
    return Positioned(
        top: 50,
        left: 0,
        right: 0,
        child: Image.asset(
          AppImages.person,
          width: 208,
          height: 373,
        ));
  }

  Widget _bottomWidgets() {
    return Positioned(
      bottom: size.height * 0.03,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Image.asset(AppImages.logomini),
          Padding(
            padding: EdgeInsets.only(top: 30, left: 70, right: 70),
            child: Text(
              "Organize seus boletos em um só lugar",
              textAlign: TextAlign.center,
              style: AppTextStyles.titleHome,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 40),
            child: SocialLoginButton(
              onTap: () {
                print('Clicou?');
              },
            ),
          ),
        ],
      ),
    );
  }
}
