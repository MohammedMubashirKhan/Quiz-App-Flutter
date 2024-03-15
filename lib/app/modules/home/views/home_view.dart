import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_app/app/modules/home/constans/dummy_questions.dart';
import 'package:quiz_app/app/modules/home/model/question_model.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  final int _questionNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Question $_questionNumber/${questions.length}",
            ),
            Expanded(
              child: PageView.builder(
                itemCount: questions.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final question = questions[index];
                  return buildQuestion(question);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Column buildQuestion(Question question) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "${question.text}",
        style: const TextStyle(fontSize: 25.0),
      ),
      OptionsWidgets(question: question),
    ],
  );
}

class OptionsWidgets extends StatelessWidget {
  const OptionsWidgets({
    super.key,
    required this.question,
  });
  final Question question;
  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          question.options!.map((options) => buildOptions(options)).toList(),
    );
  }
}

Widget buildOptions(Options options) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 50,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "${options.text}",
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    ),
  );
}
