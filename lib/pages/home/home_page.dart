import 'package:injectable/injectable.dart';
import '../../blocs/home/home.dart';
import '../../core/base/base.dart';
import '../../ui.dart';

@Named(Routes.home)
@Injectable(as: Widget)
class HomePage extends StatefulWidget {
  const HomePage() : super(key: null);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseUiState<HomePage, HomeBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorKit.primaryBackground,
      appBar: AppBar(title: const Text('home')),
    );
  }

  @override
  void commandListener(Command c) {

  }
}
