#include <iostream>
#include <vector>
using namespace std;

int binarySearch(const vector<int>& arr, int target) {
    int left = 0, right = arr.size() - 1;
    while (left <= right) {
        int mid = left + (right - left) / 2;
        if (arr[mid] == target)
            return mid;
        else if (arr[mid] < target)
            left = mid + 1;
        else
            right = mid - 1;
    }
    return -1;
}

int main() {
    vector<int> arr;
    int n, target, val;

    cout << "Enter number of elements: ";
    cin >> n;
    cout << "Enter sorted elements:\n";
    for (int i = 0; i < n; ++i) {
        cin >> val;
        arr.push_back(val);
    }

    cout << "Enter number to search: ";
    cin >> target;

    int result = binarySearch(arr, target);
    if (result != -1)
        cout << "Element found at index " << result << endl;
    else
        cout << "Element not found\n";

    return 0;
}
