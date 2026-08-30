import SwiftUI

@main
struct internshipApp: App {
    
    init() {
           // Временная проверка парсинга — удалим после Этапа 2
           if let response = loadJSONFromBundle("users", as: ApiResponse.self) {
               let users = response.record.data.users
               print("✅ Успешно распарсено врачей: \(users.count)")
               if let first = users.first {
                   print("👤 Первый: \(first.lastName) \(first.firstName) \(first.patronymic)")
                   print("⭐ Рейтинг: \(first.ratingsRating)")
                   print("💼 Стаж: \(first.seniority) лет")
                   print("💰 Видео: \(first.videoChatPrice) ₽")
               }
           } else {
               print("❌ Не удалось распарсить JSON")
           }
       }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
