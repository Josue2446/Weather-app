//
//  WeatherButton.swift
//  Weather
//
//  Created by Josue  Lopez  on 7/21/25.
//

import Foundation
import SwiftUI

struct WeatherButton: View {
    var buttonText: String
    
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
            Text(buttonText)
                .frame(width: 100, height: 50)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(10)
    }
}
