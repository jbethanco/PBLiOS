//
//  DefaultsManager.swift
//  PBLiOS
 

import Foundation
import SwiftUI

enum DefaultName: String {
    case defaultIssuingUnit = "defaultIssuingUnit"
    case defaultMDS = "defaultMDS"
    case defaultHarm = "defaultHarm"
    case defaultUnitCharged = "defaultUnitCharged"
}

struct DefaultsManager{
    
    static func stringFor(key: DefaultName) -> String {
        return self.stringFor(key: key.rawValue)
    }
    
    static func stringFor(key: String) -> String {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return ""
        }
        let value = try? JSONDecoder().decode(String.self, from: data)
        return value ?? ""
    }
   
}

@propertyWrapper
struct YoDefaults<Value: Codable> : DynamicProperty {
    private let key: String
    private let defaultValue: Value
    private let userDefaults: UserDefaults
    
    init(key: DefaultName, defaultValue: Value, store: UserDefaults = .standard) {
        self.key = key.rawValue
        self.defaultValue = defaultValue
        self.userDefaults = store
        if self.userDefaults.object(forKey: key.rawValue) == nil {
            self.wrappedValue = defaultValue
        }
    }

    init(key: String, defaultValue: Value, store: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.userDefaults = store
        if self.userDefaults.object(forKey: key) == nil {
            self.wrappedValue = defaultValue
        }
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
