/// Singleton Design Pattern
///
/// Intent: Lets you ensure that a class has only one instance, while providing
/// a global access point to this instance.

import Foundation

class Singleton: NSObject {
    static var shared: Singleton = {
        let instance = Singleton()
        return instance
    }()
    
    private override init() {}
}

extension Singleton: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}

class Client {
    static func singletonCreation() {
        let instance1 = Singleton.shared
        let instance2 = Singleton.shared
        let instance3 = instance1.copy() as! Singleton
        
        print("Instance1: \(instance1)")
        print("Instance2: \(instance2)")
        print("Instance3: \(instance3)")
    }
}

Client.singletonCreation()
