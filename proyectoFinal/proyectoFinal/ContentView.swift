//
//  ContentView.swift
//  proyectoFinal
//
//  Created by Luis Hernandez on 04/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("UserDarkMode") var userDarkMode: Bool = false
    
    var body: some View {
        VStack{
            TabView{
                listaCon()
                    .tabItem {
                        Image ( systemName: "list.bullet" )
                        Text("Lista")
                    }
                confiAPP()
                    .tabItem {
                        Image ( systemName: "gear" )
                        Text("Preferencias")
                    }
            }
            
        }.preferredColorScheme(userDarkMode ? .dark: .light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
