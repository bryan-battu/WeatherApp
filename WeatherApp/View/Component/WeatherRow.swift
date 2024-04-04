//
//  WeatherRow.swift
//  WeatherApp
//
//  Created by Bryan Battu on 31/03/2024.
//

import SwiftUI

struct WeatherRow: View {
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: logo)
                    .tint(Color.gray)
                    .foregroundStyle(Color.gray)
                    .font(.title3)
                    .frame(width: 15, height: 5)
                
                Text(name)
                    .foregroundStyle(Color.gray)
                    .font(.subheadline)
            }
            
            Text(value)
                .font(.system(size: 35))
        }
    }
}

#Preview {
    WeatherRow(logo: "thermometer", name: "HUMIDITÉ", value: "8°")
}
