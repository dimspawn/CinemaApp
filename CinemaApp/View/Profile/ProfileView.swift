//
//  ProfileView.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 03/09/23.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    VStack {
                        VStack {
                            profileImage
                            profileName
                            profileEmail
                            profileAddress
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color.movieCard)
                    .cornerRadius(20)
                }.padding(8)
            }
        }
        .background(Color.movieBackground)
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension ProfileView {
    @ViewBuilder
    var profileImage: some View {
        Image("dan-balan")
            .resizable()
            .scaledToFit()
            .frame(width: 130)
            .padding(50)
    }
    
    var profileName: some View {
        Text("Dimas Panuji Wicaksono")
            .font(.title)
            .bold()
            .foregroundColor(Color.movieFont)
    }
    
    var profileEmail: some View {
        Text("myzrael005@gmail.com")
            .foregroundColor(Color.movieFont)
    }
    
    var profileAddress: some View {
        Text("Lampung, Indonesia")
            .font(.title2)
            .bold()
            .padding(30)
            .foregroundColor(Color.movieFont)
    }
}
