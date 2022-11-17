package fa.training.exercise1;

public class BookTest {
    public static void main(String[] args) {
        Book[] book = new Book[30];

        for (int i = 0; i < 30; i++) {
            book[i] = new Book("Book's name " + (i + 1), i+1, "author_name", "publisher");
        }

        for (int i = 0; i < 30; i++) {
            System.out.printf("\nBook " + (i + 1) + ":");
            System.out.printf(book[i].getBookInfo());
        }
    }
}