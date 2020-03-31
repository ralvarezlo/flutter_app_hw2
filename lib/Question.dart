


class Question{
  var _validAns;
  var _userAns;
  String _figure;
  String _sysQues;

  set question (String str){
    _sysQues=str;
  }

  set userAns (String str) {
    _userAns = str;
  }

  /// Returns the question
  String get question{
    return _sysQues;
  }

  /// Returns the user answer
  dynamic get userAns {
    return _userAns;
  }
  /// Returns the correct answer for the question
  dynamic get validAns {
    return _validAns;
  }

  /// Returns `true` if the answer of the user is correct
  bool get isCorrect{
    return _userAns == _validAns;
  }

  /// Returns `true` if the answer of the user is not null
  bool get hasAnswer{
    return _userAns != null;
  }

  /// Returns a string to be prompt
  String get prompt {
    return '';
  }


  /// Returns the figure of the question.
  String get figure{
    return _figure;
  }


}

/// An extension of the question class to generate a multiple choice question.
class MultipleChoiceQuestion extends Question{
  List<String> _options = [];

  MultipleChoiceQuestion(String sQues, int vAns, List opt, String figure) {
    _sysQues = sQues;
    _validAns = vAns;
    _figure = figure;
    opt.forEach((e) => _options.add(e));
  }

  set options (List<String> str) {_options = str;}
  set validAns (int i) {
    _validAns = i;
  }

  /// Changes the input of a user to an integer for multiple choice questions
  @override
  set userAns (String str) {
    _userAns = int.parse(str);
  }


  List<String> get options {
    return _options;
  }

  /// Displays the options for a multiple choice question
  @override
  String get prompt {
    var str = '';
    for (var i=0; i<_options.length; i++) {
      str += '${i+1}) ${_options[i]}\n';
    }
    return str+'Enter the number of the correct option:';
  }
}

/// An extension of the question class to generate a filling in  a blank question.
class FillBlankQuestion extends Question {

  FillBlankQuestion(String sQues, List vAns) {
    _validAns = vAns;
    _sysQues = sQues;
  }

  @override
  set userAns (String str) {
    _userAns = str;
  }
  set validAns (List str) {
    _validAns = str;
  }

  /// Returns true if the answer provided by the user is correct
  @override
  bool get isCorrect{
    for(int i=0; i<_validAns.length; i++) {
      if (_userAns==_validAns[i]) return true;
    }
    return false;
  }
}

/// A list of questions (quiz)
class Quiz {
  List <Question> _questions = [];
  String _name;

  Quiz(List questions, String name) {
    _questions = questions;
    _name = name;
  }

  /// Return the name of the quiz
  String get name{
    return _name;
  }
  /// Returns the questions inside the quiz
  List<Question> get questions {
    return _questions;
  }

  /// Returns the grade of the quiz
  int grade() {
    var currGrade = 0;
    _questions.forEach((e) => currGrade += e.isCorrect? 1:0);
    return currGrade;
  }

  /// True if the quiz is complete, false otherwise
  bool isComplete() {
    bool retBool = true;
    _questions.forEach((e){
      if (e.userAns == null) retBool = false;
    });
    return retBool;
  }
}

