package GeminiFlash25;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.Collections; // Required for Collections.sort if you were to sort the input

public class GeminiJavaCrossLangTest {

    public static int binarySearch(ArrayList<Integer> arr, int target) {
        /**
         * Performs binary search on a sorted ArrayList.
         * @param arr - A sorted ArrayList of integers.
         * @param target - The value to search for.
         * @returns The index of the target in the ArrayList if found, otherwise -1.
         */
        int low = 0;
        int high = arr.size() - 1;

        while (low <= high) {
            int mid = low + (high - low) / 2; // Calculate middle index to avoid potential overflow

            if (arr.get(mid) == target) {
                return mid; // Target found
            } else if (arr.get(mid) < target) {
                low = mid + 1; // Search in the right half
            } else {
                high = mid - 1; // Search in the left half
            }
        }

        return -1; // Target not found
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ArrayList<Integer> inputList = new ArrayList<>();

        System.out.println("Enter a sorted list of numbers separated by spaces (end with a non-number):");

        while (scanner.hasNextInt()) {
            inputList.add(scanner.nextInt());
        }

        System.out.println("Enter the target value to search for:");
        // Consume the remaining newline character after reading integers
        scanner.nextLine();
        int targetValue = scanner.nextInt();

        // It's crucial that the input list is sorted for binary search to work correctly.
        // For simplicity in this example, we assume the user provides a sorted list.

        int resultIndex = binarySearch(inputList, targetValue);

        if (resultIndex != -1) {
            System.out.println("Target value " + targetValue + " found at index " + resultIndex + ".");
        } else {
            System.out.println("Target value " + targetValue + " not found in the list.");
        }

        scanner.close();
    }
}