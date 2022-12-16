import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smatch_managment/features/login/app_colors.dart';
import 'package:smatch_managment/features/login/app_styles.dart';
import 'package:smatch_managment/features/login/responsive_widget.dart';

class RegisterSelect extends StatelessWidget {
  const RegisterSelect({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: Form(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              child: Column(
                children: [
                  SizedBox(height: height * 0.02),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Smatch Business",
                          style: ralewayStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainBlueColor,
                            fontSize: 40.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: ResponsiveWidget.isSmallScreen(context)
                          ? height * 0.032
                          : height * 0.12,
                      vertical: ResponsiveWidget.isSmallScreen(context)
                          ? height * 0.032
                          : height * 0.032,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveWidget.isSmallScreen(context)
                          ? height * 0.032
                          : height * 0.12,
                      vertical: ResponsiveWidget.isSmallScreen(context)
                          ? height * 0.032
                          : height * 0.12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 20.0,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Je suis",
                          textAlign: TextAlign.center,
                          style: ralewayStyle.copyWith(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: height * 0.05),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/independent.svg",
                                  width: 150,
                                  height: 150,
                                ),
                                SizedBox(height: width * 0.06),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      context.go('/register/independent');
                                    },
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: Ink(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 70.0, vertical: 18.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: AppColors.mainBlueColor,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Indépandant',
                                          style: ralewayStyle.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.whiteColor,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: width * 0.06),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/filiale.svg",
                                  width: 150,
                                  height: 150,
                                ),
                                SizedBox(height: width * 0.06),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      context.go('/register/filiale');
                                    },
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: Ink(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 70.0, vertical: 18.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: AppColors.mainBlueColor,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Sous filliale",
                                          style: ralewayStyle.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.whiteColor,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
