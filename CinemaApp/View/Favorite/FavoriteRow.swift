//
//  FavoriteRow.swift
//  CinemaApp
//
//  Created by Dimas Wicaksono on 02/09/23.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct FavoriteRow: View {
    var movie: FavoriteModel
    var body: some View {
        HStack {
            imageMovie
            descMovie
        }
        .background(Color.movieCard)
        .cornerRadius(20)
    }
}

extension FavoriteRow {
    @ViewBuilder
    var imageMovie: some View {
        if let posterPath = movie.posterPath {
            let image = "\(API.imageSource)\(posterPath)"
            WebImage(url: URL(string: image))
                .resizable()
                .indicator(.activity)
                .scaledToFit()
                .frame(width: 110)
        } else {
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 130)
        }
    }
    
    var descMovie: some View {
        VStack(alignment: .leading) {
            Text(movie.title)
                .font(.title2)
                .bold()
                .foregroundColor(Color.movieFont)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
            released
            ratingBlock
        }.frame(minWidth: 0, maxWidth: .infinity)
    }
    
    @ViewBuilder
    var released: some View {
        if let date = movie.releaseDate {
            let newFormat = Helper.dateConverter(format: date)
            Text("Release Date: \(newFormat)").foregroundColor(Color.movieFont)
        } else {
            Text("Re;ease Date: TBA")
        }
    }
    
    var ratingBlock: some View {
        HStack {
            Image(systemName: "star.fill")
                .renderingMode(.template)
                .foregroundColor(Color.movieAccent)
            let vote = String(format: "%.1f", movie.voteAverage)
            Text("\(vote)").foregroundColor(Color.movieFont)
        }.padding(.bottom)
    }
    
}
