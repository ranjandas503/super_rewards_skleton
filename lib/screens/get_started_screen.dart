import '../utils/exporter.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: colorSplashBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          verticalDirection: VerticalDirection.down,
          children: [
            Image.asset(imgSplashLogo),
            const Text(strWelcome),
            createDefaultElevatedButton(context, strGetStarted, () {
              popAndPushNamed(context, loginScreen);
            }),
          ],
        ),
      ),
    );
  }
}
