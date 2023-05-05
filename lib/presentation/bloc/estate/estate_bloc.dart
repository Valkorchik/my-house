import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_house/domain/repositories/estate_repository.dart';

part 'estate_event.dart';
part 'estate_state.dart';

class EstateBloc extends Bloc<EstateEvent, EstateState> {
  final EstateRepository estateRepository;

  EstateBloc(this.estateRepository) : super(EstateInitial()) {
    on<GetEstatesEvent>(_onGetEstates);
  }

  _onGetEstates(event, emit) async {
    emit(EstateLoading());

    await estateRepository.getEstate();
    emit(EstateLoaded());
  }
}
