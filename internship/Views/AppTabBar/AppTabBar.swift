import SwiftUI

struct TabItem: Identifiable {
    let id: Int
    let icon: TabIcon
    let label: String
    let view: AnyView?
}

enum TabIcon {
    case system(String)
    case asset(String)
    
    @ViewBuilder
    func image(size: CGFloat, color: Color) -> some View {
        switch self {
        case .system(let name):
            Image(systemName: name)
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
                .foregroundColor(color)
            
        case .asset(let name):
            Image(name)
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
                .colorMultiply(color)
                .brightness(0.25)
        }
    }
}

struct AppTabBar: View {
    
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var selectedPage: Int = 0
    
    private let activeColor = Color("PinkAssets")
    private let inactiveColor = Color("GrayAssets")
    private let tabs: [TabItem] = [
        TabItem(id: 0,
                icon: .system("house.fill"),
                label: "Главная",
                view: AnyView(MainDortorsListView())),
        TabItem(id: 1,
                icon: .asset("calendar"),
                label: "Приёмы",
                view: nil),
        TabItem(id: 2,
                icon: .system("message.fill"),
                label: "Чат",
                view: nil),
        TabItem(id: 3,
                icon: .system("person.fill"),
                label: "Профиль",
                view: nil)
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedPage) {
                ForEach(tabs) { tab in
                    if let view = tab.view {
                        view
                            .tag(tab.id)
                    } else {
                        VStack(spacing: 20) {
                            Image(systemName: "pencil.circle.fill")
                                .font(.system(size: 60))
                                .foregroundColor(.gray)
                            
                            Text("Экран \"\(tab.label)\" в разработке")
                                .font(.title2)
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color(.systemBackground))
                        .tag(tab.id)
                    }
                }
            }
            
            HStack {
                ForEach(tabs) { tab in
                    tabButton(tab)
                }
            }
            .background(
                Rectangle()
                    .fill(.white)
                    .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: -2)
                    .ignoresSafeArea(edges: .bottom)
            )
        }
    }
    
    private func tabButton(_ tab: TabItem) -> some View {
        Button {
            selectedPage = tab.id
        } label: {
            VStack(spacing: 5) {
                let color = selectedPage == tab.id ? activeColor : inactiveColor
                
                ZStack(alignment: .topTrailing) {
                    tab.icon.image(size: 32, color: color)
                }
                .padding(.top, 13)
                
                Text(tab.label)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(inactiveColor)
                    .padding(.bottom, 19)
            }
            .frame(maxWidth: .infinity)
        }
    }
}



#Preview {
    AppTabBar()
}
