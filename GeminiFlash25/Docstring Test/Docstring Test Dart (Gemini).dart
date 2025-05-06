/// Calculates a complex result based on the frequency of each number in the input list.
///
/// For each unique number in the list, it determines its frequency.
/// Then, for each unique number and its frequency, it iterates from 0 up
/// to (frequency - 1). If the number is even, it adds the number multiplied
/// by the current iteration index to a running total. If the number is odd,
/// it subtracts the number multiplied by the current iteration index from
/// the running total.
///
/// @param numbers The list of integers to process.
/// @return The calculated complex result.
int complexFunction(List<int> numbers) {
  int result = 0;
  Map<int, int> frequency = {};

  // Calculate the frequency of each number in the list
  for (int i = 0; i < numbers.length; i++) {
    if (frequency.containsKey(numbers[i])) {
      frequency[numbers[i]] = frequency[numbers[i]]! + 1;
    } else {
      frequency[numbers[i]] = 1;
    }
  }

  // Calculate the result based on frequency and number parity
  for (var entry in frequency.entries) {
    int value = entry.key;
    int count = entry.value;

    for (int i = 0; i < count; i++) {
      if (value % 2 == 0) {
        // If the number is even, add value * i to the result
        result += value * i;
      } else {
        // If the number is odd, subtract value * i from the result
        result -= value * i;
      }
    }
  }

  return result;
}
