#include <iostream>
#include <vector>
#include <sstream>
using namespace std;

int binarySearch(vector<int>& arr, int target) {
  int left = 0, right = arr.size() - 1;
  while (left <= right) {
    int mid = left + (right - left) / 2; // Avoid overflow
    if (arr[mid] == target) return mid;
    else if (arr[mid] < target) left = mid + 1;
    else right = mid - 1;
  }
  return -1;
}

int main() {
  string input;
  cout << "Enter sorted array (space-separated): ";
  getline(cin, input);
  stringstream ss(input);
  vector<int> arr;
  int num;
  while (ss >> num) arr.push_back(num);

  int target;
  cout << "Enter target value: ";
  cin >> target;

  int result = binarySearch(arr, target);
  if (result != -1) cout << "Element found at index " << result;
  else cout << "Element not found";
  return 0;
}