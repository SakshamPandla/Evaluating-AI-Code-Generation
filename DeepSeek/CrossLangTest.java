import java.util.Scanner;

public class CrossLangTest {
  public static int binarySearch(int[] arr, int target) {
    int left = 0, right = arr.length - 1;
    while (left <= right) {
      int mid = left + (right - left) / 2;
      if (arr[mid] == target) return mid;
      else if (arr[mid] < target) left = mid + 1;
      else right = mid - 1;
    }
    return -1;
  }

  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    System.out.print("Enter sorted array (space-separated): ");
    String[] input = scanner.nextLine().split(" ");
    int[] arr = new int[input.length];
    for (int i = 0; i < input.length; i++) arr[i] = Integer.parseInt(input[i]);

    System.out.print("Enter target value: ");
    int target = scanner.nextInt();

    int result = binarySearch(arr, target);
    System.out.println(result != -1 ? "Element found at index " + result : "Element not found");
    scanner.close();
  }
}