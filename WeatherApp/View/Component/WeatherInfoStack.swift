//
//  WeatherInfoStack.swift
//  WeatherApp
//
//  Created by Bryan Battu on 04/04/2024.
//

import SwiftUI

struct WeatherInfoStack: View {
    let weatherItems: [(logo: String, name: String, value: String)]
    let stackName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(stackName)")
                .foregroundStyle(Color.gray)
                .font(.subheadline)
            Rectangle().frame(height: 1)
                .foregroundStyle(Color.gray)
                .padding(.bottom)
            HStack {
                ForEach(weatherItems, id: \.name) { weatherItem in
                    WeatherRow(logo: weatherItem.logo, name: weatherItem.name, value: weatherItem.value)
                    Spacer()
                }
            }
        }
        .padding(10)
        .fixedSize(horizontal: false, vertical: true)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10, corners: [.allCorners])
    }
}

#Preview {
    WeatherInfoStack(weatherItems: [(logo: "safari", name: "Nom", value: "0.0")], stackName: "VENT")
}
