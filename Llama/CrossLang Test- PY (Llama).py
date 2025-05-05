def binary_search(arr, target):
    """Perform binary search on a sorted array."""
    left, right = 0, len(arr) - 1
    while left <= right:
        mid = left + (right - left) // 2  # Avoid potential overflow
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    return -1

def get_user_input():
    """Get user input for array size and elements."""
    while True:
        try:
            n = int(input("Enter the number of elements: "))
            if n <= 0:
                print("Please enter a positive integer.")
                continue
            arr = list(map(int, input("Enter the elements (space-separated): ").split()))
            if len(arr) != n:
                print("Number of elements does not match the provided size.")
                continue
            return arr
        except ValueError:
            print("Invalid input. Please enter integers only.")

def main():
    # Get user input for array and target element
    arr = get_user_input()
    arr.sort()  # Binary search requires a sorted array
    print("Sorted array:", arr)

    while True:
        try:
            target = int(input("Enter the target element: "))
            break
        except ValueError:
            print("Invalid input. Please enter an integer.")

    # Perform binary search
    result = binary_search(arr, target)

    if result != -1:
        print(f"Target element {target} found at index {result}.")
    else:
        print(f"Target element {target} not found in the array.")

if __name__ == "__main__":
    main()