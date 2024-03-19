//
//  HomeView.swift
//  Bloo
//
//  Created by Raul Salinas on 3/6/24.
//

import SwiftUI



struct Item: Identifiable {
    var id: Int
    var img: String
}

class Store: ObservableObject {
    @Published var items: [Item]
    
    let images: [String] = ["rrr", "dia-agua", "gota-mundo", "cuida-uso"]
    
    // dummy data
    init() {
        items = []
        for i in 0...3{
            let new = Item(id: i, img: images[i])
            items.append(new)
        }
    }
}

struct HomeView: View {
    
    @StateObject var store = Store()
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    @State var activeIndex: Int = 0
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        

 NavigationView{
            ScrollView{
                    VStack{
                        HStack{
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .foregroundColor(Color(red: 0.075, green: 0.329, blue: 0.541))
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35) 
                            
                            Spacer()
                            VStack{
                                Image("AGUA_BLANCA")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 40)
                                Text("BLOO")
                                    .foregroundColor(.white)
                                    .bold()
                            }

                            Spacer()
                            ZStack {
                                Image(systemName: "bell.fill")
                                    .resizable()
                                    .foregroundColor(Color(red: 0.075, green: 0.329, blue: 0.541))
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 20, height: 20)
                                    .offset(x: 12, y: -12)
                                
                                Text("2")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.caption)
                                    .offset(x: 12, y: -13)
                            }.padding(.top, 10)
                        }.padding(.horizontal, 20)
                        VStack{
                            VStack{
                                HStack{
                                    Spacer()
                                    Text("¡Bienvenido, Pedro!")
                                        .padding(.top)
                                        .padding(.horizontal)
                                        .font(.system(size: 14, weight: .heavy))
                                        .font(.custom("Lato-Regular", size: 16))
                                    Spacer()
                                }
                                HStack{
                                    Text("Créditos Disponibles")
                                        .padding(.horizontal)
                                        .padding(.vertical, 2)
                                        .font(.custom("Lato-Regular", size: 16))
                                    Spacer()
                                    HStack{
                                        Image("coin")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 25)
                                        Text("25")
                                            .bold()
                                    }.padding(.horizontal)

                                }
                                HStack{
                                    Text("Litros Salvados")
                                        .padding(.horizontal)
                                        .padding(.vertical, 2)
                                        .font(.custom("Lato-Regular", size: 16))
                                    Spacer()
                                    HStack{
                                        Image("drop")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 25)
                                        Text("32")
                                            .bold()
                                    }.padding(.horizontal)
                                        

                                }
                                HStack{
                                    Text("Recompensas Activas")
                                        .padding(.horizontal)
                                        .padding(.vertical, 2)
                                        .font(.custom("Lato-Regular", size: 16))
                                    Spacer()
                                    HStack{
                                        Image("award")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 25)
                                        Text("22")
                                            .bold()
                                    }.padding(.horizontal)
                                        

                                }.padding(.bottom)
                            }
                            .background(.white)
                            .cornerRadius(20)
                            .padding(.horizontal, 40)
                            
            
            
                        }
                        .shadow(radius: 50)
                        HStack{
                            Spacer()
                            NavigationLink(destination: WashDisherView()) {
                                
                                HStack {
                                    Spacer()
                                    Image(systemName: "play.circle.fill")
                                        .font(.system(size: 25))
                                    Text("Comienza a ahorrar")
                                        .font(.system(size: 20))
                                        .bold()// Texto del botón
                                    Spacer()
                                }
                                .padding()
                                .background(Color(red: 0.251, green: 0.851, blue: 0.843) )
                                .foregroundColor(.white)
                                
                                .background()
                                .cornerRadius(20)
                            }.padding()
                                .shadow(radius: 50)
                                .accentColor(.white)

        
                        }
                        
                        ZStack {
                            ForEach(store.items) { item in
                                
                                // article view
                                Image(item.img)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 200)
                                .cornerRadius(30)
                                
                                .scaleEffect(1.0 - abs(distance(item.id)) * 0.2 )
                                .opacity(1.0 - abs(distance(item.id)) * 0.3 )
                                .offset(x: myXOffset(item.id), y: 0)
                                .zIndex(1.0 - abs(distance(item.id)) * 0.1)
                                
                                // Here is the modifier - on the item, not on the ForEach
                                .onTapGesture {
                                    
                                    // withAnimation is necessary
                                    withAnimation {
                                        
                                        draggingItem = Double(item.id)
                                    }
                                }
                            }
                        }
                        .gesture(getDragGesture())
                    

                        
                        
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
        

                    
                    
                    
                }


            }

            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Gradient(colors: [
                Color(red: 0.251, green: 0.851, blue: 0.843),
                Color(red: 0.216, green: 0.792, blue: 0.933),
                Color(red: 0.165, green: 0.573, blue: 0.839),
                Color(red: 0.075, green: 0.329, blue: 0.541),
                
            ]))
            .onAppear {
                        self.appState.isWashDisherViewActive = false
                    }
        }
        .navigationBarBackButtonHidden(false)
  

    }
    private func getDragGesture() -> some Gesture {
            
            DragGesture()
                .onChanged { value in
                    draggingItem = snappedItem + value.translation.width / 100
                }
                .onEnded { value in
                    withAnimation {
                        draggingItem = snappedItem + value.predictedEndTranslation.width / 100
                        draggingItem = round(draggingItem).remainder(dividingBy: Double(store.items.count))
                        snappedItem = draggingItem
                        
                        //Get the active Item index
                        self.activeIndex = store.items.count + Int(draggingItem)
                        if self.activeIndex > store.items.count || Int(draggingItem) >= 0 {
                            self.activeIndex = Int(draggingItem)
                        }
                    }
                }
        }
        
        func distance(_ item: Int) -> Double {
            return (draggingItem - Double(item)).remainder(dividingBy: Double(store.items.count))
        }
        
        func myXOffset(_ item: Int) -> Double {
            let angle = Double.pi * 2 / Double(store.items.count) * distance(item)
            return sin(angle) * 200
        }
}



#Preview {
    HomeView()
}
