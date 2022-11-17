package exercise1;

import java.util.Scanner;

public class SumAverageRunningInt {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.printf("Input a number: ");
        int n = sc.nextInt();
        System.out.printf("Average of 1 to " + n + " is: " + ((n * (n + 1) / 2) / n));
    }
}
