
import 'dart:convert';
import 'package:http/http.dart' as http;

// Ricardo Alvarez & Samuel Tinevra.
/// Gets the quiz questions to be used in this program by connecting to a web client
//abstract class WebClient {
//  Future getJsonQuiz(int numQuiz);
//  Future getJsonQuizPOST(int numQuiz, String user, String pin);
//  Future<dynamic> test();
//
//}

class  WebClient{
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
    print(body);
    for (int i=0; i<30; i++) {
      try {
        var response = await http.post(url, body: body);
        print("response is $response");
        var jsonD = jsonDecode(response.body);
        print(jsonD);

        if (jsonD["response"] == true) {
          return jsonD['quiz'];
        }
        else{
          return null;
        }
      }
      catch (e) {
        print(e.toString());
      }
    }
    print("error getting info from server");
    return null;
  }

}


