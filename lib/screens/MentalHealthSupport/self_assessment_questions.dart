import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../../constants/colors_constants.dart';

class SelfAssessmentQuestions extends StatefulWidget {
  const SelfAssessmentQuestions({Key? key}) : super(key: key);

  @override
  _SelfAssessmentQuestionsState createState() => _SelfAssessmentQuestionsState();
}

class _SelfAssessmentQuestionsState extends State<SelfAssessmentQuestions> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Do you often feel anxious or nervous?',
      'options': ['Yes', 'No'],
      'selected': '',
    },
    {
      'question': 'Do you experience frequent mood swings?',
      'options': ['Yes', 'No'],
      'selected': '',
    },
    {
      'question': 'Do you have trouble sleeping at night?',
      'options': ['Always', 'Sometimes', 'Rarely', 'Never'],
      'selected': '',
    },
    {
      'question': 'How often do you feel sad or depressed?',
      'options': ['Always', 'Often', 'Sometimes', 'Rarely', 'Never'],
      'selected': '',
    },
    {
      'question': 'Do you have trouble concentrating on tasks?',
      'options': ['Always', 'Often', 'Sometimes', 'Rarely', 'Never'],
      'selected': '',
    },
    {
      'question': 'Do you frequently experience racing thoughts?',
      'options': ['Yes', 'No'],
      'selected': '',
    },
    {
      'question': 'How often do you feel overwhelmed?',
      'options': ['Always', 'Often', 'Sometimes', 'Rarely', 'Never'],
      'selected': '',
    },
    {
      'question': 'Do you engage in self-destructive behaviors?',
      'options': ['Yes', 'No'],
      'selected': '',
    },
    {
      'question': 'Do you have trouble controlling your anger?',
      'options': ['Always', 'Often', 'Sometimes', 'Rarely', 'Never'],
      'selected': '',
    },
    {
      'question': 'Do you feel disconnected from reality at times?',
      'options': ['Yes', 'No'],
      'selected': '',
    },
  ];

  int _currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/ncu_logo.png',
          height: 40,
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: ColorsConstants.primaryBlue,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorsConstants.primaryBlue,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: FadeTransition(
        opacity: _animation,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  questions.length,
                  (index) => Container(
                    width: MediaQuery.of(context).size.width / questions.length - 20,
                    height: 5,
                    decoration: BoxDecoration(
                      color: index <= _currentQuestionIndex ? ColorsConstants.primaryBlue : Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _currentQuestionIndex < questions.length
                  ? _buildQuestion(questions[_currentQuestionIndex])
                  : _buildAnalysis(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _currentQuestionIndex > 0 ? _prevQuestion : null,
                    style: ElevatedButton.styleFrom(
                      primary: ColorsConstants.primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Previous',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _currentQuestionIndex == questions.length - 1 ? _finishAssessment : _nextQuestion,
                    style: ElevatedButton.styleFrom(
                      primary: ColorsConstants.primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        _currentQuestionIndex < questions.length - 1 ? 'Next' : 'Finish',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestion(Map<String, dynamic> questionData) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            questionData['question'] as String,
            style: const TextStyle(
              color: ColorsConstants.primaryBlue,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: (questionData['options'] as List<String>).map((option) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorsConstants.primaryBlue),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: RadioListTile<String>(
                  title: Text(
                    option,
                    style: const TextStyle(color: ColorsConstants.primaryBlue),
                  ),
                  value: option,
                  groupValue: questionData['selected'] as String?,
                  onChanged: (String? value) {
                    setState(() {
                      questionData['selected'] = value!;
                    });
                  },
                  activeColor: ColorsConstants.primaryBlue,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildAnalysis() {
    // Simple analysis based on selected options
    bool hasAnxiety = questions[0]['selected'] == 'Yes';
    bool hasMoodSwings = questions[1]['selected'] == 'Yes';

    String analysis = '';
    if (hasAnxiety && hasMoodSwings) {
      analysis = 'Based on your responses, it seems you may be experiencing symptoms of anxiety and mood swings. It is recommended to consult a mental health professional for further evaluation and support.';
    } else if (hasAnxiety) {
      analysis = 'Based on your responses, it seems you may be experiencing symptoms of anxiety. Consider seeking support from a mental health professional.';
    } else if (hasMoodSwings) {
      analysis = 'Based on your responses, it seems you may be experiencing mood swings. It is advisable to consult a mental health professional for further assessment.';
    } else {
      analysis = 'Based on your responses, it seems you may not be experiencing significant mental health concerns at the moment. However, it is always important to prioritize self-care and seek support if needed.';
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Analysis',
            style: TextStyle(
              color: ColorsConstants.primaryBlue,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            analysis,
            style: const TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex++;
    });
  }

  void _prevQuestion() {
    setState(() {
      _currentQuestionIndex--;
    });
  }

 void _finishAssessment() {
  // Perform analysis based on selected options
  bool hasAnxiety = questions.any((question) => question['selected'] == 'Yes');
  bool hasMoodSwings = questions.any((question) => question['selected'] == 'Yes');

  String analysis = '';
  if (hasAnxiety && hasMoodSwings) {
    analysis = 'Based on your responses, it seems you may be experiencing symptoms of anxiety and mood swings. It is recommended to consult a mental health professional for further evaluation and support.';
  } else if (hasAnxiety) {
    analysis = 'Based on your responses, it seems you may be experiencing symptoms of anxiety. Consider seeking support from a mental health professional.';
  } else if (hasMoodSwings) {
    analysis = 'Based on your responses, it seems you may be experiencing mood swings. It is advisable to consult a mental health professional for further assessment.';
  } else {
    analysis = 'Based on your responses, it seems you may not be experiencing significant mental health concerns at the moment. However, it is always important to prioritize self-care and seek support if needed.';
  }

  // Show the analysis in a dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Analysis'),
        content: Text(
          analysis,
          style: const TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}

}
