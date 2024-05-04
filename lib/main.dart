import 'package:deyarakapp/Featurs/Home/data/repos/home_repo_implementation.dart';
import 'package:deyarakapp/Featurs/Home/presentation/manager/apartment_cubit/apartment_cubit_cubit.dart';
import 'package:deyarakapp/Featurs/Home/presentation/manager/home_properties_cubit/home_properties_cubit.dart';
import 'package:deyarakapp/Featurs/Home_Map/data/repos/maprepoimp.dart';
import 'package:deyarakapp/Featurs/Home_Map/presentation/manger/cubit/mapcubit_cubit.dart';
import 'package:deyarakapp/core/utils/router.dart';
import 'package:deyarakapp/core/utils/service_locator.dart';
import 'package:deyarakapp/theme/themeprovider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'controllers/sharedPrefrenceController.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalSharedPreferences.init();
  setupServiceLocator();
  runApp(
    ChangeNotifierProvider(
        create: (context) => ThemeProvide(), child: const DeyarakApp()),
  );
}

class DeyarakApp extends StatelessWidget {
  const DeyarakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomePropertiesCubit(getIt.get<HomeRepoImpl>())
            ..fetchHomeProperties(),
        ),
        BlocProvider(
          create: (context) => ApartmentCubitCubit(getIt.get<HomeRepoImpl>())
            ..fetchApartmentProperties(),
        ),
        BlocProvider(
          create: (context) =>
              MapCubit(getIt.get<maprepoimp>())..getpropritylocation(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvide>(context).themedata,
      ),
    );
  }
}
