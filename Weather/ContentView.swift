//
//  ContentView.swift
//  Weather
//
//  Created by Josue  Lopez  on 5/30/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.pink, Color.purple, Color.white], startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    ContentView()
}
