package exercise5;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class CommonElements {
    public static void main(String[] args) {
        Integer[] myIntArray1 = {43, 32, 53};
        Integer[] myIntArray2 = {43, 13, 72, 23};

        List<Integer> arr1 = new ArrayList<>(Arrays.asList(myIntArray1));
        List<Integer> arr2 = new ArrayList<>(Arrays.asList(myIntArray2));
        arr1.retainAll(arr2);

        System.out.println("Common elements: " + arr1);
    }
}
