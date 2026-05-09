part of 'aminities_bloc.dart';

@immutable
sealed class AminitiesState {}

final class AminitiesInitial extends AminitiesState {}

final class AminitiesLoadedState extends AminitiesState {
  final List<AminitiesEntity> aminities;

  AminitiesLoadedState(this.aminities);
}

final class AminitiesLoadingState extends AminitiesState {}

final class AminitiesErrorState extends AminitiesState {
  final String error;

  AminitiesErrorState(this.error);
}
