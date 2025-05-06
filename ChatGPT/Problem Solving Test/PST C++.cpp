#include <iostream>  // Correctly includes the input-output stream library
using namespace std; // Fixed typo: "namspace" → "namespace"

int main() { // Fixed: Use parentheses () not square brackets [] for main
    int bikes, cars; // Fixed: Variable names must match; colon (:) replaced with semicolon (;)
    
    cin >> bikes >> cars; // Fixed: use cin to input values; original used cout incorrectly
    cout << bikes << " " << cars << endl; // Optional: Displaying entered values for clarity
    
    int totalTires = bikes * 2 + cars * 4; 
    // Fixed: cars should have 4 tires, not 2; also corrected variable name from totaltires to totalTires (camel case is conventional)
    
    cout << "Total tires: " << totalTires << endl; 
    // Fixed: use cout (not cin) to print, fixed variable name and added semicolon
    
    return 0; // Always good practice to return 0 in main
}
