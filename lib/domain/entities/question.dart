import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final String title;
  final String id;
  final String description;

  const Question(
      {required this.title, required this.id, required this.description});
  @override
  List<Object?> get props => [title, id, description];
}

class QuestionList {
  final List<Question> qList = [
    const Question(
        title: 'Как я могу приобрести недвижимость?',
        id: '1',
        description:
            'Для того, чтобы совершить покупку,\n Вам достаточно открыть карточку объявления \n и отправить заявку на рассмотрение.'),
    const Question(
        title: 'Как мне поменять пароль?',
        id: '2',
        description:
            'Чтобы сменить пароль,\n Вам нужно перейти в личный кабинет и \n нажать кнопку "Сменить пароль"'),
    const Question(
        title: 'Как сменить имя пользователя?',
        id: '2',
        description:
            'Чтобы сменить имя пользователя,\n Вам нужно перейти в личный кабинет и нажать кнопку "Изменить имя"'),
    const Question(
        title: 'Как долго будут рассматривать мою заявку?',
        id: '1',
        description:
            'Вердикт по своей заявки Вы получите, когда один из агентов рассмотрит ее.\n Обычно это занимает от 2-ух часов до дня.'),
    const Question(
        title: 'Сколько времени ждать результата запроса лицензии?',
        id: '3',
        description:
            'В среднем время проверки документов занимает не более чем 4 часа.'),
    const Question(
        title: 'Как я могу связаться с клиентами?',
        id: '3',
        description:
            'Платформа предусматривает Вам возможность\n общаться через чат заявки.\n Любые другие средства связи запрещенны лицензионнным соглашением.'),
  ];
  List<String> categories = [
    'Недвижмость',
    'Личная информация',
    'Для риелторов'
  ];
  get question {
    return [...qList];
  }
}
