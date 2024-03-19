//
//  MapView.swift
//  Bloo
//
//  Created by Raul Salinas on 3/6/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        
        
        let medUnamMap = CLLocationCoordinate2D(
            latitude: 19.325183824215344,
            longitude: -99.18928710862387)
        
        let fcaUnamMap = CLLocationCoordinate2D(
            latitude: 19.32427167457403,
            longitude: -99.18480536550479)
        
        let arqUnamMap = CLLocationCoordinate2D(
            latitude: 19.33098365980434,
            longitude: -99.187795082356)
        
        let cuUnamMap = CLLocationCoordinate2D(
            latitude: 19.324375428776243,
            longitude: -99.17367814927857)
        
        let presionUnamMap = CLLocationCoordinate2D(
            latitude: 19.334375428776243,
            longitude: -99.17367814927857)
    
        
        VStack{
            Text("Mapa en Tiempo Real")
                .font(.system(size: 22))
                .bold()
                .fontWeight(.heavy)
                .foregroundColor(.white)

            
            HStack{
                Spacer()
                Map(){
                    Marker("FCA UNAM",systemImage: "exclamationmark.circle.fill",  coordinate: fcaUnamMap)
                
                    Marker("Medicina UNAM",systemImage: "exclamationmark.circle.fill",  coordinate: medUnamMap)
                
                    Marker("Arquitectura UNAM",systemImage: "exclamationmark.circle.fill",  coordinate: arqUnamMap)
                
                    Marker("Presión baja",systemImage: "exclamationmark.circle.fill",  coordinate: presionUnamMap)
                
//                    Marker("Metro CU", coordinate: cuUnamMap)
              
                    Marker("Fuga reportada", systemImage: "exclamationmark.circle.fill", coordinate: cuUnamMap)
                }
                    .frame(width: .infinity, height: 400)
                    .cornerRadius(20)
                    .contentMargins(30)
                
                Spacer()
            }

                Text("¡La zona donde te encuentras tiene reportes de fugas!")
                    .bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center) // Alinea el texto al centro
                    .frame(maxWidth: .infinity) // Asegura que el texto ocupe 
        
            
            HStack{
                Spacer()
                    HStack {
                        Spacer()
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                        Text("Reporta presión baja")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(.white)// Texto del botón
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
