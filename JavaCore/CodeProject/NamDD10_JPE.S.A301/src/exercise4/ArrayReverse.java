package exercise4;


public class ArrayReverse {
    public static void main(String[] args) {
        int[] myIntArray = { 43, 32, 53, 23, 12, 34, 3, 12, 43, 32 };
        System.out.printf("Original Array:");
        printArray(myIntArray);

        int[] tmp = reverse(myIntArray);

        System.out.printf("\nReversed Array:");
        printArray(tmp);
    }

    static int[] reverse(int a[]) {
        int n = a.length;
        int[] b = new int[n];
        for (int i = 0; i < n; i++) {
            b[n - 1 - i] = a[i];
        }
        return b;
    }

    static void printArray(int a[]) {
        for (int i = 0; i < a.length; i++) {
            System.out.printf(" " + a[i]);
            if (i != a.length - 1) {
                System.out.printf(",");
            }
        }
    }
}
