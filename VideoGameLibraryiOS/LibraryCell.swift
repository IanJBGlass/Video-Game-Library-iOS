//
//  LibraryCell.swift
//  VideoGameLibraryiOS
//
//  Created by Jacob Glass on 11/1/18.
//  Copyright © 2018 Jacob Glass. All rights reserved.
//

import UIKit

class LibraryCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var availableLabel: UILabel!


    @IBOutlet weak var genreLabel: UILabel!
    

    @IBOutlet weak var ratingLabel: UILabel!
    

    @IBOutlet weak var dueDate: UILabel!
    
    func setup(game : Game) {
        titleLabel.text = game.title
        
        genreLabel.text = game.genre.rawValue
        
        ratingLabel.text = game.rating.rawValue
        
        switch game.available {
        case .checkedIn:
            //hidedueDate
            dueDate.isHidden = true
            //Set view to green
            availableLabel.backgroundColor = .green
        default:
            return
        }
        
        
    }
    
    
    
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    












