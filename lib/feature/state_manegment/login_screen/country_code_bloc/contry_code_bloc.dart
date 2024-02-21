import 'package:bloc/bloc.dart';
import 'package:country_picker/country_picker.dart';
import 'package:meta/meta.dart';

part 'contry_code_event.dart';
part 'contry_code_state.dart';

class ContryCodeBloc extends Bloc<ContryCodeEvent, ContryCodeState> {
  ContryCodeBloc() : super(ContryCodeInitial()) {
    on<ContryCodeGetEvent>((event, emit) {
      emit(ContryCodeLoadingState());
      if (event.contryCode != null) {
        emit(ContryCodeLoadedState(code: event.contryCode));
      }
    });
  }
}
