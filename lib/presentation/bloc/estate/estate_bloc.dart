import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_house/domain/repositories/estate_repository.dart';

part 'estate_event.dart';
part 'estate_state.dart';

class EstateBloc extends Bloc<EstateEvent, EstateState> {
  final EstateRepository estateRepository;

  EstateBloc(this.estateRepository) : super(EstateInitial()) {
    on<GetEstatesEvent>(_onGetEstates);
    on<GetMyEventsEvent>(_onGetMyEvents);
    on<BuyEstateEvent>(_onBuyEvent);
    on<ClearListEvent>(_onClearList);
  }

  _onGetEstates(event, emit) async {
    emit(EstateLoading());

    await estateRepository.getEstate();
    emit(EstateLoaded());
  }

  _onGetMyEvents(event, emit) async {
    emit(EstateLoading());

    await estateRepository.getMyEstates();
    emit(EstateLoaded());
  }

  _onBuyEvent(event, emit) async {
    emit(EstateLoading());

    await estateRepository.buyEstate(event.estateId);
    emit(EstateLoaded());
  }

  _onClearList(event, emit) async {
    emit(ClearList(estateRepository));
    estateRepository.clearList();
  }
}
