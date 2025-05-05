const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
});

function binarySearch(arr, target) {
    let left = 0, right = arr.length - 1;
    while (left <= right) {
        let mid = Math.floor((left + right) / 2);
        if (arr[mid] === target) return mid;
        else if (arr[mid] < target) left = mid + 1;
        else right = mid - 1;
    }
    return -1;
}

readline.question("Enter sorted numbers separated by space: ", input => {
    const arr = input.split(' ').map(Number);
    readline.question("Enter the number to search: ", num => {
        const target = parseInt(num);
        const result = binarySearch(arr, target);
        console.log(result !== -1 ? `Element found at index ${result}` : "Element not found");
        readline.close();
    });
});
