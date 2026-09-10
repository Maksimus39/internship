import SwiftUI

struct MainDortorsListView: View {
    @Environment(DoctorsListViewModel.self) private var viewModelDoctorsList
    
    var body: some View {
        @Bindable var viewModel = viewModelDoctorsList
        
        VStack(spacing: 15) {
            Text("Педиатры")
                .font(.system(size: 20, weight: .medium))
                .padding(.horizontal)
            
            // Поиск
            HStack(spacing: 6) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.searchGlyphAssets)
                    .font(.system(size: 15.63))
                
                TextField("Поиск", text: $viewModel.searchText)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.searchGlyphAssets)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                
                if !viewModel.searchText.isEmpty {
                    Button {
                        viewModel.searchText = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .font(.system(size: 17))
                    }
                }
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(.white))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(.searchFieldAssets), lineWidth: 0.5)
            )
            .padding(.horizontal)
            
            // ✅ Кнопки сортировки
            HStack(spacing: 0) {
                ForEach(Array(SortOption.allCases.enumerated()), id: \.element.id) { index, option in
                    Button {
                        viewModel.selectedSort = option
                    } label: {
                        Text(option.rawValue)
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(viewModel.selectedSort == option ? .white : .grayAssets)
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .background(
                                viewModel.selectedSort == option
                                    ? Color("PinkAssets")
                                    : .white
                            )
                    }
                    
                    // ✅ Разделитель между кнопками (используем index, а не el)
                    if index < SortOption.allCases.count - 1 {
                        Rectangle()
                            .fill(Color(.searchFieldAssets))
                            .frame(width: 1, height: 40)
                    }
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(.searchFieldAssets), lineWidth: 1)
            )
            .padding(.horizontal)
            
            Spacer()
        }
        .padding(.top)
        .background(.lightGrayAssets)
    }
}
