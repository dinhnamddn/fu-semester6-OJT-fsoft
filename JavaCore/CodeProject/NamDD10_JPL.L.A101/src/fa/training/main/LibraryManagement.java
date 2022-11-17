package fa.training.main;

import Validation.Validation;
import fa.training.entities.Book;
import fa.training.entities.Magazine;
import fa.training.services.BookService;
import fa.training.services.MagazineService;
import fa.training.services.PublicationService;

import java.util.ArrayList;
import java.util.List;

public class LibraryManagement {
    public static void main(String[] args) {
        BookService bs = new BookService();
        MagazineService ms = new MagazineService();
        PublicationService ps = new PublicationService();

        List<Book> bookList = new ArrayList<>();
        List<Magazine> listMagazine = new ArrayList<>();

        while (true) {
            System.out.println("\n----------LIBRARY MANAGEMENT---------");
            System.out.println("1. Add a new book.");
            System.out.println("2. Add a new magazine.");
            System.out.println("3. Display books and magazines by publication year and publisher.");
            System.out.println("4. Add author to book.");
            System.out.println("5. Display top 10 magazines largest volume.");
            System.out.println("6. Count all publication by publication year.");
            System.out.println("7. Search book by(isbn, author, publisher).");
            System.out.println("8. Exit.");

            int choice = Validation.CheckInt("Enter your choice: ", 1, 8);
            switch (choice) {
                case 1:
                    bs.addNewBook(bookList);
                    break;
                case 2:
                    ms.addNewMagazine(listMagazine);
                    break;
                case 3:
                    ps.displayByYearAndPublisher(bookList, listMagazine);
                    break;
                case 4:
                    bs.addAuthor(bookList);
                    break;
                case 5:
                    ms.displayTop10Magazine(listMagazine);
                    break;
                case 6:
                    ps.countAllPublicationByYear(bookList, listMagazine);
                    break;
                case 7:
                    bs.searchBook(bookList);
                    break;
                case 8:
                    return;
            }
        }
    }
}
