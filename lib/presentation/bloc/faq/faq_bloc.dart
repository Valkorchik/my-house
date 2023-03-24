import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_house/domain/entities/question.dart';

part 'faq_event.dart';
part 'faq_state.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  QuestionList questionList;
  FaqBloc(this.questionList) : super(FaqInitial()) {
    on<GetQuestionsEvent>(_onGetQuestions);
  }
  _onGetQuestions(event, emit) {
    emit(FaqLoading());
    //featch and get questions
    emit(FaqLoaded());
  }
}
