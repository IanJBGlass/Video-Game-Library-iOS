//
//  LibraryViewController.swift
//  VideoGameLibraryiOS
//
//  Created by Jacob Glass on 10/29/18.
//  Copyright © 2018 Jacob Glass. All rights reserved.
//

import UIKit

class LibraryViewController : UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let library = Library.sharedInstance
    
    override func  viewDidLoad() {
        super.viewDidLoad()
        //Populating the games array
        library.games.append(Game(title: "Fortnight", genre: .battleRoyal, description: "A game for 12 year olds.", rating: .everyone) )
        library.games.append(Game(title: "CS-Go", genre: .action, description: "Team based shooter", rating: .teen) )
        
       
        
        
        tableView.tableFooterView = UIView()
        
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
}


extension LibraryViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.games.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! LibraryCell
        
        let game = Library().games[indexPath.row]
        cell.setup(game: game)
        
        return cell
    }
    
   
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //Deleting Games
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            Library.sharedInstance.games.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
        
        let game = Library().games[indexPath.row]
        //Check in and out games
        switch game.available {
        case .checkedIn:
            let checkOutAction = UITableViewRowAction(style: .normal, title: "Check Out") { _, indexPath in
                
                //self.checkOut(at: indexPath)
                
            }
            
            return [deleteAction, checkOutAction]
            
        case .checkedOut:
            let checkInAction = UITableViewRowAction(style: .normal, title: "Check In") { _, indexPath in
                //self.checkIn(at: indexPath)
            }
            
            return [deleteAction, checkInAction]
            
        }
        
    }
}













//override func viewWillAppear(_ animated: Bool) {
//    super.viewWillAppear(animated)
//
//    tableView.reloadData()


