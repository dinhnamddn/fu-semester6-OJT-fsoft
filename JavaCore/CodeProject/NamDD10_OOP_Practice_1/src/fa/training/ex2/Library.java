package fa.training.ex2;

import java.util.ArrayList;
import java.util.List;

public class Library {
    List<Book> books;

    public void addBook(Book book) {
        books.add(book);
    }

    public void removeBook(String title) {
        for (Book b : books) {
            if (b.getTitle().equals(title)) {
                books.remove(b);
                return;
            }
        }
    }

    public double getTotalPrice() {
        double total = 0;
        for (Book b : books) {
            total += b.getPrice();
        }
        return total;
    }

    public Library(List<Book> books) {
        this.books = books;
    }

    public Library() {
        this.books = new ArrayList<>();
    }

    public List<Book> getBooks() {
        return books;
    }

    public void setBooks(List<Book> books) {
        this.books = books;
    }

    @Override
    public String toString() {
        return "Library{" +
                "books=" + books +
                '}';
    }
}
