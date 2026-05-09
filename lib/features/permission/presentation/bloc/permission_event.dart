part of 'permission_bloc.dart';


sealed class PermissionEvent {}

class LoadHotels extends PermissionEvent{}

class UpdateHotelStatus extends PermissionEvent {
  final String hotelId;
  final String status;

  UpdateHotelStatus({required this.hotelId, required this.status});
}