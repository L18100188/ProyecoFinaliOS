//
//  confiAPP.swift
//  proyectoFinal
//
//  Created by Luis Hernandez on 04/12/23.
//

import SwiftUI
import AVFoundation

struct confiAPP: View {
    
    //@Environment(\.colorScheme) var colorScheme
    @State private var estadoToogle = false
    @State private var currentMode:ColorScheme = .light
    @State var showAlert = false
    @AppStorage("UserDarkMode") var userDarkMode: Bool = false
    
    
    
    
    var body: some View {
        ZStack{
            VStack{
                Text("Agenda ISC")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(Color.blue)
                    .padding()
             
                Toggle(isOn: $estadoToogle) {
                    Text("Modo oscuro")
                }.onChange(of: estadoToogle, perform: { value in
                    if estadoToogle == true {
                        //currentMode = .dark
                        userDarkMode = true
                    } else {
                        //currentMode = .light
                        userDarkMode = false
                    }
                    
                }).padding()
                
        
                
                Spacer()
                
                Button(action: {
                    showAlert.toggle()
                    
                }, label: {
                    Text("Creditos")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                        
                })
                
                Text("")
                
            }
            //.preferredColorScheme(currentMode)
            .preferredColorScheme(userDarkMode ? .dark: .light)
            .toggleStyle(SwitchToggleStyle(tint: Color.red))
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Elaborador por:"), message: Text("Luis Angel Hernandez Lopez #18100188 \nSamuel Alberto Solis Baldenegro #19100257"))
            })
        }.onAppear(perform: {
            if(userDarkMode == true)
            {
                estadoToogle = true
            } else {
                estadoToogle = false
            }
        })
    }
}



struct confiAPP_Previews: PreviewProvider {
    static var previews: some View {
        confiAPP()
    }
}
