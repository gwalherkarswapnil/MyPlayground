//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
/*
 
 3223. Minimum Length of String After Operations
 Medium

 Topics
 Companies

 Hint
 You are given a string s.

 You can perform the following process on s any number of times:

 Choose an index i in the string such that there is at least one character to the left of index i that is equal to s[i], and at least one character to the right that is also equal to s[i].
 Delete the closest character to the left of index i that is equal to s[i].
 Delete the closest character to the right of index i that is equal to s[i].
 Return the minimum length of the final string s that you can achieve.

  

 Example 1:

 Input: s = "abaacbcbb"

 Output: 5

 Explanation:
 We do the following operations:

 Choose index 2, then remove the characters at indices 0 and 3. The resulting string is s = "bacbcbb".
 Choose index 3, then remove the characters at indices 0 and 5. The resulting string is s = "acbcb".
 Example 2:

 Input: s = "aa"

 Output: 2

 Explanation:
 We cannot perform any operations, so we return the length of the original string.

  

 Constraints:

 1 <= s.length <= 2 * 105
 s consists only of lowercase English letters.

 
 */
//Choose an index i in the string such that there is at least one character to the left of index i that is equal to s[i], and at least one character to the right that is also equal to s[i].
//Delete the closest character to the left of index i that is equal to s[i].
//Delete the closest character to the right of index i that is equal to s[i].
//Return the minimum length of the final string s that you can achieve.
//my solution 😂  😂😂😂😂😂😂😂😂😂😂😂😂
func minimumLength(_ s: String) -> Int {
    var count = 0
    var left = 0
    var right = s.count - 1
    while left < right {
        if s[left] == s[right] {
            left += 1
            right -= 1
        } else if s[left] < s[right] {
            left += 1
        }
    }
    
    if left == right {
        count += 1
    }
    
    return count
}



/// with help of AI  and stack overflow 

class Solution {
    func minimumLength(_ s: String) -> Int {
        var arr = Array(s)
        var i = 0
        
        while i < arr.count {
            var leftMatch = -1
            var rightMatch = -1
            
            for j in (0..<i).reversed() {
                if arr[j] == arr[i] {
                    leftMatch = j
                    break
                }
            }
            
            // Look for right match
            for j in (i + 1)..<arr.count {
                if arr[j] == arr[i] {
                    rightMatch = j
                    break
                }
            }
            
            // If we found matches on both sides
            if leftMatch != -1 && rightMatch != -1 {
                // Remove right match first (to maintain indices)
                arr.remove(at: rightMatch)
                // Remove left match
                arr.remove(at: leftMatch)
                // Adjust current index since we removed elements
                i = max(0, i - 1)
            } else {
                i += 1
            }
        }
        
        return arr.count
    }
}
