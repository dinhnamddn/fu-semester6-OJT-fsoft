package fa.training.services;

import Validation.Validation;
import fa.training.entities.Book;
import fa.training.entities.Magazine;
import java.util.List;

public class PublicationService {
    public void displayByYearAndPublisher(List<Book> bookList, List<Magazine> listMagazine) {
        System.out.println("----------------------------------");
        System.out.println("Display all book and magazine by publication year and publisher.");

        int publicationYear = Validation.CheckInt("Enter publication year: ", 0, 2022);
        String publisher = Validation.checkInputString("Enter publisher: ", "[a-zA-Z0-9 ]+");

        System.out.println();
        for (Book b : bookList) {
            if (b.getPublicationYear() == publicationYear && b.getPublisher().equals(publisher)) {
                b.display();
            }
        }

        for (Magazine m : listMagazine) {
            if (m.getPublicationYear() == publicationYear && m.getPublisher().equals(publisher)) {
                m.display();
            }
        }
    }

    public void countAllPublicationByYear(List<Book> bookList, List<Magazine> listMagazine) {
        System.out.println("----------------------------------");
        System.out.println("Count all publication by year.");

        int publicationYear = Validation.CheckInt("Enter publication year: ", 0, 2022);

        int count = 0;
        for (Book b : bookList) {
            if (b.getPublicationYear() == publicationYear) {
                count++;
            }
        }

        for (Magazine m : listMagazine) {
            if (m.getPublicationYear() == publicationYear) {
                count++;
            }
        }

        System.out.println("Number of publication in " + publicationYear + ": " + count);
    }
}
