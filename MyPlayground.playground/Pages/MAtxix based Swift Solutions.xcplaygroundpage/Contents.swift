//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
import Foundation

// Function to multiply two matrices
func multiplyMatrices(A: [[Int]], B: [[Int]]) -> [[Int]]? {
    // Check if the number of columns in A equals the number of rows in B
    guard A[0].count == B.count else {
        print("Matrix dimensions do not allow multiplication")
        return nil
    }

    let rowsA = A.count
    let colsA = A[0].count
    let rowsB = B.count
    let colsB = B[0].count

    // Initialize the resulting matrix with zeros
    var result = Array(repeating: Array(repeating: 0, count: colsB), count: rowsA)
    
    // Perform the multiplication
    for i in 0..<rowsA {
        for j in 0..<colsB {
            for k in 0..<colsA {
                result[i][j] += A[i][k] * B[k][j]
            }
        }
    }

    return result
}

// Example 3x5 Matrix A
let A: [[Int]] = [
    [1, 2, 3, 4, 5],
    [6, 7, 8, 9, 10],
    [11, 12, 13, 14, 15]
]

// Example 5x3 Matrix B
let B: [[Int]] = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [10, 11, 12],
    [13, 14, 15]
]

// Multiply matrices
if let result = multiplyMatrices(A: A, B: B) {
    print("Resultant Matrix C (3x3):")
    for row in result {
        print(row)
    }
} else {
    print("Matrix multiplication failed due to incompatible dimensions.")
}



class Solution {
func maxCount(banned: [Int], n: Int, maxSum: Int) -> Int {
    // Convert banned array to a Set for efficient lookup
    let bannedSet = Set(banned)
    
    var sum = 0
    var count = 0
    
    // Iterate through the numbers from 1 to n
    for i in 1...n {
        // Skip if the number is banned
        if bannedSet.contains(i) {
            continue
        }
        
        // If adding the current number exceeds maxSum, stop
        if sum + i > maxSum {
            break
        }
        
        // Otherwise, add the number to the sum and increment the count
        sum += i
        count += 1
    }
    
    return count
}

}


//func SearchingChallenge(_ str: String) -> Int {
//   var stack: [Character] = []
//   //the below can have different kinds of Brackets now in this case only using one ()
//  let matchingBrackets: [Character: Character] = ["(" : ")"]
//  for char in str {
//    if char == "(" {
//      stack.append(char)
//    } else {
//      if stack.isEmpty || stack.last != matchingBrackets[char] {
//        return 0
//      }
//      stack.removeLast()
//    }
//     }
//  
//  // Note: feel free to modify the return type of this function
//  return stack.isEmpty ? 1 : 0
//
//}
//
//
//func StringChallenge(_ str: String) -> String {
//var ChallengeToken = "ynuot829a0"
//var comressed = ""
//var count = 1
//var character = Array(str)
//for i in 1 ..<charatcters.count {
//if charatcters[i] == charatcters[i-1] {
//  count += 1
//} else {
//  compressed += "\(count)\(characters(i-1)))"
//  count = 1
//}
//  compressed += "\(count)\(characters.last))"
//}
//
//var finaloutPut = ""
//
//for char in compressed {
//  if ChallengeToken.contains(char) {
//    finaloutPut += "-[\(char)]-"
//  } else {
//    finaloutPut.append(char)
//  }
//}
//  
//  return finaloutPut
//
//}


//
//class Solution {
// func maximumLength(_ s: String) -> Int {
// let chars = Array(s)
// let n = chars.count
// 
// // Function to count non-overlapping occurrences of a substring
// func countOccurrences(_ substring: [Character]) -> Int {
// var count = 0
// var i = 0
// let subLength = substring.count
// 
// while i <= n - subLength {
// if Array(chars[i..<(i + subLength)]) == substring {
// count += 1
// i += 1 // Move to the next position for overlapping count
// } else {
// i += 1
// }
// }
// return count
// }

//
//Find Score of an Array After Marking All Elements
//Attempted
//Medium
//
//Topics
//Companies
//
//Hint
//You are given an array nums consisting of positive integers.
//
//Starting with score = 0, apply the following algorithm:
//
//Choose the smallest integer of the array that is not marked. If there is a tie, choose the one with the smallest index.
//Add the value of the chosen integer to score.
//Mark the chosen element and its two adjacent elements if they exist.
//Repeat until all the array elements are marked.
//Return the score you get after applying the above algorithm.
//
// 
//
//Example 1:
//
//Input: nums = [2,1,3,4,5,2]
//Output: 7
//Explanation: We mark the elements as follows:
//- 1 is the smallest unmarked element, so we mark it and its two adjacent elements: [2,1,3,4,5,2].
//- 2 is the smallest unmarked element, so we mark it and its left adjacent element: [2,1,3,4,5,2].
//- 4 is the only remaining unmarked element, so we mark it: [2,1,3,4,5,2].
//Our score is 1 + 2 + 4 = 7.
//Example 2:
//
//Input: nums = [2,3,5,1,3,2]
//Output: 5
//Explanation: We mark the elements as follows:
//- 1 is the smallest unmarked element, so we mark it and its two adjacent elements: [2,3,5,1,3,2].
//- 2 is the smallest unmarked element, since there are two of them, we choose the left-most one, so we mark the one at index 0 and its right adjacent element: [2,3,5,1,3,2].
//- 2 is the only remaining unmarked element, so we mark it: [2,3,5,1,3,2].
//Our score is 1 + 2 + 2 = 5.
// 
//
//Constraints:
//
//1 <= nums.length <= 105
//1 <= nums[i] <= 106
class Solution2 {
func findScore(_ nums: [Int]) -> Int {
    var score = 0
    var marked = Set<Int>() // To track indices of marked elements.

    while true {
        var smallestNumber = Int.max
        var smallestIndex = -1
        
        // Find the smallest unmarked number with the smallest index.
        for (index, value) in nums.enumerated() {
            if !marked.contains(index) && value < smallestNumber {
                smallestNumber = value
                smallestIndex = index
            }
        }
        
        // If no unmarked element is found, exit the loop.
        if smallestIndex == -1 {
            break
        }
        
        // Add the smallest number to the score.
        score += smallestNumber
        
        // Mark the smallest element and its adjacent elements.
        marked.insert(smallestIndex)
        if smallestIndex > 0 { marked.insert(smallestIndex - 1) }
        if smallestIndex < nums.count - 1 { marked.insert(smallestIndex + 1) }
    }

    return score
}


func findSmallestNumberAndIndexMemoryEfficient(array: [Int]) -> (number: Int, index: Int)? {
    guard !array.isEmpty else { return nil }
    var smallestNumber = array[0]
    var smallestIndex = 0
    for (index, value) in array.enumerated() {
        if value < smallestNumber {
            smallestNumber = value
            smallestIndex = index
        }
    }
    return (smallestNumber, smallestIndex)
}

}
