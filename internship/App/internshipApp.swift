import SwiftUI


@main
struct internshipApp: App {
    
    @State private var viewModelDoctorsList = DoctorsListViewModel(dataService: BundleDataService())
      
    var body: some Scene {
        WindowGroup {
            DoctorsListView()
                .environment(viewModelDoctorsList)
        }
    }
}
