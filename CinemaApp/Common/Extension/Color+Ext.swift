//
//  Color+Ext.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 02/09/23.
//

import Foundation
import SwiftUI

extension Color {
    public static var movieCard: Color {
        return Color(
            red: 229/255,
            green: 149/255,
            blue: 142/255
        )
    }
    
    public static var movieBackground: Color {
        return Color(
            red: 253/255,
            green: 176/255,
            blue: 149/255
        )
    }
    
    public static var movieFont: Color {
        return Color(
            red: 255/255,
            green: 186/255,
            blue: 0/255
        )
    }
    
    public static var movieAccent: Color {
        return Color(
            red: 255/255,
            green: 186/255,
            blue: 0/255
        )
    }
    
    public static var taglineBackground: Color {
        return Color(
            red: 68/255,
            green: 49/255,
            blue: 89/255,
            opacity: 0.43
        )
    }
}
