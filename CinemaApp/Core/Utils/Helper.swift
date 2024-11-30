//
//  Helper.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 02/09/23.
//

import Foundation

public struct Helper {
    public static func dateConverter(format: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy/MM/dd"
        let showDate = inputFormatter.date(from: format)
        if let newDate = showDate {
            inputFormatter.dateFormat = "d MMM Y"
            let newFormat = inputFormatter.string(from: newDate)
            return newFormat
        } else {
            return "-"
        }
    }
}
