//
//  modCon.swift
//  proyectoFinal
//
//  Created by Luis Hernandez on 04/12/23.
//

import SwiftUI
import AVKit
import AVFoundation

struct modCon: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: ViewModel
    let item: PostModel
    @State var nombre = ""
    @State var descripcion = ""
    //var SoundManager = soundManager()
    
    var body: some View {
        ZStack{
            Color.gray.opacity(0.2).ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                Text("Editar contacto")
                    .font(Font.system(size: 16, weight: .bold))
                
                
                TextField("Nombre", text: $nombre)
                    .padding()
                    .background(Color.primary.opacity(0.1))
                    .foregroundColor(.primary)
                    .cornerRadius(6)
                    .padding(.bottom)
                    .disableAutocorrection(false)
                    .keyboardType(.default)
                
                TextField("####", text: $descripcion)
                    .padding()
                    .background(Color.primary.opacity(0.1))
                    .foregroundColor(.primary)
                    .cornerRadius(6)
                    .padding(.bottom)
                    .disableAutocorrection(false)
                    .keyboardType(.phonePad)
                
                
                
                
                Spacer()
                
            }.padding()
            .onAppear(perform: {
                self.nombre = item.nombre
                self.descripcion = item.descripcion
            })
        }
        .navigationBarTitle("Editar Contacto", displayMode: .inline)
        .navigationBarItems(trailing: trailing )
        
        
    }
    
    var trailing: some View {
        Button(action: {
            if nombre != "" && descripcion != "" {
                let params: [String: Any] = ["id":item.id,"nombre":nombre,"descripcion":descripcion]
                viewModel.actualizarContactos(parameters: params)
                print("Vol despues de esto...")
               
                soundManager.instance.playSound()
                ExtendedSoundManager.instance.setVol(1.0)
                
                viewModel.fetchContactos()
                presentationMode.wrappedValue.dismiss()
                
                
                
            }
            
        }, label: {
            Text("Guardar")
                .font(Font.system(size: 13, weight: .bold))
            
        })
    }
    
    
    
}

//struct modCon_Previews: PreviewProvider {
//    static var previews: some View {
//        modCon()
//    }
//}
