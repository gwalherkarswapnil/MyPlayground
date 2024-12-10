import UIKit

var array = [5,5,6,6,7,8,8,9,9]

let rows = 15

for i in 1...rows {
    
    // Print stars
    for _ in 0..<(2 * i - 1) {
        
        print("*", terminator: "")
    }
    // Move to the next line
    print()
    
}


import Foundation

struct Subscription {
    let identifier: String
}

protocol Generator {
    func generateNumbers(_ onNumberGenerated: @escaping (Int) -> Void)
}
class SubscriptionMechanism {
private var generator: Generator
private var bufferSize: Int
private var buffer: [Int] = []
private var subscriptions: [String:(Int) -> Void] = [:]
var transformation: ((Int) -> Int)?

    init(generator: Generator, bufferSize: Int, transformation: ((Int) -> Int)?) {
        self.generator = generator
        self.bufferSize = bufferSize
        self.transformation = transformation
        generator.generateNumbers { [weak self] number in
        guard let self = self else { return }
        let transformedValue = self.transformation?(number) ?? number
        if self.bufferSize > 0 {
            if self.buffer.count == self.bufferSize {
                self.buffer = Array(self.buffer.dropFirst())
            }
            self.buffer.append(transformedValue)
        }
        for subscriber in self.subscriptions.values {
            subscriber(transformedValue)
            }
        }
    }

    func subscribe(onNextNumber: @escaping (Int) -> Void) -> Subscription {
        let identifier = UUID().uuidString
        let subscription = Subscription(identifier: identifier)
        subscriptions[subscription.identifier] = onNextNumber
        for value in buffer {
            onNextNumber(value)
        }
        return subscription
    }

    func removeSubscription(_ subscription: Subscription) -> Bool {
        if subscriptions.removeValue(forKey:subscription.identifier) != nil {
                    return true
        }
        return false
    }

}



