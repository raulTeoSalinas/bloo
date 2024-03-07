//
//  TabBar.swift
//  Bloo
//
//  Created by Raul Salinas on 3/7/24.
//

import SwiftUI

enum TabbedItems: Int, CaseIterable{
    case home = 0
    case rewards
    case map
    case profile

    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .rewards:
            return "Canjear"
        case .map:
            return "Mapa"
        case .profile:
            return "Perfil"

        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "house.circle.fill"
        case .rewards:
            return "trophy.circle.fill"
        case .map:
            return "map.circle.fill"
        case .profile:
            return "person.circle.fill"

        }
    }
}

struct MainTabbedView: View {
    
    @State var selectedTab = 0
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ZStack(alignment: .bottom){
            ZStack{
                TabView(selection: $selectedTab) {
                    HomeView()
                        .tag(0)
                    
                    RewardsView()
                        .tag(1)
                    
                    MapView()
                        .tag(2)
                    
                    ProfileView()
                        .tag(3)
                    
                    
                }
                
            }
            
            

            if !appState.isWashDisherViewActive {
                HStack {
                    ForEach((TabbedItems.allCases), id: \.self) { item in
                        Button {
                            selectedTab = item.rawValue
                        } label: {
                            CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                        }
                    }
                }
                .padding(6)
                .frame(height: 70)
                .background(.white)
                .cornerRadius(35)
                .padding(.horizontal, 26)
            }
        }
    }
}

extension MainTabbedView{
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        HStack(spacing: 10){
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? Color(red: 0.075, green: 0.329, blue: 0.541) : Color(red: 0.075, green: 0.329, blue: 0.541).opacity(0.7))
                .frame(width: 30, height: 30)
            if isActive{
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(isActive ? .black : .gray)
            }
            Spacer()
        }
        .frame(width: isActive ? .infinity : 60, height: 60)
        .background(isActive ? Color(red: 0.251, green: 0.851, blue: 0.843).opacity(0.5)  : .clear)
        .cornerRadius(30)
        
    }
}
#Preview {
    MainTabbedView()
}
