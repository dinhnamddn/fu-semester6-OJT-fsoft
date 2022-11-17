package fa.training.ex2;

import java.util.Arrays;
import java.util.List;

public class Book {
    String title;
    List<String> authors;
    int numberOfPage;
    float price;
    String publisher;

    public Book() {

    }

    public Book(String title, List<String> authors, int numberOfPage, float price, String publisher) {
        this.title = title;
        this.authors = authors;
        this.numberOfPage = numberOfPage;
        this.price = price;
        this.publisher = publisher;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<String> getAuthors() {
        return authors;
    }

    public void setAuthors(List<String> authors) {
        this.authors = authors;
    }

    public int getNumberOfPage() {
        return numberOfPage;
    }

    public void setNumberOfPage(int numberOfPage) {
        this.numberOfPage = numberOfPage;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    @Override
    public String toString() {
        return "\nBook{" +
                "title='" + title + '\'' +
                ", authors=" + authors +
                ", numberOfPage=" + numberOfPage +
                ", price=" + price +
                ", publisher='" + publisher + '\'' +
                '}';
    }
}
