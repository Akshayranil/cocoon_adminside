import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoon_admin/features/aminities/data/datasource/aminities_data_source.dart';
import 'package:cocoon_admin/features/aminities/data/repository/aminity_repository_implementation.dart';
import 'package:cocoon_admin/features/aminities/domain/usecase/aminities_use_case.dart';
import 'package:cocoon_admin/features/aminities/presentation/bloc/aminities/aminities_bloc.dart';
import 'package:cocoon_admin/features/auth/data/datasource/auth_datasource.dart';
import 'package:cocoon_admin/features/auth/data/repository/data_implementation.dart';
import 'package:cocoon_admin/features/auth/domain/usecase/auth_usecase.dart';
import 'package:cocoon_admin/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:cocoon_admin/features/auth/presentation/bloc/bloc/auth_event.dart';
import 'package:cocoon_admin/features/auth/presentation/ui/login_screen.dart';
import 'package:cocoon_admin/features/hotels/data/datasource/accepted_hotel_datasource.dart';
import 'package:cocoon_admin/features/hotels/data/repository/accepted_repository_implementation.dart';
import 'package:cocoon_admin/features/hotels/domain/usecase/accepted_hotel_usecase.dart';
import 'package:cocoon_admin/features/hotels/presentation/bloc/accepted_hotel_bloc.dart';
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
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // for hotels
  final firestore = HotelRemoteDataSource(FirebaseFirestore.instance);
  final repository = HotelRepositoryImpl(firestore);
  final getHotelsUseCase = GetHotelsUseCase(repository);
  final updateHotelStatusUseCase = UpdateHotelStatusUseCase(repository);

  //for aminities
  final aminitiesdatasource = AminitiesDataSource(FirebaseFirestore.instance);
  final aminityrepository = AminityRepositoryImplementation(
    aminitiesdatasource,
  );
  final getAllAminityUsecase = GetAllAminitiesUseCase(aminityrepository);
  final addAminiyUsecase = AddAminitiesUseCase(aminityrepository);
  final deleteAminityUsecase = DeleteAminitiesUseCase(aminityrepository);

  //for acceptedhotels

  final acceptedhoteldatasource = AcceptedHotelDatasource(
    FirebaseFirestore.instance,
  );
  final acceptedhotelrepository = AcceptedRepositoryImplementation(
    acceptedhoteldatasource,
  );
  final acceptedhotelusecase = AcceptedHotelUsecase(acceptedhotelrepository);

  //auth
  final local = AuthLocalDataSource();
    final repo = AuthRepositoryImpl(local);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavrailCubit()),
        BlocProvider(
          create: (_) =>
              PermissionBloc(getHotelsUseCase, updateHotelStatusUseCase)
                ..add(LoadHotels()),
        ),
        BlocProvider(
          create: (_) => AminitiesBloc(
            getAllAminityUsecase,
            addAminiyUsecase,
            deleteAminityUsecase,
          ),
        ),
        BlocProvider(create: (_)=>AcceptedHotelBloc(acceptedhotelusecase)..add(LoadAcceptedHotels())),

        BlocProvider(create: (_)=> AuthBloc(LoginUseCase(repo), LogoutUseCase(repo), CheckLoginUseCase(repo),)..add(CheckAuthEvent()))
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}
