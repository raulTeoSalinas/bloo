//
//  ProfileView.swift
//  Bloo
//
//  Created by Raul Salinas on 3/7/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var tasks = [
        ("Cerrar el grifo al cepillarse los dientes", isChecked: true),
        ("Usar ducha rápida en lugar de bañera", isChecked: false),
        ("Recolectar agua fría mientras calienta la ducha", isChecked: false),
        ("Lavar los platos en tandas, no individualmente", isChecked: true),
        ("Utilizar el agua de cocinar para las plantas", isChecked: false),
        ("Regar jardines y plantas durante la noche", isChecked: false)
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Perfil")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                Image("profile_pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())

                
                Text("Pedro Galván")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                // Achievements section
                Text("Logros")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .fontWeight(.black)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        AchievementView(text: "Reportero destacado", imageName: "star.fill")
                        AchievementView(text: "Top 20", imageName: "star.fill")
                        AchievementView(text: "Guardian", imageName: "star.fill")
                        AchievementView(text: "Cazarrecompensas", imageName: "star.fill")
                        AchievementView(text: "Sabio del ahorro", imageName: "star.fill")
                    }
                    .padding(.horizontal)
                }
                .frame(height: 50) // Set a fixed height for the horizontal ScrollView
                .background(Color.white.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal, 20)
                
                // Personal goals section
                
                Text("Metas personales")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .fontWeight(.black)

                VStack {
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach($tasks, id: \.0) { $task in
                            HStack {
                                
                                Image(systemName: task.isChecked ? "checkmark.square" : "square")
                                    .foregroundColor(task.isChecked ? .yellow : .gray)
                                    .onTapGesture(){
                                        task.isChecked = !task.isChecked
                                    }
                                Text(task.0)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13))
                                    .fontWeight(.semibold)
                             
                            }
                        }
                    }
                    .padding(.all, 10)
                }
                .background(Color.white.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)

                
                // Reports count section
                Text("Recuento de reportes")
                    .font(.headline)
                    .foregroundColor(.white)
                    .fontWeight(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                VStack {
                    VStack(alignment: .leading, spacing: 5) {
                        ReportCountView(type: "Reportes de presión baja", count: 24, imageName: "exclamationmark.circle.fill", colorImage: .yellow)
                        ReportCountView(type: "Reportes de fuga", count: 9, imageName: "exclamationmark.circle.fill", colorImage: .red)
                        ReportCountView(type: "Reportes resueltos", count: 13, imageName: "checkmark.circle.fill", colorImage: .green)
                    }
                    .padding(.all, 10)
                }
                .background(Color.white.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [
            Color(red: 0.251, green: 0.851, blue: 0.843),
            Color(red: 0.216, green: 0.792, blue: 0.933),
            Color(red: 0.165, green: 0.573, blue: 0.839),
            Color(red: 0.075, green: 0.329, blue: 0.541),
        ]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
    }
}

struct AchievementView: View {
    let text: String
    let imageName: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.yellow)
            Text(text)
                .foregroundColor(.black)
                .font(.caption)
                .fontWeight(.bold)
        }
        .padding(5)
        .background(Color.white)
        .cornerRadius(10)
    }
}


struct ReportCountView: View {
    let type: String
    let count: Int
    let imageName: String
    let colorImage: Color
    
    var body: some View {
        HStack {
            Image(systemName: imageName).foregroundColor(colorImage)
            Text(type)
                .font(.subheadline)
                .foregroundColor(.white)
                .fontWeight(.bold)
            Spacer()
            Text("\(count)")
                .font(.subheadline)
                .foregroundColor(.white)
        }
    }
}


#Preview {
    ProfileView()
}
