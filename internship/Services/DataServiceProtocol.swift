import Foundation




protocol DataServiceProtocol {
    func loadUsers() -> [User]
}



final class BundleDataService: DataServiceProtocol {
    
    private let filename: String
    
    init(filename: String = "users") {
        self.filename = filename
    }
    
    func loadUsers() -> [User] {
        guard let response = loadJSONFromBundle(filename, as: ApiResponse.self) else {
            return []
        }
        return response.record.data.users.map(UserMapper.map)
    }
}
