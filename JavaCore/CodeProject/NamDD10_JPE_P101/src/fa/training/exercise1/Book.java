package fa.training.exercise1;

public class Book {
    private String book_name;
    private int ISBN_number;
    private String author_name, publisher;

    public Book(String book_name, int ISBN_number, String author_name, String publisher) {
        this.book_name = book_name;
        this.ISBN_number = ISBN_number;
        this.author_name = author_name;
        this.publisher = publisher;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public int getISBN_number() {
        return ISBN_number;
    }

    public void setISBN_number(int ISBN_number) {
        this.ISBN_number = ISBN_number;
    }

    public String getAuthor_name() {
        return author_name;
    }

    public void setAuthor_name(String author_name) {
        this.author_name = author_name;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getBookInfo() {
        return "\nBook{" +
                "book_name='" + book_name + '\'' +
                ", ISBN_number=" + ISBN_number +
                ", author_name='" + author_name + '\'' +
                ", publisher='" + publisher + '\'' +
                '}';
    }
}