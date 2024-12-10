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
