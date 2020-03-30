
import 'dart:convert';
import 'package:http/http.dart' as http;

// Ricardo Alvarez & Samuel Tinevra.
/// Gets the quiz questions to be used in this program by connecting to a web client
abstract class WebClient {
  Future getJsonQuiz(int numQuiz);
  Future getJsonQuizPOST(int numQuiz, String user, String pin);
  Future<String> test();

}

class Auth implements WebClient{
  /// Gets the information of a certain quiz with [numQuiz] as a Json respond from a GET call
  ///
  /// Return null if the GET call is unsuccessful
  Future getJsonQuiz(int numQuiz) async {
    var url = 'http://www.cs.utep.edu/cheon/cs4381/homework/quiz/?quiz=quiz0${numQuiz}';
    var response = await http.get(url);
    Map jsonD = jsonDecode(response.body);
    if (jsonD['response'] == true) {
      return jsonD['quiz'];
    }
    else{
      return null;
    }
  }


  Future getJsonQuizPOST(int numQuiz, String user, String pin) async {
    var url = 'http://www.cs.utep.edu/cheon/cs4381/homework/quiz/post.php';
    var body = '{"user": "$user", "pin": "$pin", "quiz": "quiz0$numQuiz" }';
    var response = await http.post(url, body: body);
    var jsonD = jsonDecode(response.body);
    //print(jsonD);


    if (jsonD["response"] == true) {
     //print(jsonD['quiz']);
      return jsonD['quiz'];
    }
    else{
      return null;
    }
  }

  Future<String> test() async {
    var url = 'http://www.cs.utep.edu/cheon/cs4381/homework/quiz/post.php';
    var body = '{"user": "stinevra", "pin": "1052", "quiz": "quiz01" }';
    var response = await http.post(url, body: body);
    var jsonD = jsonDecode(response.body);
    //print(jsonD);


    if (jsonD["response"] == true) {
      //print(jsonD['quiz']);
      return jsonD['quiz'];
    }
    else{
      return null;
    }
  }


}


