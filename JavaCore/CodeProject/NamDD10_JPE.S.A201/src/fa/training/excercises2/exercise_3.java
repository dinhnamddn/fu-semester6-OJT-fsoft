package fa.training.excercises2;

import java.util.Scanner;

public class exercise_3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n1, n2, n3, n4, n5;

        System.out.print("Input first number: ");
        n1 = sc.nextInt();
        System.out.print("Input second number: ");
        n2 = sc.nextInt();
        System.out.print("Input third number: ");
        n3 = sc.nextInt();
        System.out.print("Input fourth number: ");
        n4 = sc.nextInt();
        System.out.print("Input fifth number: ");
        n5 = sc.nextInt();

        System.out.println("The sum is " + (n1 + n2 + n3 + n4 + n5));
    }
}
