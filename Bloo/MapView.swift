//
//  MapView.swift
//  Bloo
//
//  Created by Raul Salinas on 3/6/24.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        VStack{
            Text("Mapa en Tiempo Real")
                .bold()
                .foregroundColor(.white)
            Image("map")
                .cornerRadius(20)
                
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 4) // Borde con radio de esquina
                )

                Text("¡La zona donde te encuentras tiene reportes de fugas!")
                    .bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center) // Alinea el texto al centro
                    .frame(maxWidth: .infinity) // Asegura que el texto ocupe todo el ancho disponible
            HStack{
                Spacer()

                    
                    HStack {
                        Spacer()
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.system(size: 25))
                        Text("Reporta presión baja")
                            .font(.system(size: 20))
                            .bold()// Texto del botón
                        Spacer()
                    }
                    .padding(5)
                    .background(Color.yellow)
                    
                    .background()
                    .cornerRadius(20)
            }.padding(.horizontal)
    
            .shadow(radius: 50)
            
            HStack{
                Spacer()

                    
                    HStack {
                        Spacer()
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                        Text("Reporta una fuga")
                            .font(.system(size: 20))
                            .bold()// Texto del botón
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(5)
                    .background(Color.red)
                    
                    .background()
                    .cornerRadius(20)
            }.padding(.horizontal)
                .padding(.top)
            .shadow(radius: 50)
            
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
    MapView()
}
