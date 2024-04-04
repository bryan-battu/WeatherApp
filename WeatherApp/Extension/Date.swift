//
//  Date.swift
//  WeatherApp
//
//  Created by Bryan Battu on 04/04/2024.
//

import Foundation

extension Date {
    func toFrenchTimeString() -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "Europe/Paris")
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
    
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "fr_FR")
        dateFormatter.setLocalizedDateFormatFromTemplate("ddMMMM HH")
        return dateFormatter.string(from: Date())
    }
}
