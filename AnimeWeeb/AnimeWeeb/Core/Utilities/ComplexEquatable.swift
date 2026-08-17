//
//  ComplexEquatable.swift
//

import Foundation

public protocol ComplexEquatable: Hashable, Equatable {}

extension ComplexEquatable {

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.hashValue == rhs.hashValue
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(getObjectInfo(of: self))
    }

    private func getObjectInfo(of instance: Any) -> String {
        let mirror = Mirror(reflecting: instance)
        var result = ""

        for (index, child) in mirror.children.enumerated() {
            if let propertyName = child.label {
                result += "\(index == 0 ? "" : ",")\(propertyName):\(child.value)"
                let childString = getObjectInfo(of: child.value)
                if !childString.isEmpty {
                    result += "{\(childString)}"
                }
            }
        }
        if result.isEmpty {
            return String(describing: instance)
        }
        return result
    }
}
