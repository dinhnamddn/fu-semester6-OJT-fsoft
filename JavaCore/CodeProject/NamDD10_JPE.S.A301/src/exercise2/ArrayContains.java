package exercise2;

import java.util.Scanner;

public class ArrayContains {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.printf("Enter length of string array: ");
        int length = sc.nextInt();

        String[] stringArray = new String[length];
        for (int i = 0; i < length; i++) {
            System.out.printf("Enter string " + i + ": ");
            stringArray[i] = sc.next();
        }

        System.out.printf("Enter string you are looking for: ");
        String sValue = sc.next();

        for (String o : stringArray) {
            if (o.equals(sValue)) {
                System.out.printf("Check '" + sValue + "' in Array: Contained!");
                return;
            }
        }
        System.out.printf("Check '" + sValue + "' in Array: No Contain!");
    }
}