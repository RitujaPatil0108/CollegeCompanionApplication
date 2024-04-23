import 'package:campus_companion/screens/MentalHealthSupport/exercise_dashboard.dart';
import 'package:campus_companion/screens/MentalHealthSupport/rd_dashboard.dart';
import 'package:campus_companion/screens/MentalHealthSupport/schedule_session.dart';
import 'package:campus_companion/screens/MentalHealthSupport/self_assessment_questions.dart';
import 'package:campus_companion/screens/MentalHealthSupport/workshops.dart';
import 'package:flutter/material.dart';

class FrequentActions extends StatelessWidget {
  const FrequentActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ActionData> actions = [
      ActionData(
        label: 'Schedule Session',
        image: 'assets/images/schedule_session.png',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: ((context) => const ScheduleSession())));
        },
      ),
      ActionData(
        label: 'Self Assessment',
        image: 'assets/images/self_assesment.png',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: ((context) => const SelfAssessmentQuestions())));
        },
      ),
      ActionData(
        label: 'Reading Content',
        image: 'assets/images/reading_content.png',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const ReadingContentDashboard()));
        },
      ),
      ActionData(
        label: 'Workshops',
        image: 'assets/images/workshop.png',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: ((context) => const WorkshopPage())));
        },
      ),
      
      ActionData(
        label: 'Exercises',
        image: 'assets/images/exercise.png',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const ExerciseDashboard()));
        },
      ),
      ActionData(
        label: 'Meditation',
        image: 'assets/images/meditation.png',
        onTap: () {},
      ),
      
    ];

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: List.generate(
          (actions.length / 2).ceil(),
          (index) => Row(
            children: actions
                .skip(index * 2)
                .take(2)
                .map(
                  (action) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: action.onTap,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 4,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              image: DecorationImage(
                                image: AssetImage(action.image),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.dstATop,
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               
                                const SizedBox(height: 85),
                                Text(
                                  action.label,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class ActionData {
  final String label;
  final String image;
  final VoidCallback? onTap;

  ActionData({ required this.label, required this.image, this.onTap});
}
