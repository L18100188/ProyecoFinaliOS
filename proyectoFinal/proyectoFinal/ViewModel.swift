//
//  ViewModel.swift
//  proyectoFinal
//
//  Created by Luis Hernandez on 04/12/23.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var items = [PostModel]()
    let prefixURL = "http://192.168.1.82:3000"

    init() {
        fetchContactos()
    }

    //Mark: - retrieve data
    func fetchContactos() {
        guard let url = URL(string: "\(prefixURL)/consulta") else {
            print("No se encontro URL")
            return
        }

        URLSession.shared.dataTask(with: url) { (data,res,error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }

            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        self.items = result.data
                    }
                } else {
                    print("No data")
                }
            } catch let JsonError {
                print("Fetch json error:", JsonError.localizedDescription)
            }
            
            //Extra
            if let res = res as? HTTPURLResponse {
                print(">Fetch json response status code: \(res.statusCode)")
            }else {
                print("Todo bien en 2")
            }
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print(">Fetch json data: \(dataString)")
            }else {
                print("Todo bien en 3")
            }
            
            
        
        }.resume()
    }


    //Mark: - create data
    func crearContactos(parameters: [String: Any]) {
        guard let url = URL(string: "\(prefixURL)/crear") else {
            print("No se encontro URL")
            return
        }

        let data = try! JSONSerialization.data(withJSONObject: parameters)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { (data,res,error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }

            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                } else {
                    print("No data")
                }
            } catch let JsonError {
                print("Fetch json error:", JsonError.localizedDescription)
            }
        
        }.resume()
    }

    //Mark: - Update data
    func actualizarContactos(parameters: [String: Any]) {
        guard let url = URL(string: "\(prefixURL)/actualizar") else {
            print("No se encontro URL")
            return
        }

        let data = try! JSONSerialization.data(withJSONObject: parameters)

        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { (data,res,error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }

            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                } else {
                    print("No data")
                }
            } catch let JsonError {
                print("Fetch json error:", JsonError.localizedDescription)
            }
        
        }.resume()
    }

    //Mark: - Delete data
    func eliminarContactos(parameters: [String: Any]) {
        guard let url = URL(string: "\(prefixURL)/eliminar") else {
            print("No se encontro URL")
            return
        }

        let data = try! JSONSerialization.data(withJSONObject: parameters)

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { (data,res,error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }

            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                } else {
                    print("No data")
                }
            } catch let JsonError {
                print("Fetch json error:", JsonError.localizedDescription)
            }
        
        }.resume()
    }


}
