import 'package:campus_companion/screens/MentalHealthSupport/session_booked.dart';
import 'package:flutter/material.dart';
import '../../constants/colors_constants.dart';

class SessionBookingQuestions extends StatefulWidget {
  const SessionBookingQuestions({Key? key}) : super(key: key);

  @override
  _SessionBookingQuestionsState createState() =>
      _SessionBookingQuestionsState();
}

class _SessionBookingQuestionsState extends State<SessionBookingQuestions> {
  int _currentQuestionIndex = 0;

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                5,
                (index) => Container(
                  width: MediaQuery.of(context).size.width / 5 - 20,
                  height: 5,
                  decoration: BoxDecoration(
                    color: index <= _currentQuestionIndex
                        ? ColorsConstants.primaryBlue
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: _currentQuestionIndex == 4
                ? _buildDateTimeSelection()
                : _buildQuestion(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _currentQuestionIndex == 4
                  ? () {
                      // Handle the completion of questions
                      print('Selected Date: $_selectedDate');
                      print('Selected Time: $_selectedTime');
                      // Add further actions as needed
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const SessionBooked())));
                    }
                  : () {
                      setState(() {
                        _currentQuestionIndex++;
                      });
                    },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: ColorsConstants.primaryBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  _currentQuestionIndex == 4 ? "Done" : "Continue",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestion() {
    switch (_currentQuestionIndex) {
      case 0:
        return _buildAgeQuestion();
      case 1:
        return _buildAreasQuestion();
      case 2:
        return _buildGenderQuestion();
      case 3:
        return _buildTherapyQuestion();
      default:
        return Container(); // Placeholder
    }
  }

  Widget _buildAgeQuestion() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "What is your age?",
            style: TextStyle(
              color: ColorsConstants.primaryBlue,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter your age",
                labelText: "Age",
                labelStyle: const TextStyle(color: ColorsConstants.primaryBlue),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: ColorsConstants.primaryBlue),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: ColorsConstants.primaryBlue),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAreasQuestion() {
    // Define options
    List<String> options = [
      "Anxiety",
      "Depression",
      "Stress",
      "Sleeplessness",
      "Lack of confidence",
      // Add more options as needed
    ];

    // Define a set to keep track of selected options
    Set<String> selectedOptions = {};

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Choose the areas where you want to find help",
              style: TextStyle(
                color: ColorsConstants.primaryBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Build options
          Column(
            children: options.map((option) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (selectedOptions.contains(option)) {
                              selectedOptions.remove(option);
                            } else {
                              selectedOptions.add(option);
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: ColorsConstants.primaryBlue,
                            ),
                            color: selectedOptions.contains(option)
                                ? ColorsConstants.primaryBlue
                                : Colors.transparent,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                option,
                                style: TextStyle(
                                  color: selectedOptions.contains(option)
                                      ? Colors.white
                                      : ColorsConstants.primaryBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: selectedOptions.contains(option)
                                        ? Colors.white
                                        : ColorsConstants.primaryBlue,
                                    width: 2,
                                  ),
                                  color: selectedOptions.contains(option)
                                      ? ColorsConstants.primaryBlue
                                      : Colors.transparent,
                                ),
                                child: selectedOptions.contains(option)
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderQuestion() {
    // Define options
    List<String> options = [
      "Male",
      "Female",
      "Prefer Not To Say",
      // Add more options as needed
    ];

    // Define a variable to keep track of the selected option
    String? selectedOption;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Select your gender",
              style: TextStyle(
                color: ColorsConstants.primaryBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Build options
          Column(
            children: options.map((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 4), // Reduced vertical padding
                child: Container(
                  width: MediaQuery.of(context).size.width - 32,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorsConstants.primaryBlue,
                      width: 0.5, // Adjusted border thickness
                    ),
                    color: selectedOption == option
                        ? ColorsConstants.primaryBlue
                        : Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        option,
                        style: TextStyle(
                          color: selectedOption == option
                              ? Colors.white
                              : ColorsConstants.primaryBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Radio<String>(
                        value: option,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                        },
                        activeColor: ColorsConstants.primaryBlue,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTherapyQuestion() {
    // Define options
    List<String> options = [
      "Yes",
      "No",
      // Add more options as needed
    ];

    // Define a variable to keep track of the selected option
    String? selectedOption;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Have you taken therapy before?",
              style: TextStyle(
                color: ColorsConstants.primaryBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Build options
          Column(
            children: options.map((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 4), // Reduced vertical padding
                child: Container(
                  width: MediaQuery.of(context).size.width - 32,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorsConstants.primaryBlue,
                      width: 0.5, // Adjusted border thickness
                    ),
                    color: selectedOption == option
                        ? ColorsConstants.primaryBlue
                        : Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        option,
                        style: TextStyle(
                          color: selectedOption == option
                              ? Colors.white
                              : ColorsConstants.primaryBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Radio<String>(
                        value: option,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                        },
                        activeColor: ColorsConstants.primaryBlue,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildDateTimeSelection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Select Date',
            style: TextStyle(
              color: ColorsConstants.primaryBlue,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsConstants.primaryBlue,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              _selectedDate != null
                  ? 'Selected Date: $_selectedDate'
                  : 'Choose Date',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Select Time',
            style: TextStyle(
              color: ColorsConstants.primaryBlue,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => _selectTime(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsConstants.primaryBlue,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              _selectedTime != null
                  ? 'Selected Time: ${_selectedTime!.format(context)}'
                  : 'Choose Time',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }
}
