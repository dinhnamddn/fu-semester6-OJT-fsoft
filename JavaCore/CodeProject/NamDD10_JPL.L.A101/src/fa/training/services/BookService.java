package fa.training.services;

import Validation.Validation;
import fa.training.entities.Book;

import java.util.*;

public class BookService {

    public void addNewBook(List<Book> bookList) {
        System.out.println("----------------------------------");
        System.out.println("Add a new book.");

        int publicationYear = Validation.CheckInt("Enter publication year: ", 0, 2022);
        String publisher = Validation.checkInputString("Enter publisher: ", "[a-zA-Z0-9 ]+");
        Date publicationDate = Validation.checkDate("Enter publication date: ", "dd-MM-yyyy");
        String isbn = "";

        boolean checkISBN;

        do {
            checkISBN = false;
            isbn = Validation.checkInputString("Enter ISBN: ", "[0-9-]{10,17}");
            for (Book b : bookList) {
                if (b.getIsbn().equals(isbn)) {
                    System.out.println("ISBN is duplicated. Please try again.");
                    checkISBN = true;
                    break;
                }
            }
        } while (checkISBN);

        Set<String> author = new HashSet<>();
        System.out.println("Enter list authors' name (or type \"Exit\" to stop): ");
        do {
            String authorName = Validation.checkInputString("Enter author: ", "[a-zA-Z .]+");
            if (authorName.equals("Exit")) {
                break;
            } else {
                author.add(authorName);
            }
        } while (true);

        String publicationPlace = Validation.checkInputString("Enter publication place: ", "[a-zA-Z0-9 ,.]+");

        Book book = new Book(publicationYear, publisher, publicationDate, isbn, author, publicationPlace);
        bookList.add(book);
    }

    public void addAuthor(List<Book> bookList) {
        System.out.println("----------------------------------");
        System.out.println("Add authors.");

        String isbn = Validation.checkInputString("Enter book's isbn need to add author: ", "[0-9-]{10,17}");
        Book book = searchBookByISBN(isbn, bookList);
        if (book == null) {
            System.out.println("Book not found!");
            return;
        }

        String authorName = Validation.checkInputString("Enter author: ", "[a-zA-Z .]+");
        if (book.getAuthor().contains(authorName)) {
            System.out.println("Author existed");
        } else {
            book.getAuthor().add(authorName);
            System.out.println("Add successfully");
        }
    }

    public Book searchBookByISBN(String isbn, List<Book> bookList) {
        for (Book book : bookList) {
            if (book.getIsbn().equals(isbn)) {
                return book;
            }
        }
        return null;
    }

    public List<Book> searchBookByAuthor(String author, List<Book> bookList) {
        List<Book> listB = new ArrayList<>();
        for (Book book : bookList) {
            if (book.getAuthor().contains(author)) {
                listB.add(book);
            }
        }
        listB.sort(Comparator.comparing(book -> ((Book) book).getIsbn())
                .thenComparing(book -> ((Book) book).getPublicationDate()));
        return listB;
    }

    public List<Book> searchBookByPublisher(String publisher, List<Book> bookList) {
        List<Book> publisherListBooks = new ArrayList<>();
        for (Book book : bookList) {
            if (book.getPublisher().equals(publisher)) {
                publisherListBooks.add(book);
            }
        }
        publisherListBooks.sort(Comparator.comparing(book -> ((Book) book).getIsbn())
                .thenComparing(book -> ((Book) book).getPublicationDate()));
        return publisherListBooks;
    }

    public void searchBook(List<Book> bookList) {
        boolean check = true;
        while (check) {
            System.out.println("\n----------Search Book.--------");
            System.out.println("1. By ISBN: ");
            System.out.println("2. By author: ");
            System.out.println("3. By publisher: ");
            System.out.println("4. Exit search.");

            int choice = Validation.CheckInt("Enter your choice: ", 1, 4);
            switch (choice) {
                case 1 -> {
                    String isbn = Validation.checkInputString("Enter book's isbn need to add author: ", "[0-9-]{10,17}");
                    Book b = searchBookByISBN(isbn, bookList);
                    b.display();
                }
                case 2 -> {
                    String authorName = Validation.checkInputString("Enter author: ", "[a-zA-Z .]+");
                    List<Book> listB1 = new ArrayList<>(searchBookByAuthor(authorName, bookList));
                    for (Book book : listB1) {
                        book.display();
                    }
                }
                case 3 -> {
                    String publisher = Validation.checkInputString("Enter publisher: ", "[a-zA-Z0-9 ]+");
                    List<Book> listB2 = new ArrayList<>(searchBookByPublisher(publisher, bookList));
                    for (Book book : listB2) {
                        book.display();
                    }
                }
                case 4 -> check = false;
            }
        }
    }
}
