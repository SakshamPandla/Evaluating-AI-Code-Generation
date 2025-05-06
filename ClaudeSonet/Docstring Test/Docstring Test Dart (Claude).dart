/// Calculates a weighted sum based on the frequency of numbers in the input list.
///
/// This function processes a list of integers by:
/// 1. Counting the frequency of each unique number in the list
/// 2. For each unique number:
///    - If the number is even: adds (number × index) to the result
///    - If the number is odd: subtracts (number × index) from the result
///    Where index ranges from 0 to (frequency-1) for each unique number
///
/// Example:
/// ```
/// complexFunction([1, 2, 2, 3]) returns -1
/// // Breakdown:
/// // 1 appears once: -1×0 = 0
/// // 2 appears twice: 2×0 + 2×1 = 0 + 2 = 2
/// // 3 appears once: -3×0 = 0
/// // Total: 0 + 2 + 0 = 2
/// ```
///
/// @param numbers The list of integers to process
/// @return The calculated weighted sum
int complexFunction(List<int> numbers) {
  int result = 0;
  Map<int, int> frequency = {};

  for (int i = 0; i < numbers.length; i++) {
    if (frequency.containsKey(numbers[i])) {
      frequency[numbers[i]] = frequency[numbers[i]]! + 1;
    } else {
      frequency[numbers[i]] = 1;
    }
  }

  for (var entry in frequency.entries) {
    int value = entry.key;
    int count = entry.value;

    for (int i = 0; i < count; i++) {
      if (value % 2 == 0) {
        result += value * i;
      } else {
        result -= value * i;
      }
    }
  }

  return result;
}
