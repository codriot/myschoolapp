class LessonData {
  final lessonname;
  final lessontime;
  LessonData({required this.lessonname,required this.lessontime})
}

enum Lessons { pazartesi, sali, carsamba, persembe, cuma }

extension lessonsextention on Lessons {

  LessonData get lesson()
  {
    switch (this) {
      case Lessons.pazartesi:
        return LessonData(lessonname: "", lessontime: lessontime);
        
          case Lessons.sali:
        return LessonData(lessonname: lessonname, lessontime: lessontime);
        
     
          case Lessons.carsamba:
        return LessonData(lessonname: lessonname, lessontime: lessontime);
        
        
          case Lessons.persembe:
        return LessonData(lessonname: lessonname, lessontime: lessontime);
        
       
          case Lessons.cuma:
        
        return LessonData(lessonname: lessonname, lessontime: lessontime);
      
       
      
    
    }
  }

}
