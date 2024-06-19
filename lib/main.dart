import 'package:e_book/core/injection/injection_dependencies.dart';
import 'package:e_book/features/core_feature/domain/usecases/volume_item/get_volume_item_uc.dart';
import 'package:e_book/features/core_feature/domain/usecases/volumes/get_search_volumes_by_text.dart';
import 'package:e_book/features/core_feature/domain/usecases/volumes/get_search_volumes_by_text_param.dart';
import 'package:e_book/features/core_feature/presentation/blocs/nav/nav_cubit.dart';
import 'package:e_book/features/core_feature/presentation/blocs/search_volumes/search_volumes_bloc.dart';
import 'package:e_book/features/core_feature/presentation/blocs/volume_detail/volume_detail_bloc.dart';
import 'package:e_book/features/core_feature/presentation/pages/main_page.dart';
import 'package:e_book/features/core_feature/presentation/pages/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavCubit(),
        ),
        BlocProvider(
          create: (context) => SearchVolumeBloc(
              getSearchVolumeByTextParamUC:
                  sl.get<GetSearchVolumeByTextParamUC>(),
              getSearchVolumeByTextUC: sl.get<GetSearchVolumeByTextUC>()),
        ),
        BlocProvider(
          create: (context) => VolumeDetailBloc(
              getVolumeItemUseCase: sl.get<GetVolumeItemUseCase>()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MainView(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
