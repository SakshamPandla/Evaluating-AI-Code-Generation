// Include the iostream library for input/output operations
#include <iostream>

// Use the standard namespace to avoid prefixing standard library elements
using namespace std; // Fixed typo: 'namspace' -> 'namespace'

int main() { // Fixed: 'main[]' -> 'main()'
    int bikes, cars; // Fixed: 'bike' -> 'bikes' (assuming it's a plural variable), and ':' -> ';'
    
    // Get user input for bikes and cars
    cout << "Enter number of bikes: ";
    cin >> bikes;
    cout << "Enter number of cars: ";
    cin >> cars;

    // Calculate total tires
    int totalTires = bikes * 2 + cars * 4; // Fixed: 'totaltires' -> 'totalTires' (camelCase convention), and cars have 4 tires, not 2
    
    // Display total tires
    cout << "Total tires: " << totalTires << endl; // Fixed: 'cin' -> 'cout', 'bikes << cars' doesn't make sense without operators, 'total_tiress' -> 'totalTires'
    
    return 0; // Added return statement for main function
}