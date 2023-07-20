import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:untitled3/Repository/produt_repo.dart';
import 'package:untitled3/Repository/user_repo.dart';
import 'package:untitled3/bloc/productbloc_bloc.dart';
import 'package:untitled3/cubit/users_cubit.dart';
import 'package:untitled3/screens/home.dart';

import 'Bloc_Observer/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
      MultiRepositoryProvider(
          providers: [
            RepositoryProvider(create: (context) => UserRepo()),
            RepositoryProvider(


              create: (context) => ProductsRepo(),)
          ],
          child: const MyApp()

      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider (
      providers: [
        BlocProvider(
          create: (context) => ProductblocBloc(ProductsRepo()),
        ),
        BlocProvider(
          create: (context) => UsersCubit(UserRepo()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
        builder: EasyLoading.init(),
      ),
    );
  }
}

