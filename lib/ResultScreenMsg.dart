import 'package:flutter/cupertino.dart';

class ResultScreenMsg extends StatelessWidget {
  const ResultScreenMsg(this.datas, {super.key});

  final List<Map<String, Object>> datas;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        child: Column(
          children: datas.map((e) {
            return Row(
              children: [
                Text(((e['question_index'] as int) + 1).toString()),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: Column(
                      children: [
                        Text(e['question'] as String),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(e['correct_answer'] as String),
                        Text(e['user_answer'] as String)
                      ],
                    ))
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
