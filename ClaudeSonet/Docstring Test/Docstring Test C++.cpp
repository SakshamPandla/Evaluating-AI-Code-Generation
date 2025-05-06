/**
 * @brief Counts the number of vowels in a string
 * 
 * This function iterates through each character of the input string and
 * checks if it's a vowel (a, e, i, o, u - case insensitive). The function
 * considers both uppercase and lowercase vowels.
 * 
 * @param input The string to count vowels in
 * @return int The total number of vowels found in the input string
 */
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