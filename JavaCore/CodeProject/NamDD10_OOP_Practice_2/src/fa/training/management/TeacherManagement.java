package fa.training.management;

import fa.training.entities.MathTeacher;

public class TeacherManagement {
    public static void main(String[] args) {
        MathTeacher mathTeacher = new MathTeacher("NamDD10", "FPT University", "Math");

        //print out the mathTeacher object, call to toString method.
        System.out.println(mathTeacher);

        //when call mathTeacher.teach method it will run the code of method teach(String content) at class MathTeacher.
        mathTeacher.teach("This is content!");
    }
}