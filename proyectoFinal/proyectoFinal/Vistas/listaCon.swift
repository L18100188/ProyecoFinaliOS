//
//  listaCon.swift
//  proyectoFinal
//
//  Created by Luis Hernandez on 04/12/23.
//

import SwiftUI

struct listaCon: View {
    var body: some View {
        HomesView()
    }
}

struct HomesView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State var isPressList = false
    @State var nombre = ""
    @State var descripcion = ""
    @State var showAlert = false
    

    var body: some View {
        
        NavigationView{
            List {
                ForEach(viewModel.items, id: \.id) { item in
                    NavigationLink (
                        destination: modCon(item: item),
                        label: {
                            VStack (alignment: .leading) {
                                Text(item.nombre)
                                Text(item.descripcion).font(.caption).foregroundColor(.gray)
                                
                                
                                                         
                            }
                        }).onDisappear{
                            viewModel.fetchContactos()
                        }
                    
                }.onDelete(perform: quitarPost)
                .onDisappear{
                    viewModel.fetchContactos()
                }
                
                
            }.listStyle(InsetListStyle())
            .navigationTitle("Contactos")
            .navigationBarItems(leading: refrescar, trailing: agregarBtn)
            .onAppear(perform: {
                viewModel.fetchContactos()
            })
            .onTapGesture(count: 3, perform: {
                showAlert.toggle()
            })
            .alert(isPresented: $showAlert, content: {
                Alert (title: Text("AYUDA"), message: Text("Aplicacion que sirve para guardar contactos telefonicos. Para agregar nuevos contactos solo es necesarios darle tap al simbolo de +. Es necesario agregar un nombre y un numero telefonico. Asi mismo se puede modificar los datos de contacto y eliminar"))
            })
        }.sheet(isPresented: $isPressList, content: {
            nuevoCon(isPressNewCon: $isPressList, nombre: $nombre, descripcion: $descripcion)
                .onAppear(perform: {
                    viewModel.fetchContactos()
                })
        })
    }
    
    private func quitarPost(indexSet: IndexSet) {
        let id = indexSet.map {viewModel.items[$0].id}
        DispatchQueue.main.async {
            let params: [String: Any] = ["id": id[0]]
            self.viewModel.eliminarContactos(parameters: params)
            self.viewModel.fetchContactos()
            self.viewModel.fetchContactos()
            
        }
    }
    
    
    var agregarBtn: some View {
        Button(action: {
            isPressList.toggle()
            if(isPressList == false)
            {
                viewModel.fetchContactos()
                
            }
                
            
        }, label: {
            Image(systemName: "plus")
        }).onDisappear{
            viewModel.fetchContactos()
        }
        
    }
    
    var refrescar: some View {
        Button(action: {
            viewModel.fetchContactos()
            
        }, label: {
            Image(systemName: "arrow.clockwise.circle")
        })
        
    }
    
    
}


struct listaCon_Previews: PreviewProvider {
    static var previews: some View {
        listaCon()
    }
}
