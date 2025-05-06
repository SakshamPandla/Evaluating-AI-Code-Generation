/// Calculates a result based on the frequency of numbers in the input list.
/// For each number in the list, if the number is even, adds the product of the number and its index (0-based) to the result,
/// otherwise subtracts the product. The operation is repeated for each occurrence of the number.
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
