//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Bryan Battu on 30/03/2024.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var location: LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Weather App")
                    .bold()
                    .font(.title)
                
                Text("Autorisez l'application à accéder à votre position pour récupérer la météo de votre ville")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                location.requestLocation()
            }
            .cornerRadius(30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
