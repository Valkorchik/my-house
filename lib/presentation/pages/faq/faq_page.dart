import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foldable_list/foldable_list.dart';
import 'package:foldable_list/resources/arrays.dart';
import 'package:my_house/domain/entities/question.dart';
import '../../bloc/faq/faq_bloc.dart';
import '../../widgets/app_drawer.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final List<Widget> simpleWidgetList = [];

  final List<Widget> expandedWidgetList = [];

  @override
  void initState() {
    final faq = context.read<FaqBloc>().questionList;
    initList(faq);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: BlocBuilder<FaqBloc, FaqState>(
        builder: (context, state) {
          context.read<FaqBloc>().add(GetQuestionsEvent());
          if (state is FaqLoaded) {
            return FoldableList(
                animationDuration: const Duration(milliseconds: 500),
                animationType: AnimationType.sizeTransition,
                foldableItems: expandedWidgetList,
                items: simpleWidgetList);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  initList(QuestionList faq) {
    for (var i = 0; i < faq.categories.length; i++) {
      simpleWidgetList.add(renderSimpleWidget(faq.categories[i]));
      for (var j = i; j < i + 2; j++) {
        expandedWidgetList.add(renderExpandedWidget(faq.categories[i],
            faq.question[j].title, faq.question[j].description));
      }
    }
  }

  Widget renderSimpleWidget(String categorie) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              categorie,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const Icon(Icons.add),
          ],
        ),
      ),
    );
  }

  Widget renderExpandedWidget(
      String categorie, String title, String description) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  categorie,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                FittedBox(fit: BoxFit.contain, child: Text(description)),
              ],
            ),
            const Icon(Icons.close),
          ],
        ),
      ),
    );
  }
}
