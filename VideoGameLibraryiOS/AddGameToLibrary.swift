//
//  AddGameToLibrary.swift
//  VideoGameLibraryiOS
//
//  Created by Jacob Glass on 10/31/18.
//  Copyright © 2018 Jacob Glass. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController {
    //Variables/Constants
    
    let segments: [(title: String, rating: Game.Rating)] =
        [("K", .kids),
         ("E", .everyone),
         ("E 10+", .everyone10Plus),
         ("T", .teen),
         ("M", .mature),
         ("AD", .adult)
    ]
    let genres:[(title: String, genre: Game.Genre)] =
        [("Action", Game.Genre.action),
         ("RPG", Game.Genre.rpg),
         ("FPS", Game.Genre.fps),
         ("Arcade", Game.Genre.arcade),
         ("Cool Math", Game.Genre.coolMath),
         ("Puzzle", Game.Genre.puzzle ),
         ]
    
    
    
    //IBOutlets
    @IBOutlet weak var tittleTextField: UITextField!
   
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var ratingSegmentedControle: UISegmentedControl!
    
    @IBOutlet weak var genrePickerView: UIPickerView!
    
    
    //IBAction Functions
    @IBAction func saveNewGameButtonTaped(_ sender: Any) {
        tryingToSave()
    }
    
    
    
    
    
    //Functions
    
    func tryingToSave() {
        
        //Title
        guard
            tittleTextField.text != nil else {return}
        
        //Details
        guard descriptionTextField.text != nil else {return}
        
        
        //Rating
        let rating = segments[ratingSegmentedControle.selectedSegmentIndex].rating
        
        //Genre
        let genre = genrePickerView.dataSource
        
        
    }
    
    
    
    
    
    
    
    //Veiwdidload
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
        ratingSegmentedControle.removeAllSegments()
        
        for (index, segment) in segments.enumerated() {
            ratingSegmentedControle.insertSegment(withTitle: segment.title, at: index, animated: false)
        }
        
        genrePickerView.delegate = self
        genrePickerView.dataSource = self
    }
    
    
    
    
}

//extensions
extension AddGameViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genres[row].title
    }
}











































