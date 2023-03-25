import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../routes/router.gr.dart';
import '../../widgets/app_drawer.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  var expandedEstate = false;
  var expandedRieltor = false;
  var expandedInfo = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: IconButton(
              icon: const Icon(Icons.person),
              onPressed: () => context.router.replace(const UserRoute()),
            ),
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 10),
            height: expandedEstate ? 300 : 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Недвижимость',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        IconButton(
                          icon: Icon(expandedEstate ? Icons.close : Icons.add),
                          onPressed: () {
                            setState(() {
                              expandedEstate = !expandedEstate;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 2),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                    height: expandedEstate ? 202 : 0,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Как я могу приобрести недвижимость?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Для того, чтобы совершить покупку, Вам достаточно открыть карточку объявления  и отправить заявку на рассмотрение.',
                          textAlign: TextAlign.justify,
                        ),
                        Divider(
                          height: 15,
                        ),
                        Text(
                          'Как долго будут рассматривать мою заявку?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Вердикт по своей заявки Вы получите, когда один из агентов рассмотрит ее. Обычно это занимает от 2-ух часов до дня.',
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 3),
            height: expandedRieltor ? 310 : 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Для риелторов',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          IconButton(
                            icon:
                                Icon(expandedRieltor ? Icons.close : Icons.add),
                            onPressed: () {
                              setState(() {
                                expandedRieltor = !expandedRieltor;
                              });
                            },
                          ),
                        ]),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 3),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                    height: expandedRieltor ? 223 : 0,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Сколько времени ждать результата запроса лицензии?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'В среднем время проверки документов занимает не более чем 4 часа.',
                          textAlign: TextAlign.justify,
                        ),
                        Divider(
                          height: 15,
                        ),
                        Text(
                          'Как я могу связаться с клиентами?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Платформа предусматривает Вам возможность\n общаться через чат заявки.\n Любые другие средства связи запрещенны лицензионнным соглашением.',
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 3),
            height: expandedInfo ? 300 : 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Личная информация',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        IconButton(
                          icon: Icon(expandedInfo ? Icons.close : Icons.add),
                          onPressed: () {
                            setState(() {
                              expandedInfo = !expandedInfo;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 3),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                    height: expandedInfo ? 202 : 0,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Как мне поменять пароль?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Чтобы сменить пароль, Вам нужно перейти в личный кабинет и нажать кнопку "Сменить пароль"',
                          textAlign: TextAlign.justify,
                        ),
                        Divider(
                          height: 15,
                        ),
                        Text(
                          'Как сменить имя пользователя?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Чтобы сменить имя пользователя, Вам нужно перейти в личный кабинет и нажать кнопку "Изменить имя"',
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
