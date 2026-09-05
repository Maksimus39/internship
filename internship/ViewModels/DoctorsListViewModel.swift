import Foundation
import Observation

enum SortOption: String, CaseIterable, Identifiable {
    case price = "По цене ↓"
    case seniority = "По стажу"
    case rating = "По рейтингу"
    
    var id: String { rawValue }
}

@Observable
final class DoctorsListViewModel {
    
    private(set) var users: [User] = []
    var searchText: String = "" {
        didSet { applyFilterAndSort() }
    }
    var selectedSort: SortOption = .price {
        didSet { applyFilterAndSort() }
    }
    
    private let dataService: DataServiceProtocol
    private var allUsers: [User] = []
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
        loadData()
    }
    
    private func loadData() {
        let service = dataService
        
        Task.detached(priority: .userInitiated) {
            let loadedUsers = await service.loadUsers()
            
            await MainActor.run {
                self.allUsers = loadedUsers
                self.applyFilterAndSort()
            }
        }
    }
    
    private func applyFilterAndSort() {
        var result = allUsers
        
        if !searchText.isEmpty {
            let query = searchText.lowercased()
            result = result.filter { user in
                user.fullName.lowercased().contains(query)
            }
        }
        
        switch selectedSort {
        case .price:
            result.sort { $0.minPrice < $1.minPrice }
        case .seniority:
            result.sort { $0.seniority > $1.seniority }
        case .rating:
            result.sort { $0.rating > $1.rating }
        }
        
        users = result
    }
}
