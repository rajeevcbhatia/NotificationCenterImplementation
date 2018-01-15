
typealias Observer = (_ notification: String, _ data: Any) -> Void


// wip: find a way to compare closures
//func ==(lhs: Observer, rhs: Observer) -> Bool {
//
//    return lhs == rhs
//}

let observer1: Observer = { (notification, data) -> Void in
    
    print(String.init(describing: data))
    
}

let observer2: Observer = { (notification, data) in
    print("another observer")
}

protocol NotificationCenter {
    func addObserver(for notification: String, observer: @escaping Observer)
    func removeObserver(_ observer: @escaping Observer, for notification: String)
    func postNotification(_ notification: String, data: Any)
}

class NotificationCenterImplementation: NotificationCenter {
    
    static let shared = NotificationCenterImplementation()
    
    private init () {
        
    }
    
    private var dictionaryOfObservers: [String: [Observer]] = [String:[Observer]]()
    
    func addObserver(for notification: String, observer: @escaping Observer) {
        
        //add observer here
        if dictionaryOfObservers[notification] != nil {
            dictionaryOfObservers[notification]?.append(observer)
        }
        else {
            dictionaryOfObservers[notification] = [observer]
        }
        
    }
    
    func removeObserver(_ observer: @escaping Observer, for notification: String) {
        //cannot do this because closures do not conform to equatable
//        if let index = dictionaryOfObservers[notification]?.index(of: observer) {
//            dictionaryOfObservers[notification]?.remove(at: index)
//        }
        
        
        var arrayOfObservers = dictionaryOfObservers[notification]
        guard arrayOfObservers != nil else { return }
        
        for (index,ob) in arrayOfObservers!.enumerated() {
            // same equatable problem. WIP
//            if ob == observer {
//                arrayOfObservers?.remove(at: index)
//                print("removed observer")
//            }
        }
//
        dictionaryOfObservers[notification] = arrayOfObservers
        
    }
    
    func postNotification(_ notification: String, data: Any) {
        
        guard let arrayOfObservers = dictionaryOfObservers[notification] else { return }
        
        for observer in arrayOfObservers {
            
            observer(notification, data)
            
        }
        
    }
    
}


NotificationCenterImplementation.shared.addObserver(for: "Notification Name", observer: observer1)

NotificationCenterImplementation.shared.addObserver(for: "Notification Name", observer: observer2)


NotificationCenterImplementation.shared.postNotification("Notification Name", data: "Notification Data")
NotificationCenterImplementation.shared.postNotification("Notification Name", data: "Notification Data2")

NotificationCenterImplementation.shared.removeObserver(observer2, for: "Notification Name")

NotificationCenterImplementation.shared.postNotification("Notification Name", data: "Notification Data3")

