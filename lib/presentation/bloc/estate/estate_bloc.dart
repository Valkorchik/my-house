import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/estate.dart';

part 'estate_event.dart';
part 'estate_state.dart';

class EstateBloc extends Bloc<EstateEvent, EstateState> {
  final EstateList estateList;

  EstateBloc(this.estateList) : super(EstateInitial()) {
    on<GetEstatesEvent>(_onGetEstates);
  }

  _onGetEstates(event, emit) {
    emit(EstateLoading());
    //Estate repository get from server .....
    emit(EstateLoaded());
  }
}
