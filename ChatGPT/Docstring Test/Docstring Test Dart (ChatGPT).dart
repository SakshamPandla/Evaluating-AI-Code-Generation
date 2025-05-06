/// Calculates a result based on the frequency and parity (even or odd) of numbers in the list.
///
/// For each unique number in the input list:
/// - If the number is even, it adds `number * i` to the result for each occurrence `i`.
/// - If the number is odd, it subtracts `number * i` from the result for each occurrence `i`.
///
/// Example:
/// For input [2, 2, 3],
/// - 2 appears twice: adds 2*0 + 2*1 = 2
/// - 3 appears once: subtracts 3*0 = 0
/// Total result = 2
///
/// Returns the final computed integer result.
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
