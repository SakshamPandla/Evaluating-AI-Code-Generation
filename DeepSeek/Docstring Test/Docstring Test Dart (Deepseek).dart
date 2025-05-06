/// Calculates a result based on the frequency and parity of each integer in the input list.
///
/// For each integer in the list, the function tracks how many times it occurs. For each occurrence
/// (indexed from 0), if the integer is even, it adds the product of the integer and the occurrence
/// index to the result. If the integer is odd, it subtracts that product. The final result is the
/// sum of all such additions and subtractions.
///
/// Args:
///   numbers (List<int>): A list of integers to process.
///
/// Returns:
///   int: The calculated result based on frequency and parity of each integer.
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
