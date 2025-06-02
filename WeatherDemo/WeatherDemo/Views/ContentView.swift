//
//  ContentView.swift
//  WeatherDemo
//
//  Created by Tong Ba Ta on 5/27/25.
//

import SwiftUI

// ContentView uses StateObject locationManager
struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather : ResponseBody?
    var body: some View {
        VStack {
            // If there exist location from Location Manager
            if let location = locationManager.location {
                //Text("Your coordinates: \(location.latitude), \(location.longitude)")
                if let weather = weather {
                    WeatherView(weather: weather)
                }
                else {
                    LoadingView().task {
                        do{
                            try await weather = weatherManager.getCurrentWeather(lat: location.latitude, long: location.longitude)
                        } catch {
                            print("error getting weather: \(error)")
                        }
                    }
                }
            }
            
            // If not, send to ProgressView (loading)
            else {
                if locationManager.isLoading {
                    LoadingView()
                }
                else {
                    
                    // Get locationManager for welcomeView
                    WelcomeView().environmentObject(locationManager)
                }
            }
            
        }
        
        // stylesheet
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
