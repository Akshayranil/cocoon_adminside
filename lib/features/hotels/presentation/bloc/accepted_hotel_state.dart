part of 'accepted_hotel_bloc.dart';

@immutable
sealed class AcceptedHotelState {}

final class AcceptedHotelInitial extends AcceptedHotelState {}

final class AcceptedHotelLoading extends AcceptedHotelState {}

final class AcceptedHotelLoaded extends AcceptedHotelState {
  final List<AcceptedHotelEntity> hotels;

  AcceptedHotelLoaded(this.hotels);
}

final class AcceptedHotelError extends AcceptedHotelState {
  final String error;

  AcceptedHotelError(this.error);
}
