//
//  proyectoFinalApp.swift
//  proyectoFinal
//
//  Created by Luis Hernandez on 04/12/23.
//

import SwiftUI

@main
struct proyectoFinalApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ViewModel())
            
        }
    }
}
