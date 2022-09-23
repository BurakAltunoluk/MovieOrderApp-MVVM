//
//  Model.swift
//  MovieSteam-MVVM-POP
//
//  Created by Burak Altunoluk on 22/09/2022.
//

import Foundation

struct MovieModel: Decodable {
    let nameOfMovie: String
    let details: String
    let price: String
    let pictureUrl: String
}
