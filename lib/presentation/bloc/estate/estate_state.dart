part of 'estate_bloc.dart';

abstract class EstateState extends Equatable {
  const EstateState();

  @override
  List<Object> get props => [];
}

class EstateInitial extends EstateState {}

class EstateLoading extends EstateState {}

class EstateLoaded extends EstateState {}

class MyEstateLoaded extends EstateState {}

class ClearList extends EstateBloc {
  ClearList(super.estateRepository);
}
