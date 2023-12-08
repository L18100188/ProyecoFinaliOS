//
//  Models.swift
//  proyectoFinal
//
//  Created by Luis Hernandez on 04/12/23.
//

import Foundation
import SwiftUI

struct DataModel: Decodable {

    let error: Bool
    let message: String
    let data: [PostModel]
}

struct PostModel: Decodable {
    let id: Int
    let nombre: String
    let descripcion: String
}
