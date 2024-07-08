import 'package:flutter/material.dart';

class ResultAnswers extends StatelessWidget {
  const ResultAnswers({super.key, required this.summary, required this.onRestart});
  final List<Map<String, Object>> summary;
  final void Function(BuildContext context) onRestart;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.65,
          child: SingleChildScrollView(
            child: Column(
              children: summary.map((data) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            (((data['question-index']) as int) + 1).toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['question'].toString(),
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                'Correct answer is : ${data['correct-answer'].toString()}',
                                style: const TextStyle(
                                    color: Colors.green, fontSize: 20),
                              ),
                              Text(
                                'Your answer is : ${data['user-answer'].toString()}',
                                style: data['correct-answer'] ==
                                        data['user-answer']
                                    ? const TextStyle(
                                        color: Colors.green, fontSize: 20)
                                    : const TextStyle(
                                        color: Colors.red, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextButton.icon(
          onPressed: (){
            onRestart(context);
          },
          label: Text('Restart quiz'),
          icon: Icon(Icons.restart_alt),
          style: TextButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
          ),
        )
      ],
    );
  }
}
