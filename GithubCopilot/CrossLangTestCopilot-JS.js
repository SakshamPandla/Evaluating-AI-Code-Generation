const readline = require('readline');

// Binary Search in JavaScript
function binarySearch(arr, target) {
    let low = 0, high = arr.length - 1;
    while (low <= high) {
        let mid = Math.floor((low + high) / 2);
        if (arr[mid] === target) {
            return mid;
        } else if (arr[mid] < target) {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }
    return -1;
}

// Create readline interface
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Input from user
rl.question("Enter sorted array (comma-separated): ", (input) => {
    const arr = input.split(",").map(Number);
    rl.question("Enter the target value: ", (targetInput) => {
        const target = parseInt(targetInput, 10);

        // Perform binary search
        const result = binarySearch(arr, target);
        if (result !== -1) {
            console.log(`Element found at index ${result}`);
        } else {
            console.log("Element not found");
        }

        rl.close();
    });
});
