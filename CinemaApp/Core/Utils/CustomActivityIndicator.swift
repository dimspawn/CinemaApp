//
//  CustomActivityIndicator.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 02/09/23.
//

import Foundation
import SwiftUI

public struct CustomActivityIndicator: UIViewRepresentable {
    public init(){}
    
    public func makeUIView(context: UIViewRepresentableContext<CustomActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }
    
    public func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<CustomActivityIndicator>) {
        uiView.startAnimating()
    }
}
