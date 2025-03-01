////: [Previous](@previous)
//

//1422. Maximum Score After Splitting a String
import Foundation
//

//Code
//
//Testcase
//
//Test Result
//Test Result

//var greeting = "Hello, playground"
//
////: [Next](@next)
//Given a string s of zeros and ones, return the maximum score after splitting the string into two non-empty substrings (i.e. left substring and right substring).
//
//The score after splitting a string is the number of zeros in the left substring plus the number of ones in the right substring.
//
// 
//
//Example 1:
//
//Input: s = "011101"
//Output: 5
//Explanation:
//All possible ways of splitting s into two non-empty substrings are:
//left = "0" and right = "11101", score = 1 + 4 = 5
//left = "01" and right = "1101", score = 1 + 3 = 4
//left = "011" and right = "101", score = 1 + 2 = 3
//left = "0111" and right = "01", score = 1 + 1 = 2
//left = "01110" and right = "1", score = 2 + 1 = 3
//Example 2:
//
//Input: s = "00111"
//Output: 5
//Explanation: When left = "00" and right = "111", we get the maximum score = 2 + 3 = 5
//Example 3:
//
//Input: s = "1111"
//Output: 3
// 
//
//Constraints:
//
//2 <= s.length <= 500
//The string s consists of characters '0' and '1' only

//Solved it in the simplest way possible please refere above leetcode Questions
class Solution {
    func maxScore(_ s: String) -> Int {
        var maxScore = 0
        let array = Array(s)
        
        // Try all possible splits (leaving at least one character on each side)
        for i in 1..<array.count {
            // Get left and right substrings
            let left = array[..<i]
            let right = array[i...]
            
            // Count zeros in left part
            let zerosLeft = left.filter { $0 == "0" }.count
            
            // Count ones in right part
            let onesRight = right.filter { $0 == "1" }.count
            
            // Calculate current score
            let currentScore = zerosLeft + onesRight
            
            // Update maxScore if currentScore is higher
            maxScore = max(maxScore, currentScore)
        }
        
        return maxScore
    }
}


class Solution {
    // Helper function to check if str1 is both prefix and suffix of str2
    func isPrefixAndSuffix(_ str1: String, _ str2: String) -> Bool {
        // If str1 is longer than str2, it can't be both prefix and suffix
        if str1.count > str2.count {
            return false
        }
        
        // Check if str1 is prefix of str2
        let prefix = str2.prefix(str1.count)
        // Check if str1 is suffix of str2
        let suffix = str2.suffix(str1.count)
        
        // Return true only if str1 matches both prefix and suffix
        return String(prefix) == str1 && String(suffix) == str1
    }
    
    func countPrefixSuffixPairs(_ words: [String]) -> Int {
        var count = 0
        
        // Check all possible pairs where i < j
        for i in 0..<words.count {
            for j in (i + 1)..<words.count {
                if isPrefixAndSuffix(words[i], words[j]) {
                    count += 1
                }
            }
        }
        
        return count
    }
}
