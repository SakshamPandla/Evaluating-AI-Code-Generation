#include <iostream>
using namespace std; // Fixed: "namspace" typo corrected to "namespace"

// Fixed: main is a function, not an array; needs () not []
int main() {
    // Fixed: declared variables with semicolon instead of colon
    // Fixed: variables weren't initialized
    int bikes = 0, cars = 0;
    
    // Added: prompt for user input
    cout << "Enter number of bikes: ";
    cin >> bikes;
    
    cout << "Enter number of cars: ";
    cin >> cars;
    
    // Fixed: variables being printed without initialization
    cout << "Bikes: " << bikes << ", Cars: " << cars << endl;
    
    // Fixed: calculation error - cars have 4 tires, not 2
    int totalTires = bikes * 2 + cars * 4;
    
    // Fixed: cin reversed to cout for output
    // Fixed: variable name "total_tiress" to "totalTires"
    cout << "Total tires: " << totalTires << endl;
    
    // Added: return statement at the end of main()
    return 0;
}