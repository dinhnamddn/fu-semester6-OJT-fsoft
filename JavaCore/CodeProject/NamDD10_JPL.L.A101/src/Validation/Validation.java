package Validation;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class Validation {
    static Scanner sc = new Scanner(System.in);

    public static int CheckInt(String Mess, int Min, int Max) {
        int num;

        do {
            System.out.print(Mess);
            try {
                num = Integer.parseInt(sc.nextLine());

                if (num >= Min && num <= Max) {
                    break;
                } else {
                    System.out.println("Out of range, Please enter from " + Min + " to " + Max);
                }
            } catch (Exception e) {
                System.out.println("Invalid, accept integer number only!");
            }
        } while (true);

        return num;
    }

    public static String checkInputString(String Mess, String Regex) {
        String s;

        do {
            System.out.print(Mess);
            s = sc.nextLine();

            if (s.matches(Regex)) {
                break;
            }

            System.out.println("Wrong input, try gain!");
        } while (true);
        return s;
    }

    public static Date checkDate(String Mess, String format) {
        Date date;
        String d;

        SimpleDateFormat SD = new SimpleDateFormat(format);
        SD.setLenient(false);

        do {
            System.out.print(Mess);
            try {
                d = sc.nextLine().trim();
                date = SD.parse(d);
                break;
            } catch (Exception e) {
                System.out.println("Wrong input, please enter date by following: '" + format + "'");
            }
        } while (true);

        return date;
    }
}
