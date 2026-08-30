import Foundation


// MARK: - Корневой объект ответа
struct ApiResponse: Codable {
    let record: RecordData
    let metadata: Metadata
}

// MARK: - Метаданные
struct Metadata: Codable {
    let id: String
    let isPrivate: Bool
    let createdAt: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case isPrivate = "private"   // "private" — зарезервированное слово в Swift
        case createdAt
        case name
    }
}

// MARK: - Контейнер записей
struct RecordData: Codable {
    let count: Int
    let previous: String?
    let message: String
    let errors: [String]?            // null → Optional
    let data: UsersContainer
}

struct UsersContainer: Codable {
    let users: [UserDTO]
}

// MARK: - Пользователь (DTO — точная копия JSON)
struct UserDTO: Codable, Identifiable {
    let id: String
    let slug: String
    let firstName: String
    let patronymic: String
    let lastName: String
    let gender: String
    let genderLabel: String
    let specialization: [SpecializationDTO]
    let ratings: [RatingItemDTO]
    let ratingsRating: Double
    let seniority: Int
    let textChatPrice: Int
    let videoChatPrice: Int
    let homePrice: Int
    let hospitalPrice: Int
    let avatar: String?
    let nearestReceptionTime: TimeInterval?
    let freeReceptionTime: [FreeSlotDTO]
    let educationTypeLabel: EducationLabelDTO?
    let higherEducation: [HigherEducationDTO]
    let workExpirience: [WorkExperienceDTO]   // ⚠️ Опечатка API сохранена намеренно
    let advancedTraining: [AdvancedTrainingDTO]
    let rank: Int
    let rankLabel: String
    let scientificDegree: Int
    let scientificDegreeLabel: String
    let category: Int
    let categoryLabel: String
    let isFavorite: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, slug
        case firstName      = "first_name"
        case patronymic
        case lastName       = "last_name"
        case gender
        case genderLabel    = "gender_label"
        case specialization, ratings
        case ratingsRating  = "ratings_rating"
        case seniority
        case textChatPrice  = "text_chat_price"
        case videoChatPrice = "video_chat_price"
        case homePrice      = "home_price"
        case hospitalPrice  = "hospital_price"
        case avatar
        case nearestReceptionTime = "nearest_reception_time"
        case freeReceptionTime    = "free_reception_time"
        case educationTypeLabel   = "education_type_label"
        case higherEducation      = "higher_education"
        case workExpirience       = "work_expirience"    // ⚠️ Опечатка из API
        case advancedTraining     = "advanced_training"
        case rank
        case rankLabel            = "rank_label"
        case scientificDegree     = "scientific_degree"
        case scientificDegreeLabel = "scientific_degree_label"
        case category
        case categoryLabel        = "category_label"
        case isFavorite           = "is_favorite"
    }
}

// MARK: - Вложенные DTO-структуры

struct SpecializationDTO: Codable, Identifiable {
    let id: Int
    let name: String
    let isModerated: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case isModerated = "is_moderated"
    }
}

struct RatingItemDTO: Codable, Identifiable {
    let id: Int
    let name: String
    let value: Double
}

struct FreeSlotDTO: Codable {
    let time: TimeInterval
}

struct EducationLabelDTO: Codable, Identifiable {
    let id: Int
    let name: String
}

struct HigherEducationDTO: Codable, Identifiable {
    let id: Int
    let university: String
    let specialization: String
    let qualification: String
    let startDate: TimeInterval
    let endDate: TimeInterval
    let untilNow: Bool
    let isModerated: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, university, specialization, qualification
        case startDate   = "start_date"
        case endDate     = "end_date"
        case untilNow    = "until_now"
        case isModerated = "is_moderated"
    }
}

struct WorkExperienceDTO: Codable, Identifiable {
    let id: Int
    let organization: String
    let position: String
    let startDate: TimeInterval
    let endDate: TimeInterval?
    let untilNow: Bool
    let isModerated: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, organization, position
        case startDate   = "start_date"
        case endDate     = "end_date"
        case untilNow    = "until_now"
        case isModerated = "is_moderated"
    }
}

struct AdvancedTrainingDTO: Codable, Identifiable {
    let id: Int
    let organization: String
    let position: String
    let endDate: TimeInterval
    let file: String
    let isModerated: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, organization, position
        case endDate     = "end_date"
        case file
        case isModerated = "is_moderated"
    }
}
