import 'package:bloc/bloc.dart';
import 'package:cocoon_admin/features/aminities/domain/entity/aminities_entity.dart';
import 'package:cocoon_admin/features/aminities/domain/usecase/aminities_use_case.dart';
import 'package:cocoon_admin/features/permission/domain/usecase/permission_usecases.dart';
import 'package:meta/meta.dart';

part 'aminities_event.dart';
part 'aminities_state.dart';

class AminitiesBloc extends Bloc<AminitiesEvent, AminitiesState> {
  final AddAminitiesUseCase addAminitiesUseCase;
  final DeleteAminitiesUseCase deleteAminitiesUseCase;
  final GetAllAminitiesUseCase getAllAminitiesUseCase;
   AminitiesBloc(
    this.getAllAminitiesUseCase,
    this.addAminitiesUseCase,
    this.deleteAminitiesUseCase,
  ) : super(AminitiesInitial()) {
    on<AminitiesLoadedEvent>((event, emit) async {
      emit(AminitiesLoadingState());
      try {
        final allaminities = await getAllAminitiesUseCase();
        emit(AminitiesLoadedState(allaminities));
      } catch (e) {
        emit(AminitiesErrorState(e.toString()));
      }
    });

    on<AddAminitiesEvent>((event, emit) async {
      try {
        await addAminitiesUseCase(event.name);
        final allaminities = await getAllAminitiesUseCase();
        emit(AminitiesLoadedState(allaminities));
      } catch (e) {
        emit(AminitiesErrorState(e.toString()));
      }
    });

    on<DeleteAminitiesEvent>((event, emit) async {
      try {
        await deleteAminitiesUseCase(event.id);
        final allaminities = await getAllAminitiesUseCase();
        emit(AminitiesLoadedState(allaminities));
      } catch (e) {
        emit(AminitiesErrorState(e.toString()));
      }
    });
  }
}
