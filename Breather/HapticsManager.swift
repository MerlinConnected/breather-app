import UIKit

class HapticsManager {
    
    static let shared = HapticsManager()
    
    private let notificationGenerator = UINotificationFeedbackGenerator()
    private let impactGenerator = UIImpactFeedbackGenerator(style: .medium)
    
    private init() {
        // Prepare generators on init
        notificationGenerator.prepare()
        impactGenerator.prepare()
    }
    
    // Call this early in app launch to warm up haptics
    func prepare() {
        notificationGenerator.prepare()
        impactGenerator.prepare()
    }
    
    // Two strong vibrations to signal blocking
    func playBlocked() {
        notificationGenerator.notificationOccurred(.error)
        notificationGenerator.prepare()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            self?.notificationGenerator.notificationOccurred(.error)
            self?.notificationGenerator.prepare()
        }
    }
    
    // Success when resisting temptation
    func playSuccess() {
        notificationGenerator.notificationOccurred(.success)
        notificationGenerator.prepare()
    }
    
    // Light tap when opening app
    func playTap() {
        impactGenerator.impactOccurred()
        impactGenerator.prepare()
    }
}
