#include <iostream> // Include the necessary header file for input/output operations
using namespace std; // Corrected the typo in the namespace declaration

int main() { // Changed square brackets [] to parentheses () for the main function
    int bikes, cars; // Corrected variable declaration; replaced ':' with ';'

    // Prompt the user to enter the number of bikes and cars
    cout << "Enter the number of bikes and cars: ";
    cin >> bikes >> cars; // Corrected the use of '>>' for input instead of '<<'

    // Calculate the total number of tires
    int total_tires = bikes * 2 + cars * 4; // Corrected the variable name and added the correct formula for tires (cars have 4 tires)

    // Display the total number of tires
    cout << "Total tires: " << total_tires << endl; // Fixed the output statement and corrected the variable name

    return 0; // Added a return statement to indicate successful program execution
}