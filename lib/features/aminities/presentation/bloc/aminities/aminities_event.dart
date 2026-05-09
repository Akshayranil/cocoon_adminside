part of 'aminities_bloc.dart';

@immutable
sealed class AminitiesEvent {}

class AminitiesLoadedEvent extends AminitiesEvent {}

class AddAminitiesEvent extends AminitiesEvent {
  final String name;
  




  AddAminitiesEvent(this.name, );}

class DeleteAminitiesEvent extends AminitiesEvent {
  final String id;

  DeleteAminitiesEvent(this.id);
}
