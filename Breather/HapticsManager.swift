import UIKit

class HapticsManager {
    
    static let shared = HapticsManager()
    
    private init() {}
    
    // Two strong vibrations to signal blocking
    func playBlocked() {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(.error)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            let generator2 = UINotificationFeedbackGenerator()
            generator2.prepare()
            generator2.notificationOccurred(.error)
        }
    }
    
    // Success when resisting temptation
    func playSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(.success)
    }
    
    // Light tap when opening app
    func playTap() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare()
        generator.impactOccurred()
    }
}
