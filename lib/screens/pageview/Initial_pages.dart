import 'package:eslami/core/constant/app_assets.dart';
import 'package:eslami/core/theme/app_colors.dart';
import 'package:eslami/screens/pageview/category_data.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../layout/layout_screen.dart';

class InitialPages extends StatefulWidget {
  static const String routeName = 'InitialPages';

  const InitialPages({super.key});

  @override
  State<InitialPages> createState() => _InitialPagesState();
}

class _InitialPagesState extends State<InitialPages> {
  final PageController _controller = PageController();
  String buttonText = "Next";

  void _onPageChanged(int index) {
    setState(() {
      if (index == Category.categoryData.length - 1) {
        buttonText = "Finish";
      } else {
        buttonText = "Next";
      }
    });
  }

  void _onNextPressed() {
    if (buttonText == "Finish") {
      Navigator.pushNamed(context, LayoutScreen.routeName);
    } else {
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.dark,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(AppAssets.islamiMosquelogo),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              child: PageView.builder(
                controller: _controller,
                itemCount: Category.categoryData.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) {
                  final category = Category.categoryData[index];
                  return Wrap(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(category.image),
                          Text(
                            category.title,
                            style: TextStyle(
                                color: AppColors.coffee,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(category.desc,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors.coffee,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (_controller.page!.toInt() > 0) {
                        _controller.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.coffee),
                    ),
                  ),
                  Spacer(),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: Category.categoryData.length,
                    effect: SwapEffect(
                      activeDotColor: AppColors.coffee,
                      dotHeight: 7,
                      dotWidth: 7,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: _onNextPressed,
                    child: Text(
                      buttonText,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.coffee),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
