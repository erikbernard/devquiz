import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  const ResultPage({
    Key? key,
    required this.title,
    required this.length,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Text(
              "Parabéns!",
              style: AppTextStyles.heading40,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16,
            ),
            Text.rich(
              TextSpan(
                text: "Congrats",
                style: AppTextStyles.body,
                children: [
                  TextSpan(text: "\n$title", style: AppTextStyles.bodyBold),
                  TextSpan(
                    text: "\nwith $result out of $length hits.",
                    style: AppTextStyles.body,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 68),
              child: NextButtonWidget.purple(
                label: "Share",
                onTap: () {
                  Share.share(
                      'DevQuiz NLW#5 - Flutter: Quiz result: $title\nObtained: ${result / length}% utilization');
                },
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 68),
              child: NextButtonWidget.white(
                label: "Back to Start",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
