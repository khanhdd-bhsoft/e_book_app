import 'package:e_book/core/app/root_page.dart';
import 'package:e_book/core/constants/app_themes.dart';
import 'package:e_book/core/constants/list_category.dart';
import 'package:e_book/core/injection/injection_dependencies.dart';
import 'package:e_book/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:e_book/features/core_feature/domain/usecases/themes/change_theme_uc.dart';
import 'package:e_book/features/core_feature/domain/usecases/themes/get_theme_uc.dart';
import 'package:e_book/features/core_feature/domain/usecases/volume_item/get_volume_item_uc.dart';
import 'package:e_book/features/core_feature/domain/usecases/volumes/get_search_volumes_by_text.dart';
import 'package:e_book/features/core_feature/domain/usecases/volumes/get_search_volumes_by_text_param.dart';
import 'package:e_book/features/core_feature/presentation/blocs/list_default_category/default_categories_bloc.dart';
import 'package:e_book/features/core_feature/presentation/blocs/list_default_category/default_categories_event.dart';
import 'package:e_book/features/core_feature/presentation/blocs/nav/nav_cubit.dart';
import 'package:e_book/features/core_feature/presentation/blocs/search_volumes/search_volumes_bloc.dart';
import 'package:e_book/features/core_feature/presentation/blocs/themes/theme_cubit.dart';
import 'package:e_book/features/core_feature/presentation/blocs/volume_detail/volume_detail_bloc.dart';
import 'package:e_book/features/core_feature/presentation/blocs/volumes_by_category/volumes_by_category_bloc.dart';
import 'package:e_book/features/core_feature/presentation/pages/main_page.dart';
import 'package:e_book/features/core_feature/presentation/pages/main_view.dart';
import 'package:e_book/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await initDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          create: (context) => ThemeCubit(
              changeThemeUseCase: sl.get<ChangeThemeUseCase>(),
              getThemeUseCase: sl.get<GetThemeUseCase>()),
        ),
        BlocProvider(
          create: (context) => sl.get<AuthBloc>(),
        ),
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
          create: (context) => sl.get<DefaultCategoriesBloc>()
            ..add(DefaultCategoriesFetch(listData: defaultListCategory)),
        ),
        BlocProvider(
          create: (context) => VolumeDetailBloc(
              getVolumeItemUseCase: sl.get<GetVolumeItemUseCase>()),
        ),
        BlocProvider(
          create: (context) => sl.get<VolumesByCategoryBloc>(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, bool>(builder: (context, state) {
        print("Theme is: ${state}");
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: !state ? AppTheme.lightThemes : AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          darkTheme: AppTheme.darkTheme,
          home: RootPage(),
        );
      }),
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
