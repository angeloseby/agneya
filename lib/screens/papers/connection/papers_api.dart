
import 'package:agneya/screens/semesters/connections/semesters_api.dart';
import 'package:agneya/screens/semesters/connections/semesters_model.dart';

class PapersApi{
  static Future<List<Papers>> getQuestionPapers(int semNo,String courseCode) async{
    List<Semesters> semesters = await SemestersApi.getPapers(courseCode);
    List<Semesters> filteredSem = [];
    for(Semesters sem in semesters){
      if(sem.semester == semNo){
        filteredSem.add(sem);
      }
    }
    List<Papers> papers = filteredSem[0].papers??[];
    return papers;
  }
}