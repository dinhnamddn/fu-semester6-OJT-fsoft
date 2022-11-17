package fa.training.excercises2;

import java.util.Scanner;

public class exercise_2 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.println("Input first number: ");
        int n1 = in.nextInt();
        System.out.println("Input second number: ");
        int n2 = in.nextInt();
        System.out.println("Input third number: ");
        int n3 = in.nextInt();
        System.out.println("Input fourth number: ");
        int n4 = in.nextInt();

        if (n1 == n2 && n1 == n3 && n1 == n4) {
            System.out.println("Numbers are equal!");
        } else {
            System.out.println("Numbers are not equal!");
        }
    }
}
