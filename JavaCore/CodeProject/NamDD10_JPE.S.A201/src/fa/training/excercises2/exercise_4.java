package fa.training.excercises2;

import java.util.Scanner;

public class exercise_4 {
    public static void main(String[] args) {
        double radius = 12.5, height = 4;

        System.out.println("Surface area = " + (2 * Math.PI * radius * (radius + height)));
        System.out.println("Base area = " + (Math.PI * radius * radius));
        System.out.println("Volume = " + (Math.PI * radius * radius * height));
    }
}
