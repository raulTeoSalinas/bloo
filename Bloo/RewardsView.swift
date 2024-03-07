//
//  RewardsView.swift
//  Bloo
//
//  Created by Raul Salinas on 3/7/24.
//

import SwiftUI

struct ListItemView: View {
    var nombreEmpresa: String
    var descripcion: String
    var cantidad: String
    var img: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(img)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .cornerRadius(8)
                    .padding(.leading)
                VStack(alignment: .leading) {
                    Text(nombreEmpresa)
                        .font(.headline)
                        .foregroundColor(.black)
                    Text(descripcion)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Créditos: \(cantidad)")
                        .font(.subheadline)
                        
                }
                
                Spacer()
                Button(action: {
                    // Acción al hacer clic en el botón "Canjear"
                }) {
                    Text("Canjear")
                        .foregroundColor(Color.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 4)
                        .background(Color(red: 0.251, green: 0.851, blue: 0.843))
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                }.padding(.horizontal)
                
                
            }.background()
            .cornerRadius(10)
                
        }
            .padding(.horizontal)
            .cornerRadius(10)
            
            
           
    }
}
struct ListItem: Hashable {
    var nombreEmpresa: String
    var descripcion: String
    var cantidad: String
    var img: String
}
struct RewardsView: View {
    
    var listItems = [
        ListItem(nombreEmpresa: "Nike", descripcion: "Obtén un 20% de descuento en productos seleccionados", cantidad: "\(Int.random(in: 10...20))", img: "nike"),
        ListItem(nombreEmpresa: "Six Flags", descripcion: "Compra 2 boletos y obtén 1 gratis", cantidad: "\(Int.random(in: 10...20))", img: "sixFlags"),
        ListItem(nombreEmpresa: "Cinepolis", descripcion: "Combo familiar de palomitas y refrescos a mitad de precio", cantidad: "\(Int.random(in: 10...20))", img: "cinepolis"),
        ListItem(nombreEmpresa: "Oxxo", descripcion: "Obtén una bebida gratis en la compra de snacks", cantidad: "\(Int.random(in: 10...20))", img: "oxxo"),
        ListItem(nombreEmpresa: "Apple", descripcion: "Descuento de $500 MXN en la compra de un nuevo iPhone", cantidad: "\(Int.random(in: 10...20))", img: "apple"),
        ListItem(nombreEmpresa: "Nike", descripcion: "Compra un par de tenis y obtén el segundo al 50% de descuento", cantidad: "\(Int.random(in: 10...20))", img: "nike"),
        ListItem(nombreEmpresa: "Six Flags", descripcion: "Descuento del 20% en la compra de alimentos y bebidas dentro del parque", cantidad: "\(Int.random(in: 10...20))", img: "sixFlags"),
        ListItem(nombreEmpresa: "Cinepolis", descripcion: "Obtén un boleto gratis en la compra de boletos para una función matutina", cantidad: "\(Int.random(in: 10...20))", img: "cinepolis"),
        ListItem(nombreEmpresa: "Oxxo", descripcion: "Compra una revista y llévate una bebida energética gratis", cantidad: "\(Int.random(in: 10...20))", img: "oxxo"),
        ListItem(nombreEmpresa: "Apple", descripcion: "Oferta especial para estudiantes: 15% de descuento en MacBooks", cantidad: "\(Int.random(in: 10...20))", img: "apple"),
        ListItem(nombreEmpresa: "Nike", descripcion: "Descuento del 30% en ropa deportiva de la nueva temporada", cantidad: "\(Int.random(in: 10...20))", img: "nike"),
        ListItem(nombreEmpresa: "Six Flags", descripcion: "Boleto de entrada gratis en tu cumpleaños", cantidad: "\(Int.random(in: 10...20))", img: "sixFlags"),
        ListItem(nombreEmpresa: "Cinepolis", descripcion: "Compra una tarjeta de regalo y recibe un descuento adicional del 10%", cantidad: "\(Int.random(in: 10...20))", img: "cinepolis"),
        ListItem(nombreEmpresa: "Oxxo", descripcion: "Promoción 2x1 en cervezas importadas", cantidad: "\(Int.random(in: 10...20))", img: "oxxo"),
        ListItem(nombreEmpresa: "Apple", descripcion: "Financiamiento a meses sin intereses en todos los productos", cantidad: "\(Int.random(in: 10...20))", img: "apple"),
        ListItem(nombreEmpresa: "Nike", descripcion: "Compra una playera y llévate unos shorts gratis", cantidad: "\(Int.random(in: 10...20))", img: "nike"),
        ListItem(nombreEmpresa: "Six Flags", descripcion: "Descuento especial para portadores de tarjeta de crédito", cantidad: "\(Int.random(in: 10...20))", img: "sixFlags"),
        ListItem(nombreEmpresa: "Cinepolis", descripcion: "Promoción de palomitas refrescos a precio especial para grupos", cantidad: "\(Int.random(in: 10...20))", img: "cinepolis"),
        ListItem(nombreEmpresa: "Oxxo", descripcion: "Compra una botella de agua y recibe una bolsa de papas gratis", cantidad: "\(Int.random(in: 10...20))", img: "oxxo"),
        ListItem(nombreEmpresa: "Apple", descripcion: "Descuento del 10% en accesorios para iPhone", cantidad: "\(Int.random(in: 10...20))", img: "apple")
    ]
    
    var body: some View {
        ScrollView{
            HStack{
                Spacer()
                HStack{
                    HStack{
                        Text("Mis Créditos:")
                            .padding(.leading)
                            .foregroundColor(.white)
                        Text("25")
                            
                            .padding(.vertical)
                            .bold()
                            .foregroundColor(.white)
                        Image("coin")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                            .padding(.trailing)
                    }.cornerRadius(20)
                        .background(Color(red: 0.075, green: 0.329, blue: 0.541)).cornerRadius(20)
                }
                    
                Spacer()
                    
            }
            ForEach(listItems, id: \.self) { item in
                            ListItemView(nombreEmpresa: item.nombreEmpresa, descripcion: item.descripcion, cantidad: item.cantidad, img: item.img)
                                .padding(.top)
                        }

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
    RewardsView()
}
