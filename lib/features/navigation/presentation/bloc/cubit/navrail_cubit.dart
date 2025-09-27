import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navrail_state.dart';

class NavrailCubit extends Cubit<int> {
  NavrailCubit() : super(0);
  void updateIndex(int index) => emit(index);
}
