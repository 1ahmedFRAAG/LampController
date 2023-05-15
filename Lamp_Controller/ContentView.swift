//
//  ContentView.swift
//  Lamp_Controller
//
//  Created by ahmed fraag on 08/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State var isDark: Bool = false
    var body: some View {
        Home()
            .ignoresSafeArea()
            .preferredColorScheme(isDark ? .dark : .light)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
