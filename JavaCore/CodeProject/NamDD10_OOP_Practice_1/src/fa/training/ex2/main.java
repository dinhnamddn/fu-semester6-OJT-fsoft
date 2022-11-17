//        Implement a class for a “Book”. Book contains a title (a String), a list of authors (array of authors),
//        number of pages (an integer), price (floating point number), publisher (a String) etc.
//        Write suitable constructor and accessor/modifier methods. Implement a class for “Library”.
//        A library contains a list of books (array of Book). Write add (to add a book) and remove
//        (to delete a book) methods for library. Write a main() function to create a “Library”
//        and add five “Book” to library. Print the total price of all books.

package fa.training.ex2;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class main {
    public static void main(String[] args) {
        List<Book> bookList = new ArrayList<>();
        bookList.add(new Book("abcd", new ArrayList<>(Arrays.asList("qwery")), 1234, 5678, "A"));
        bookList.add(new Book("abce", new ArrayList<>(Arrays.asList("qweru")), 1234, 5678, "A"));
        bookList.add(new Book("abcf", new ArrayList<>(Arrays.asList("qwert")), 1234, 5678, "A"));
        bookList.add(new Book("abcg", new ArrayList<>(Arrays.asList("qweri")), 1234, 5678, "A"));
        bookList.add(new Book("abch", new ArrayList<>(Arrays.asList("qwero")), 1234, 5678, "A"));

        Library lib = new Library(bookList);

        lib.addBook(new Book("zxcv", new ArrayList<>(Arrays.asList("poiuu")), 2345, 7654, "B"));
        lib.removeBook("abcg");

        System.out.println(lib);
        System.out.println("\nTotal price of all books is: " + lib.getTotalPrice());
    }
}