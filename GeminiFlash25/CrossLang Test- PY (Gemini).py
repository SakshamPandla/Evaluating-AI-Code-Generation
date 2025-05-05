def binary_search(arr, target):
    """
    Performs binary search on a sorted array.

    Args:
        arr: A sorted list of numbers.
        target: The value to search for.

    Returns:
        The index of the target in the array if found, otherwise -1.
    """
    low = 0
    high = len(arr) - 1

    while low <= high:
        mid = (low + high) // 2  # Calculate middle index

        if arr[mid] == target:
            return mid  # Target found
        elif arr[mid] < target:
            low = mid + 1  # Search in the right half
        else:
            high = mid - 1  # Search in the left half

    return -1  # Target not found

# Get input from the user
try:
    input_list_str = input("Enter a sorted list of numbers separated by spaces: ")
    input_list = list(map(int, input_list_str.split()))

    target_value = int(input("Enter the target value to search for: "))

    # It's crucial that the input list is sorted for binary search to work correctly.
    # You might want to add a check here or instruct the user clearly.
    # For simplicity in this example, we assume the user provides a sorted list.

    result_index = binary_search(input_list, target_value)

    if result_index != -1:
        print(f"Target value {target_value} found at index {result_index}.")
    else:
        print(f"Target value {target_value} not found in the list.")

except ValueError:
    print("Invalid input. Please enter numbers separated by spaces.")