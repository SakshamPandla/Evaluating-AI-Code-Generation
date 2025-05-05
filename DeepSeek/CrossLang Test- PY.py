def binary_search(arr, target):
    left, right = 0, len(arr) - 1
    while left <= right:
        mid = (left + right) // 2
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    return -1

# Get input from user
arr_input = input("Enter sorted array (space-separated): ").strip()
arr = list(map(int, arr_input.split()))
target = int(input("Enter target value: "))

# Perform search and output result
result = binary_search(arr, target)
print(f"Element found at index {result}" if result != -1 else "Element not found")