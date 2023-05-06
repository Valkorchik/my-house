part of 'estate_bloc.dart';

abstract class EstateEvent extends Equatable {
  const EstateEvent();

  @override
  List<Object> get props => [];
}

class GetEstatesEvent extends EstateEvent {}

class BuyEstateEvent extends EstateEvent {
  final String estateId;

  const BuyEstateEvent(this.estateId);
}

class GetMyEventsEvent extends EstateEvent {}
