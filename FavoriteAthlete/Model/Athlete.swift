//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Hameed Abdullah on 2/5/19.
//  Copyright © 2019 Hameed Abdullah. All rights reserved.
//

import Foundation

struct Athlete {
    let name: String
    let age: String
    let league: String
    let team: String
    
    // a failable initializer that fails if any of the four arguments isEmpty.
    init?(name: String, age: String, league: String, team: String) {
        if name.isEmpty || age.isEmpty || league.isEmpty || team.isEmpty {
            return nil;
        }
        self.name = name
        self.age = age
        self.league = league
        self.team = team
    }
    
    //Add a computed property description of type String that uses the four properties to return a phrase describing the athlete, as in the following
    var description: String {
        return "\(name) is \(age) years old and plays for the \(team) in the \(league)."
    }
}
