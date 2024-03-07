//
//  ProfileView.swift
//  Bloo
//
//  Created by Raul Salinas on 3/7/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            Text("Soy Perfil View")
        }            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Gradient(colors: [
                Color(red: 0.251, green: 0.851, blue: 0.843),
                Color(red: 0.216, green: 0.792, blue: 0.933),
                Color(red: 0.165, green: 0.573, blue: 0.839),
                Color(red: 0.075, green: 0.329, blue: 0.541),
                
            ]))
    }
}

#Preview {
    ProfileView()
}
