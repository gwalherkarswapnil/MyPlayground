//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//implement binary search in matrix of Int with sorted Matrix



func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    guard !matrix.isEmpty, !matrix[0].isEmpty else {
        return false
    }
    
    let rows = matrix.count
    let cols = matrix[0].count
    
    // Treat the matrix as a flattened sorted array.
    var left = 0
    var right = rows * cols - 1
    
    while left <= right {
        let mid = left + (right - left) / 2
        
        // Convert the 1D index back to 2D row and column
        let midValue = matrix[mid / cols][mid % cols]
        
        if midValue == target {
            return true
        } else if midValue < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    return false
}
