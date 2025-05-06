/// Computes a result based on the frequency of integers in a list and their parity (even or odd).
///
/// This function takes a list of integers, calculates the frequency of each integer,
/// and performs operations on the integers based on their frequency and whether they
/// are even or odd. For each integer:
/// - If the integer is even, it adds the product of the integer and its frequency-based index to the result.
/// - If the integer is odd, it subtracts the product of the integer and its frequency-based index from the result.
///
/// Example:
/// - Input: [2, 2, 3]
/// - Frequency: {2: 2, 3: 1}
/// - Result: For 2 (even): result += (2 * 0) + (2 * 1), For 3 (odd): result -= (3 * 0)
///
/// Returns the computed result as an integer.
///
/// - Parameters:
///   - numbers: A list of integers to process.
/// - Returns: An integer representing the computed result.
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
