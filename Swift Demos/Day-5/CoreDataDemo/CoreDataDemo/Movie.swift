//
//  Movie.swift
//  CoreDataDemo
//
//  Created by JETS Mobile Lab on 5/7/19.
//  Copyright © 2019 MaiAlaa. All rights reserved.
//

import Foundation

class MovieClass {
    var title = ""
    var releaseDate = 2000
    var rate : Float = 0.0
    
    init(title: String, releaseDate: Int, rate: Float)
    {
        self.title = title
        self.releaseDate = releaseDate
        self.rate = rate
    }
}
