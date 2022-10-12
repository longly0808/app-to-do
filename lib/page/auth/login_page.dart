import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/dependencies.dart';
import 'package:to_do_list/service/auth_service.dart';
import '../../style/style.dart';
import '../../widget/commons/custom_button.dart';
import '../../widget/commons/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: size.width,
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(
              Dimens.size16,
            ),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.arrow_back_ios,
                color: MyColors.blackColor,
                size: Dimens.size20,
              ),
            ),
          ),
          // Text(tr('to_do_list'), style: theme.textTheme.headline1,)
          Padding(
            padding: const EdgeInsets.all(Dimens.size16),
            child: Image.asset(
              'assets/images/logo_intro.png',
              fit: BoxFit.cover,
              color: theme.colorScheme.primary,
              height: size.height / 3,
            ),
          ),
          const Padding(
              padding: EdgeInsets.all(Dimens.size16),
              child: CustomTextField(
                isTypePassword: false,
                hintText: 'input user name',
              )),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.size16),
            child: CustomTextField(
              isTypePassword: true,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(
              Dimens.size16,
            ),
            width: size.width,
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {},
              child: Text(
                'forgot password? ',
                style: theme.textTheme.headline5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Dimens.size16),
            child: CustomButton(
              onclick: () {
                var service = AppDependencies.injector.get<AuthService>();
                service.LoginAuthentication();


              },
              text: tr('login'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.size16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tr('text_signup'),
                  style: theme.textTheme.headline5,
                ),
                const SizedBox(width: Dimens.size8),
                Flexible(
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      tr('signup'),
                      style: theme.textTheme.headline5!
                          .copyWith(color: theme.colorScheme.error),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
