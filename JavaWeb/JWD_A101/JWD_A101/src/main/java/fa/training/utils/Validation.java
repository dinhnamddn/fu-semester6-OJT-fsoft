package fa.training.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Validation {
    BufferedReader in = new BufferedReader(new InputStreamReader(System.in));

    public int inputInteger(String message) {
        int n;
        while (true) {
            try {
                System.out.print(message);
                n = Integer.parseInt(in.readLine());
                break;
            } catch (Exception e) {
                System.out.println("Please enter as a integer number");
            }
        }
        return n;
    }

    public String inputStringRegex(String message, String regex) throws IOException {
        String str;
        while (true) {
            System.out.print(message);
            str = in.readLine().trim();
            if (str.matches(regex)) {
                break;
            } else {
                System.out.println("Re-input!");
            }
        }
        return str;
    }

    public String inputString(String message) throws IOException {
        String str;
        System.out.print(message);
        str = in.readLine().trim().replaceAll("\\s+", " ");
        return str;
    }

    public int inputLimit(String message, int min, int max) {
        while (true) {
            int i = inputInteger(message);
            if (i >= min && i <= max) {
                return i;
            } else {
                System.out.println("Please enter integer number from " + min + " - " + max);
            }
        }
    }

    public int inputPositiveInt(String message) {
        while (true) {
            int i = inputInteger(message);
            if (i > 0) {
                return i;
            } else {
                System.out.println("Please enter integer number > 0");
            }
        }
    }

    public String inputGender(String message) throws IOException {
        String str;
        while (true) {
            System.out.print(message);
            str = in.readLine().trim();
            if (str.equalsIgnoreCase("M") || str.equalsIgnoreCase("F")) {
                break;
            } else {
                System.out.println("Re-input M (male) or F (female)!");
            }
        }
        return str;
    }

    public java.sql.Date inputDate(String message) throws IOException {
        String str;
        Date date = null;
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        f.setLenient(false);
        while (true) {
            System.out.print(message);
            str = in.readLine().trim();
            try {
                date = f.parse(str);
                if (!str.equals(f.format(date))) {
                    continue;
                }
                return java.sql.Date.valueOf(str);
            } catch (ParseException e) {
                System.out.println("Re-input");
            }
        }
    }

    public java.sql.Date inputToDate(String message, Date fromDate) throws IOException {
        while (true) {
            java.sql.Date toDate = inputDate(message);
            if (fromDate.before(toDate))
                return toDate;
            else System.out.println("ToDate must be greater than FromDate");
        }
    }

}
