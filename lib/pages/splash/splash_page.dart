import '../../blocs/splash/splash.dart';
import '../../core/base/base.dart';
import '../../ui.dart';

class SplashPage extends StatefulWidget {

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BaseUiState<SplashPage, SplashBloc> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
          ),
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
              width: 144,
              height: 144,
              child: Assets.png.icBrand.image()),
        ),
      ),
    );
  }

  @override
  void commandListener(Command c) {
    if(c is SplashCommandNavLogin){
      pushAndRemoveUntil(Routes.home);
    }
  }
}
