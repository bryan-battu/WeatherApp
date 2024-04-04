//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Bryan Battu on 30/03/2024.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    @State private var city: String = ""
    
    let icons = [
        "clear sky": "sun.max",
        "few clouds": "cloud.sun",
        "scattered clouds": "cloud",
        "broken clouds": "cloud",
        "shower rain": "cloud.rain",
        "rain": "cloud.sun.rain",
        "thunderstorm": "cloud.bolt",
        "snow": "cloud.snow",
        "mist": "cloud.fog"
    ]
    
    let names = [
        "clear sky": "Ciel dégagé",
        "few clouds": "Quelques nuages",
        "scattered clouds": "Nuages épars",
        "broken clouds": "Nuages brisés",
        "shower rain": "Grosses averses",
        "rain": "Pluie",
        "thunderstorm": "Orage",
        "snow": "Neige",
        "mist": "Brouillard"
    ]
        
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                HStack {
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .tint(Color.gray)
                        }
                        
                        TextField("Ville", text: $city)
                    }
                    .padding(7)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10, corners: [.allCorners])
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "location")
                            .tint(Color.gray)
                    }
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    Text("Aujourd'hui, \(Date().formattedDate())")
                    
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: icons[weather.weather[0].description] ?? "")
                                .font(.system(size: 40))
                            
                            Text(names[weather.weather[0].description] ?? "")
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()

                VStack {
                    
                    WeatherInfoStack(weatherItems: [(logo: "thermometer.low", name: "Minimum", value: weather.main.tempMin.roundDouble() + "°"), (logo: "thermometer.high", name: "Maximum", value: weather.main.tempMax.roundDouble() + "°"), (logo: "thermometer.medium", name: "Ressenti", value: weather.main.feelsLike.roundDouble() + "°")], stackName: "TEMPERATURE")
                    
                    WeatherInfoStack(weatherItems: [(logo: "wind", name: "Vent", value: weather.wind.speed.roundDouble() + " m/s"), (logo: "safari", name: "Degré", value: weather.wind.deg.roundDouble() + "°")], stackName: "VENT")
                    
                    let sunriseDate = Date(timeIntervalSince1970: weather.sys.sunrise)
                    let sunsetDate = Date(timeIntervalSince1970: weather.sys.sunset)
                    
                    WeatherInfoStack(weatherItems: [(logo: "humidity", name: "Humidité", value: weather.main.humidity.roundDouble() + "%"), (logo: "sunrise", name: "Lever", value: sunriseDate.toFrenchTimeString()), (logo: "sunset", name: "Coucher", value: sunsetDate.toFrenchTimeString())], stackName: "AUTRE")
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color(hue: 0.656, saturation: 0.707, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: ResponseBody(coord: ResponseBody.CoordinatesResponse(lon: 0.0, lat: 0.0), weather: [ResponseBody.WeatherResponse(id: 1.1, main: "clear sky", description: "clear sky", icon: "phone")], main: ResponseBody.MainResponse(temp: 0.0, feels_like: 0.0, temp_min: 0.0, temp_max: 0.0, pressure: 0.0, humidity: 0.0), name: "New York", wind: ResponseBody.WindResponse(speed: 0.0, deg: 0.0), sys: ResponseBody.SysResponse(id: 1, type: 1, country: "", sunrise: 0, sunset: 0)))
}
