package exercise3;

import java.util.Scanner;

public class FrequentNumber {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.printf("Enter length of array: ");
        int len = sc.nextInt();

        int[] intArray = new int[len];
        for (int i = 0; i < len; i++) {
            System.out.printf("Enter number: ");
            intArray[i] = sc.nextInt();
        }

        System.out.printf("Enter value: ");
        int value = sc.nextInt();

        int count = 0;
        int[] indexes = new int[len];

        for (int i = 0; i< len; i++) {
            if (intArray[i] == value) {
                indexes[count] = i;
                count++;
            }
        }

        System.out.println("Amount of frequencies: " + count);
        System.out.printf("Indexes: ");
        for (int i = 0; i < count; i++) {
            System.out.printf(indexes[i] + "    ");
        }
    }
}
