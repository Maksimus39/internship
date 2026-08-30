import Foundation



enum UserMapper {
    
    nonisolated static func map(from dto: UserDTO) -> User {
        
        let prices = [
            dto.textChatPrice,
            dto.videoChatPrice,
            dto.homePrice,
            dto.hospitalPrice
        ].filter { $0 > 0 }
        
        return User(
            id: dto.id,
            fullName: "\(dto.lastName) \(dto.firstName) \(dto.patronymic)",
            specialization: dto.specialization.first?.name ?? "Врач",
            seniority: dto.seniority,
            rating: dto.ratingsRating,
            avatarURL: dto.avatar.flatMap { URL(string: $0) },
            minPrice: prices.min() ?? 0,
            hasFreeSlots: !dto.freeReceptionTime.isEmpty || dto.nearestReceptionTime != nil
        )
    }
}
