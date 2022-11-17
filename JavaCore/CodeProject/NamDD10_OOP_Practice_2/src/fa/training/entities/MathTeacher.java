package fa.training.entities;

public class MathTeacher extends Teacher {
    String manSubject;

    public MathTeacher() {
    }

    public MathTeacher(String designation, String collegeName, String manSubject) {
        super(designation, collegeName);
        this.manSubject = manSubject;
    }

    public String getManSubject() {
        return manSubject;
    }

    public void setManSubject(String manSubject) {
        this.manSubject = manSubject;
    }

    @Override
    public void teach(String content) {
        System.out.println("Teaching contents: " + content);
    }

    @Override
    public String toString() {
        return "MathTeacher{" +
                "manSubject='" + manSubject + '\'' +
                ", designation='" + designation + '\'' +
                ", collegeName='" + collegeName + '\'' +
                '}';
    }
}