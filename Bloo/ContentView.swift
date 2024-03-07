//
//  ContentView.swift
//  Bloo
//
//  Created by Raul Salinas on 3/6/24.
//

import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image("AGUA_BLANCA")
                    .resizable()
                    .frame(width:100, height: 160)
                Text("BLOO")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                    .padding(.bottom,2)
                Text("Aprende, ahorra y gana.")
                    .foregroundColor(.white)
                    .padding(.bottom)
                
                HStack{
                    TextField(
                        "Email",
                        text: $email
                    )
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .textInputAutocapitalization(.never)
                }
                .background()
                .cornerRadius(20)
                .padding(.horizontal)
                HStack{
                    SecureField(
                        "Contraseña",
                        text: $password
                    )
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .textInputAutocapitalization(.never)
                }
                .background()
                .cornerRadius(20)
                .padding(.horizontal)
                
                NavigationLink(destination: MainTabbedView().navigationBarBackButtonHidden(true)) {
                    
                    HStack {
                        Spacer()
                        Text("Iniciar sesión")
                            .bold()// Texto del botón
                        Spacer()
                    }
                    .padding()
                    .background(Color(red: 0.251, green: 0.851, blue: 0.843) )
                    .foregroundColor(.white)
                    
                    .background()
                    .cornerRadius(20)
                }.padding()

                
                HStack {
                    VStack {
                        Divider()
                            .background(Color.white)
                            .frame(height: 2)
                            .overlay(.white)
                    }
                    
                    
                    
                    Text("O Inicia Sesión Con:")
                        .foregroundColor(.white)
                        .padding(.horizontal, 1)
                        .frame(width: 190, alignment: .center)
                    
                    
                    VStack {
                        Divider()
                            .background(Color.white)
                            .frame(height: 2)
                            .overlay(.white)
                    }
                }
                
                
                HStack{
                    Image("facebook-logo")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Image("google-logo")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Image("apple-logo")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                Text("¿Aún no tienes una cuenta?")
                    .padding(.vertical)
                    .foregroundColor(.white)
                Button(action: {
                    
                }) {
                    HStack {
                        Spacer()
                        Text("Registrarse")
                            .bold()// Texto del botón
                        Spacer()
                    }
                    .padding()
                    .background(Color(red: 0.165, green: 0.573, blue: 0.839))
                    .foregroundColor(.white)
                    
                    .background()
                    .cornerRadius(20)
                }.padding(.horizontal)
                
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Gradient(colors: [
                Color(red: 0.251, green: 0.851, blue: 0.843),
                Color(red: 0.216, green: 0.792, blue: 0.933),
                Color(red: 0.165, green: 0.573, blue: 0.839),
                Color(red: 0.075, green: 0.329, blue: 0.541),
                
            ]))
            
            
            
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
