function binarySearch(arr, target) {
    let left = 0;
    let right = arr.length - 1;
    
    while (left <= right) {
        let mid = Math.floor((left + right) / 2);
        
        // Check if target is present at mid
        if (arr[mid] === target) {
            return mid;
        }
        
        // If target is greater, ignore left half
        else if (arr[mid] < target) {
            left = mid + 1;
        }
        
        // If target is smaller, ignore right half
        else {
            right = mid - 1;
        }
    }
    
    // Element was not present in array
    return -1;
}

// Using prompt to get user input in a browser environment
function getUserInput() {
    const arrayInput = prompt("Enter numbers separated by spaces (sorted in ascending order):");
    const array = arrayInput.trim().split(" ").map(Number);
    
    const targetInput = prompt("Enter the number to search for:");
    const target = Number(targetInput);
    
    const result = binarySearch(array, target);
    
    if (result !== -1) {
        alert(`Element found at index ${result}`);
    } else {
        alert("Element not found in the array");
    }
}

// For Node.js environment
// Uncomment the code below if running in Node.js


const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
});

readline.question('Enter numbers separated by spaces (sorted in ascending order):\n', arrayInput => {
    const array = arrayInput.trim().split(" ").map(Number);
    
    readline.question('Enter the number to search for:\n', targetInput => {
        const target = Number(targetInput);
        
        const result = binarySearch(array, target);
        
        if (result !== -1) {
            console.log(`Element found at index ${result}`);
        } else {
            console.log("Element not found in the array");
        }
        
        readline.close();
    });
});


// Call the browser version (comment this out if using Node.js version)
// getUserInput();