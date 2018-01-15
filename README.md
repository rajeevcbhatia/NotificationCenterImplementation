# NotificationCenterImplementation
A custom NotificationCenter in Swift

An implementation of the `NotificationCenter`

`Observer` is a closure which contains the Notification Name and data. 

`typealias Observer = (_ notification: String, _ data: Any) -> Void`

A protocol called NotificationCenter defines stubs for adding/removing and posting notifications based on the Observer protocol

The `NotificationCenterImplementation` class uses this protocol to provide implementations for these methods.

WIP: the `removeObserver` function
