import SwiftUI

@main
struct internshipApp: App {
    
    init() {
            // Проверка через сервис
            let service = BundleDataService()
            let users = service.loadUsers()
            
            print("✅ Через сервис загружено врачей: \(users.count)")
            
            if let first = users.first {
                print("👤 \(first.fullName)")
                print("🏥 \(first.specialization)")
                print("⭐ Рейтинг: \(first.rating)")
                print("💼 \(first.seniorityText)")
                print("💰 \(first.formattedPrice)")
                print("📅 Свободные слоты: \(first.hasFreeSlots)")
            }
        }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
