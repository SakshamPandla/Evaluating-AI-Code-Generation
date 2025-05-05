#include <iostream>
#include <vector>
#include <limits> // Required for std::numeric_limits
#include <algorithm> // Required for std::sort if you were to sort the input

int binarySearch(const std::vector<int>& arr, int target) {
    /**
     * Performs binary search on a sorted vector.
     * @param arr - A sorted vector of integers.
     * @param target - The value to search for.
     * @returns The index of the target in the vector if found, otherwise -1.
     */
    int low = 0;
    int high = arr.size() - 1;

    while (low <= high) {
        int mid = low + (high - low) / 2; // Calculate middle index to avoid potential overflow

        if (arr[mid] == target) {
            return mid; // Target found
        } else if (arr[mid] < target) {
            low = mid + 1; // Search in the right half
        } else {
            high = mid - 1; // Search in the left half
        }
    }

    return -1; // Target not found
}

int main() {
    std::cout << "Enter a sorted list of numbers separated by spaces (end with a non-number): ";
    std::vector<int> input_list;
    int num;

    while (std::cin >> num) {
        input_list.push_back(num);
    }

    // Clear the error flag for cin and ignore remaining input
    std::cin.clear();
    std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');

    std::cout << "Enter the target value to search for: ";
    int target_value;
    std::cin >> target_value;

    // It's crucial that the input list is sorted for binary search to work correctly.
    // For simplicity in this example, we assume the user provides a sorted list.

    int result_index = binarySearch(input_list, target_value);

    if (result_index != -1) {
        std::cout << "Target value " << target_value << " found at index " << result_index << "." << std::endl;
    } else {
        std::cout << "Target value " << target_value << " not found in the list." << std::endl;
    }

    return 0;
}