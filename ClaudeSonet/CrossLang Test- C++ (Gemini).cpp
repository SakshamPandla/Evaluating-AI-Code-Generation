#include <iostream>
#include <vector>
#include <sstream>
#include <string>

int binary_search(const std::vector<int>& arr, int target) {
    int left = 0;
    int right = arr.size() - 1;
    
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

int main() {
    std::vector<int> arr;
    std::string input;
    int target;
    
    std::cout << "Enter numbers separated by spaces (sorted in ascending order):" << std::endl;
    std::getline(std::cin, input);
    
    // Parse input string to array
    std::istringstream iss(input);
    int num;
    while (iss >> num) {
        arr.push_back(num);
    }
    
    std::cout << "Enter the number to search for:" << std::endl;
    std::cin >> target;
    
    // Perform binary search
    int result = binary_search(arr, target);
    
    // Display result
    if (result != -1) {
        std::cout << "Element found at index " << result << std::endl;
    } else {
        std::cout << "Element not found in the array" << std::endl;
    }
    
    return 0;
}