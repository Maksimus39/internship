import SwiftUI

struct DoctorsListView: View {
    @Environment(DoctorsListViewModel.self) private var viewModelDoctorsList
    
    var body: some View {
        AppTabBar()
    }
}
