import java.util.Scanner;

public class CrossLangTestClaude {
    public static int binarySearch(int[] arr, int target) {
        int left = 0;
        int right = arr.length - 1;
        
        while (left <= right) {
            int mid = left + (right - left) / 2; // Prevents overflow for large arrays
            
            // Check if target is present at mid
            if (arr[mid] == target) {
                return mid;
            }
            
            // If target is greater, ignore left half
            else if (arr[mid] < target) {
                left = mid + 1;
            }
            
            // If target is smaller, ignore right half
            else {
                right = mid - 1;
            }
        }
        
        // Element was not present in array
        return -1;
    }
    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("Enter numbers separated by spaces (sorted in ascending order):");
        String input = scanner.nextLine();
        
        // Parse input string to array
        String[] strArray = input.trim().split("\\s+");
        int[] arr = new int[strArray.length];
        
        for (int i = 0; i < strArray.length; i++) {
            arr[i] = Integer.parseInt(strArray[i]);
        }
        
        System.out.println("Enter the number to search for:");
        int target = scanner.nextInt();
        
        // Perform binary search
        int result = binarySearch(arr, target);
        
        // Display result
        if (result != -1) {
            System.out.println("Element found at index " + result);
        } else {
            System.out.println("Element not found in the array");
        }
        
        scanner.close();
    }
}