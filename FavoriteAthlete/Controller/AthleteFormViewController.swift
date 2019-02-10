//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Hameed Abdullah on 2/5/19.
//  Copyright © 2019 Hameed Abdullah. All rights reserved.
//

import UIKit

class AthleteFormViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var leagueTextField: UITextField!
    @IBOutlet weak var teamTextField: UITextField!
    
    //1
    //Add a variable property athlete of type Athlete? Why is this variable optional? It will be nil when the user comes to the screen to create a new athlete, and it will have a value when the user comes to the screen to edit an athlete.
    var athlete: Athlete?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateView()
    }
    
    //2
    func updateView() {
        
        //unwrap the athlete property, and check if it contains an Athlete object. If so, use the object to update the text fields with the athlete's information.
        if let athlete = athlete {
            nameTextField.text = athlete.name
            ageTextField.text = athlete.age
            leagueTextField.text = athlete.league
            teamTextField.text = athlete.team
        }
    }

    //3
    //inside the action, create an Athlete object by unwrapping the text from the text fields and passing it to the Athlete initializer
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        guard let name = nameTextField.text,
            let age = ageTextField.text,
            let league = leagueTextField.text,
            let team = teamTextField.text else { return }
        
        athlete = Athlete(name: name, age: age, league: league, team: team)
        performSegue(withIdentifier: "unwindSegue", sender: self)
    }
    
}

