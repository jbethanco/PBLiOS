//
//  PropertyWrappers.swift
//  PBLiOS
//
//  Created by John Bethancourt on 12/29/20.
//

import Foundation
import SwiftUI
 
struct DefaultsManager{
    static func stringFor(key: String) -> String {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return ""
        }
        let value = try? JSONDecoder().decode(String.self, from: data)
        return value ?? ""
    }
}

@propertyWrapper
struct AppStorage13<Value: Codable> : DynamicProperty {
    private let key: String
    private let defaultValue: Value
    private let userDefaults: UserDefaults

    init(key: String, defaultValue: Value, store: UserDefaults = .standard) {
        self.key = key
        //self.defaultValue = `default`
        self.defaultValue = defaultValue
        self.userDefaults = store
    }
     
    var wrappedValue: Value {
        get {
            guard let data = userDefaults.data(forKey: key) else {
                return defaultValue
            }
            let value = try? JSONDecoder().decode(Value.self, from: data)
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            userDefaults.set(data, forKey: key)
        }
    }
     
    var projectedValue: Binding<Value> {
        Binding(
            get: { wrappedValue },
            set: {
                print("Setting \($0) for key \(key)")
                let data = try? JSONEncoder().encode($0)
                userDefaults.set(data, forKey: key)
            }
            
        )
    }

}
