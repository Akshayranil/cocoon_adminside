part of 'permission_bloc.dart';

@immutable
sealed class PermissionState {}

final class PermissionInitial extends PermissionState {}

final class PermissionLoading extends PermissionState {}

final class PermissionLoaded extends PermissionState {
  final List<HotelEntity> hotels;

  PermissionLoaded(this.hotels);
}

final class PermissionError extends PermissionState {
  final String error;

  PermissionError(this.error);
}
