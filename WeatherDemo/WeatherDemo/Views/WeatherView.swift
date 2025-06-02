//
//  WeatherView.swift
//  WeatherDemo
//
//  Created by Tong Ba Ta on 6/2/25.
//

import SwiftUI

struct WeatherView: View {
    @State var isPressed: Bool = false
    @State var isHidden: Bool = false
    var weather : ResponseBody
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2)
            VStack(alignment: .leading) {
                Text("Where: \(weather.name)")
                Text("Longitude: \(weather.coord.lon), Latitude:\(weather.coord.lat)")
                    .font(.headline)
                Text("Weather: \(weather.weather[0].main)")
                Text("Description: \(weather.weather[0].description)")
                Text("Temp: \(convertToFahr(kelvin: weather.main.temp), specifier: "%.2f")°F")
                
            }
        }
        .padding()
        Button("Home") {
            isPressed = true
        }
        .buttonStyle(MyButtonStyle())
        
        if (isPressed) {
        }
        
        /*
         NavigationView {
             
             NavigationLink(destination: ContentView()) {
                 Text("Home")
                     .frame(width: 100, height: 30)
                 EmptyView()
             }
         }
         */
        
        
    }
    func convertToFahr(kelvin: Double) -> Double {
        return ((kelvin - 273.15) * 9.0 / 5.0 + 32.0)
    }
}
    
struct MyButtonStyle: ButtonStyle
{
    func makeBody(configuration: Configuration) -> some View
    {
        if(configuration.isPressed)
        {
            // call your action here but don't change @State of current view
            print("Button is pressed")
        }
        else
        {
            // call your stop-action here but don't change @State of current view
            print("Button released")
        }
        
        return configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


