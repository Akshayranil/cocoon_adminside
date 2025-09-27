import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoon_admin/features/navigation/presentation/bloc/cubit/navrail_cubit.dart';
import 'package:cocoon_admin/features/navigation/presentation/pages/main_page.dart';
import 'package:cocoon_admin/features/permission/data/datasource/premission_datasource.dart';
import 'package:cocoon_admin/features/permission/data/repository/permission_repoimplementation.dart';
import 'package:cocoon_admin/features/permission/domain/usecase/permission_usecases.dart';
import 'package:cocoon_admin/features/permission/presentation/bloc/permission_bloc.dart';
import 'package:cocoon_admin/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  final firestore = HotelRemoteDataSource(FirebaseFirestore.instance);
  final repository = HotelRepositoryImpl(firestore);
  final useCase = GetHotelsUseCase(repository);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavrailCubit()),
        BlocProvider(create: (_) => PermissionBloc(useCase)..add(LoadHotels())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainPage());
  }
}
