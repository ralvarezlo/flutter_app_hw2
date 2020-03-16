import 'Question.dart';
import 'WebClient.dart';
class QuizBuilder{

  /// Builds a quiz based on data from a Map [jsonQ];
  Quiz fromJson(Map jsonQ) {
    List<Question> questions = [];
    String name = jsonQ['name'];
    List qListRaw = jsonQ['question'];
    qListRaw.forEach((e) => questions.add(buildQuestion(e)));
    return Quiz(questions, name);
  }

  /// Builds a question, either multiple choice or fill blank based on data from a question in a Map [q];
  Question buildQuestion(Map q) {
    if (q['type']==1) {
      var mcq = MultipleChoiceQuestion(q['stem'], q['answer'], q['option']);
      return mcq;
    }
    else {
      var fbq = FillBlankQuestion(q['stem'], q['answer']);
      return fbq;
    }
  }


  /// Builds a list of question based on the amount of [numQuestions] that the user inputs.
  ///
  /// If the system does not have enough [numQuestions] the user will be notify the lack of questions.
  Future<List<Question>> buildQuestionList (int numQuestions) async {
    List<Question> questions = [];
    int numQuiz =1;
    while (numQuestions >= questions.length) {
      var quizMap = await WebClient().getJsonQuiz(numQuiz);
      if(quizMap == null) {
        print('Not enough questions :(,  Just added ${questions.length} question to the test\n');
        return questions;
      }
      Quiz quiz = fromJson(quizMap);
      questions.addAll(quiz.questions as List<Question>);
      numQuiz++;
    }
    questions = questions.sublist(0, numQuestions);
    print('Number of questions = ${questions.length}');
    return questions;
  }

}

