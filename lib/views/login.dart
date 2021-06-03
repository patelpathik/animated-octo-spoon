import 'package:dogspath/route/routes.dart';
import 'package:dogspath/utils/size_config.dart';
import 'package:dogspath/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    TextStyle titleStyle = Theme.of(context).textTheme.headline6!.copyWith(
          color: AppTheme.loginLabelColor,
        );
    TextStyle subTitleStyle = Theme.of(context).textTheme.subtitle1!.copyWith(
          color: AppTheme.loginLabelColor,
        );
    return Scaffold(
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign In",
              style: titleStyle,
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 3),
            Text(
              "Sign in with your facebook account",
              style: subTitleStyle,
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 3),
            Container(
              alignment: Alignment.center,
              height: AppBar().preferredSize.height,
              margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.075,
              ),
              child: Material(
                color: Color(0xFF3B539A),
                elevation: 5,
                child: InkWell(
                  splashColor: Colors.white54,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.home);
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.facebookF,
                          color: Colors.white,
                        ),
                        SizedBox(width: AppBar().preferredSize.height / 2),
                        FittedBox(
                          child: Text(
                            "Sign In with Facebook",
                            style: subTitleStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
