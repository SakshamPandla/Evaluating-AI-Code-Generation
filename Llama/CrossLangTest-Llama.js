function binarySearch(arr, target) {
    let left = 0;
    let right = arr.length - 1;
    while (left <= right) {
        let mid = Math.floor((left + right) / 2);
        if (arr[mid] === target) {
            return mid;
        } else if (arr[mid] < target) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    return -1;
}

function main() {
    // Get user input for array size and elements
    const readline = require('readline').createInterface({
        input: process.stdin,
        output: process.stdout
    });

    readline.question('Enter the number of elements: ', n => {
        readline.question('Enter the elements (space-separated): ', elements => {
            const arr = elements.split(' ').map(Number).sort((a, b) => a - b);

            readline.question('Enter the target element: ', target => {
                const result = binarySearch(arr, parseInt(target));

                if (result !== -1) {
                    console.log(`Target element ${target} found at index ${result}.`);
                } else {
                    console.log(`Target element ${target} not found in the array.`);
                }

                readline.close();
            });
        });
    });
}

main();