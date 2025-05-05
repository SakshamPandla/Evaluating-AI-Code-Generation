#include <iostream>
#include <algorithm>

int binarySearch(int arr[], int n, int target) {
    int left = 0;
    int right = n - 1;
    while (left <= right) {
        int mid = left + (right - left) / 2;
        if (arr[mid] == target) {
            return mid;
        } else if (arr[mid] < target) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    return -1;
}

int main() {
    int n;
    std::cout << "Enter the number of elements: ";
    std::cin >> n;

    int* arr = new int[n];
    std::cout << "Enter the elements: ";
    for (int i = 0; i < n; i++) {
        std::cin >> arr[i];
    }

    // Sort the array
    std::sort(arr, arr + n);

    int target;
    std::cout << "Enter the target element: ";
    std::cin >> target;

    int result = binarySearch(arr, n, target);

    if (result != -1) {
        std::cout << "Target element " << target << " found at index " << result << "." << std::endl;
    } else {
        std::cout << "Target element " << target << " not found in the array." << std::endl;
    }

    delete[] arr;
    return 0;
}