//
//  WelcomeView.swift
//  WeatherDemo
//
//  Created by Tong Ba Ta on 5/27/25.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager : LocationManager
    var body: some View {
        VStack {
            VStack (spacing: 20) {
                Text("Welcome to the Weather App!")
                    .bold().font(.title)
                Text("Please share your current location to get the weather information").padding()
                
            }
            .multilineTextAlignment(.center)
            .padding()
            
            // Get location button
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
                
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
