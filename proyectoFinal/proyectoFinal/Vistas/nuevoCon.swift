//
//  nuevoCon.swift
//  proyectoFinal
//
//  Created by Luis Hernandez on 04/12/23.
//

import SwiftUI
import CoreHaptics
import AVKit

struct nuevoCon: View {
    @EnvironmentObject var viewModel: ViewModel
    @Binding var isPressNewCon: Bool
    @Binding var nombre: String
    @Binding var descripcion: String
    //@Binding var imageURL: String
    @State var isAlert = false
    @State var showAlert = false
    @AppStorage("UserDarkMode") var userDarkMode: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.gray.opacity(0.2).ignoresSafeArea(.all)
                VStack(alignment: .leading) {
                    Text("Agregar nuevo contacto")
                        .font(Font.system(size: 16, weight: .bold))
                        
                    
                    
                    TextField("Nombre", text: $nombre)
                        .padding()
                        .background(Color.primary.opacity(0.1))
                        .foregroundColor(.primary)
                        .cornerRadius(6)
                        .padding(.bottom)
                        .keyboardType(.default)
                        .disableAutocorrection(false)
                        
                    
                    TextField("####", text: $descripcion)
                        .padding()
                        .background(Color.primary.opacity(0.1))
                        .foregroundColor(.primary)
                        .cornerRadius(6)
                        .padding(.bottom)
                        .keyboardType(.phonePad)
                        .disableAutocorrection(false)
                        
                    
                   
                    Spacer()
                    
                    
                }.padding()
                .alert(isPresented: $isAlert, content: {
                    let nombre = Text("No data")
                    let message = Text("Por favor de llenar los datos correspondientes")
                    
                    return Alert(title: nombre, message: message)
                })
                
                
                
                }
                .navigationBarTitle("Nuevo Contacto", displayMode: .inline)
                .navigationBarItems(leading: leading, trailing: trailing )
                .preferredColorScheme(userDarkMode ? .dark: .light)
            
            }
            
            
        }
        
    
    
    var leading: some View {
        Button(action: {
            isPressNewCon.toggle()
        }, label: {
            Text("Cancelar")
                .font(Font.system(size: 13, weight: .bold))
            
        })
    }
    
    var trailing: some View {
        Button(action: {
            if nombre != "" && descripcion != "" {
                let param: [String: Any] = ["nombre":nombre,"descripcion":descripcion]
                
                viewModel.crearContactos(parameters: param)
               
                viewModel.fetchContactos()
                
                self.nombre = ""
                self.descripcion = ""
                viewModel.fetchContactos()
                print("En teoria debio pasar...")
                let gen = UIImpactFeedbackGenerator(style: .medium)
                gen.impactOccurred()
                
                soundManager.instance.playSound()
                ExtendedSoundManager.instance.setVol(1.0)
                isPressNewCon.toggle()
                
                
            } else {
                isAlert.toggle()
            }
        }, label: {
            Text("Agregar")
                .font(Font.system(size: 13, weight: .bold))
            
        })
    }
    
    


//struct nuevoCon_Previews: PreviewProvider {
//    static var previews: some View {
//        nuevoCon()
//    }
//}
}
