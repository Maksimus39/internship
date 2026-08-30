import Foundation

struct User: Identifiable {
    let id: String
    let fullName: String
    let specialization: String
    let seniority: Int
    let rating: Double
    let avatarURL: URL?
    let minPrice: Int
    let hasFreeSlots: Bool
    
    var formattedPrice: String {
        minPrice > 0 ? "от \(minPrice) ₽" : "Бесплатно"
    }
    
    var seniorityText: String {
        "стаж \(seniority) лет"
    }
}
