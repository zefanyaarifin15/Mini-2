import SwiftUI

class UserProgress: ObservableObject {
    @Published var counter: Int = 0
    
    init() {
        loadCounter() 
    }
    
    
    func saveCounter() {
        UserDefaults.standard.set(counter, forKey: "counterKey")
    }
    
    
    func loadCounter() {
        counter = UserDefaults.standard.integer(forKey: "counterKey")
    }
    
    
    func incrementCounter() {
        counter += 1
        saveCounter()
    }
    
    func resetCounter() {
        counter = 0
        saveCounter()
    }
}
