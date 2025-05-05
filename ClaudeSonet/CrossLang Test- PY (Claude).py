def binary_search(arr, target):
    left = 0
    right = len(arr) - 1
    
    while left <= right:
        mid = (left + right) // 2
        
        # Check if target is present at mid
        if arr[mid] == target:
            return mid
        
        # If target is greater, ignore left half
        elif arr[mid] < target:
            left = mid + 1
        
        # If target is smaller, ignore right half
        else:
            right = mid - 1
    
    # Element was not present in array
    return -1

# Get input from user
print("Enter numbers separated by spaces (sorted in ascending order):")
input_array = list(map(int, input().strip().split()))

print("Enter the number to search for:")
target = int(input().strip())

# Perform binary search
result = binary_search(input_array, target)

# Display result
if result != -1:
    print(f"Element found at index {result}")
else:
    print("Element not found in the array")

