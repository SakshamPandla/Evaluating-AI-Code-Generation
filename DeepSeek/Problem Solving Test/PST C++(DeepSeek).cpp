#include <iostream>
using namespace std; // Corrected typo 'namspace' to 'namespace' and added semicolon

int main() { // Corrected main[] to main() with parentheses and braces
    int bikes, cars; // Fixed colon to semicolon, renamed 'bike' to 'bikes'
    cin >> bikes >> cars; // Replaced cout with cin to input values, using correct variables
    int totaltires = bikes * 2 + cars * 4; // Corrected formula (cars have 4 tires each)
    cout << "Total tires: " << totaltires << endl; // Fixed cin to cout, corrected variable name typo
    return 0; // Added return statement for proper function exit
}