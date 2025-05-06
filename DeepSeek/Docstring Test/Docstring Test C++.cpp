/**
 * Counts the number of vowel letters in a given string.
 * 
 * The function checks both lowercase and uppercase vowels (a, e, i, o, u).
 * 
 * @param input The string to analyze for vowel content
 * @return The total count of vowels found in the input string
 */
// Function to count vowels in a string
int countVowels(const std::string& input) {
    int count = 0;
    const std::string vowels = "aeiouAEIOU";
    
    for(char c : input) {
        if(vowels.find(c) != std::string::npos) {
            count++;
        }
    }
    return count;
}