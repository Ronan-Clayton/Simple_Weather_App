//
//  WeatherButton.swift
//  Weather App
//
//  Created by Ronan Clayton on 30/10/2023.
//

import SwiftUI

struct WeatherButton: View {
    var buttonText: String
    var bgColour: Color
    var tColour: Color
    var body: some View {
        Text(buttonText)
            .frame(width: 280, height: 50)
            .background(bgColour.gradient)
            .foregroundStyle(tColour)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10.0)
    }
}

#Preview {
    WeatherButton(buttonText: "Change Day Time", bgColour: .blue, tColour: .white)
}
