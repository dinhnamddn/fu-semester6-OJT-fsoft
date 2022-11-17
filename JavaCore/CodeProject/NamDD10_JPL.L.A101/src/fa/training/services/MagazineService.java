package fa.training.services;

import Validation.Validation;
import fa.training.entities.Magazine;

import java.util.*;

public class MagazineService {
    public void addNewMagazine(List<Magazine> listMagazine) {
        System.out.println("----------------------------------");
        System.out.println("Add a new magazine.");

        int publicationYear = Validation.CheckInt("Enter publication year: ", 0, 2022);
        String publisher = Validation.checkInputString("Enter publisher: ", "[a-zA-Z0-9 ]+");
        Date publicationDate = Validation.checkDate("Enter publication date: ", "dd-MM-yyyy");
        String author = Validation.checkInputString("Enter author: ", "[a-zA-z .]+");
        int volume = Validation.CheckInt("Enter volume: ", 0, Integer.MAX_VALUE);
        int edition = Validation.CheckInt("Enter edition: ", 0, Integer.MAX_VALUE);

        Magazine maz = new Magazine(publicationYear, publisher, publicationDate, author, volume, edition);
        listMagazine.add(maz);
        Collections.sort(listMagazine, new Comparator<Magazine>() {
            @Override
            public int compare(Magazine o1, Magazine o2) {
                return o1.getPublicationDate().compareTo(o2.getPublicationDate());
            }
        });
    }

    public void displayTop10Magazine(List<Magazine> listMagazine) {
        System.out.println("----------------------------------");
        System.out.println("Display top 10 Magazine.");

        listMagazine.sort((o1, o2) -> Integer.compare(o2.getVolume(), o1.getVolume()));
        for (int i = 0; i < listMagazine.size(); i++) {
            listMagazine.get(i).display();
            if (i == 9) break;
        }
    }
}
