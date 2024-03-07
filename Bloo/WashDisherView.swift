//
//  WashDisherView.swift
//  Bloo
//
//  Created by Raul Salinas on 3/6/24.
//

import SwiftUI

struct WashDisherView: View {
    
    @EnvironmentObject var appState: AppState


    var body: some View {
        
        ZStack(alignment: .bottom) {
            Image("washDishes")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 850)
                .padding(.top)
            
            HStack {
                            Spacer()
                            VStack(alignment: .leading) {
                                HStack{
                                    Text("Tiempo:")
                                    Spacer()
                                    Text("4:36")
                                        .bold()
                                    Image(systemName: "timer.circle.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor(Color(red: 0.075, green: 0.329, blue: 0.541))
                                }.padding(.horizontal)
                                HStack{
         
                                    Text("Trastes Grandes:")
                                    Spacer()
                                    Text("4")
                                        .bold()

                                }.padding(.horizontal)
                                HStack{

                                    Text("Trastes Chicos:")
                                    Spacer()
                                    Text("2")
                                        .bold()

                                }.padding(.horizontal)
                                HStack{

                                    Text("Utensilios:")
                                    Spacer()
                                    Text("10")
                                        .bold()

                                }.padding(.horizontal)
                                Image("progressBar")
                                
                            }
                            .padding()
                            .padding()
  
                            Spacer()
                        }
            .background(Color.white)
            .cornerRadius(80)
            .overlay(
                    RoundedRectangle(cornerRadius: 80)
                        .stroke(                            LinearGradient(gradient: Gradient(colors: [
                            Color(red: 0.251, green: 0.851, blue: 0.843),
                            Color(red: 0.216, green: 0.792, blue: 0.933),
                            Color(red: 0.165, green: 0.573, blue: 0.839),
                            Color(red: 0.075, green: 0.329, blue: 0.541)
                        ]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 4) // Borde con radio de esquina
                )
        }.padding(0)
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Gradient(colors: [
            Color(red: 0.251, green: 0.851, blue: 0.843),
            Color(red: 0.216, green: 0.792, blue: 0.933),
            Color(red: 0.165, green: 0.573, blue: 0.839),
            Color(red: 0.075, green: 0.329, blue: 0.541),
            
        ]))
        .onAppear {
                    self.appState.isWashDisherViewActive = true
                }
    }
    
    
}

#Preview {
    var appState = AppState()
    return VStack {
        WashDisherView()
    }.environment(appState)
}
