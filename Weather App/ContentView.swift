//
//  ContentView.swift
//  Weather App
//
//  Created by Ronan Clayton on 29/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack{
                CityNameView(cityName: "London, UK")
                TodayDisplayView(imageName: isNight ? "cloud.moon.fill" : "cloud.sun.fill",
                                 temperature:23 )
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: isNight ? "cloud.moon.fill" : "cloud.sun.fill",
                                   temperature: 20)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: isNight ? "moon.stars.fill" : "sun.max.fill",
                                   temperature: 24)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: isNight ? "moon.stars.fill" : "wind",
                                   temperature: 17)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: isNight ? "cloud.moon.rain.fill" : "cloud.heavyrain.fill",
                                   temperature: 14)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: isNight ? "cloud.moon.fill" : "cloud.sun.fill",
                                   temperature: 21)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(buttonText: "Change Day Time",
                                  bgColour: .blue,
                                  tColour: .white)
                }
                    
                    Spacer()
                }
            }
        }
    }

#Preview {
ContentView()
}
        
struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                          isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}


struct CityNameView:View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32,
                          weight: .medium,
                          design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct TodayDisplayView:View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70,
                              weight: .semibold))
                .foregroundStyle(.white)
        }
        
            .padding(.bottom, 40)
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 2){
            Text(dayOfWeek)
                .font(.system(size: 16,
                              weight: .medium))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28,
                              weight: .medium))
                .foregroundStyle(.white)
        }
    }
}
