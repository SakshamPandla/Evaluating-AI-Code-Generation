const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function binarySearch(arr, target) {
  /**
   * Performs binary search on a sorted array.
   * @param {number[]} arr - A sorted array of numbers.
   * @param {number} target - The value to search for.
   * @returns {number} The index of the target in the array if found, otherwise -1.
   */
  let low = 0;
  let high = arr.length - 1;

  while (low <= high) {
    const mid = Math.floor((low + high) / 2); // Calculate middle index

    if (arr[mid] === target) {
      return mid; // Target found
    } else if (arr[mid] < target) {
      low = mid + 1; // Search in the right half
    } else {
      high = mid - 1; // Search in the left half
    }
  }

  return -1; // Target not found
}

// Get input from the user using readline
rl.question("Enter a sorted list of numbers separated by commas: ", (inputListString) => {
  const inputArray = inputListString.split(',').map(Number);

  // Basic validation to check if conversion to numbers was successful
  if (inputArray.some(isNaN)) {
    console.log("Invalid input in the list. Please enter numbers separated by commas.");
    rl.close();
    return;
  }

  rl.question("Enter the target value to search for: ", (targetValueString) => {
    const targetValue = Number(targetValueString);

    // Check if the target value is a valid number
    if (isNaN(targetValue)) {
      console.log("Invalid target value. Please enter a number.");
    } else {
      const resultIndex = binarySearch(inputArray, targetValue);

      if (resultIndex !== -1) {
        console.log(`Target value ${targetValue} found at index ${resultIndex}.`);
      } else {
        console.log(`Target value ${targetValue} not found in the list.`);
      }
    }

    rl.close();
  });
});