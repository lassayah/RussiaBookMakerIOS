//
//  RBMatchViewController.swift
//  RussiaBookMaker
//
//  Created by Laurene ASSAYAH on 13/04/2017.
//  Copyright © 2017 Laurene ASSAYAH. All rights reserved.
//

import UIKit

class RBMatchCellViewController: UITableViewCell {
    
    @IBOutlet weak var team1: UILabel!
    @IBOutlet weak var team2: UILabel!
}

class RBMatchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var matchs = [RBMatch]()
    var sectionTitles = [String]()
    @IBOutlet weak var matchTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let matchClient = ApiClient()
        matchClient.getMatchs(completionHandler: { (matchs) -> Void in
            self.matchs = matchs
            print("Matchs : \(matchs)")
            //TODO : find a clean way to filter distinct groups
            //self.sectionTitles = self.matchs.map{$0.group}
            
            self.matchs.forEach({ match in
                if !self.sectionTitles.contains(match.group) && match.group != ""
                {
                    self.sectionTitles.append(match.group)
                }
            })
            
            /*self.sectionTitles.append("A")
            self.sectionTitles.append("B")
            self.sectionTitles.append("C")
            self.sectionTitles.append("D")
            self.sectionTitles.append("E")
            self.sectionTitles.append("F")
            self.sectionTitles.append("G")
            self.sectionTitles.append("H")*/
            self.sectionTitles.append("Huitièmes de finale")
            self.sectionTitles.append("Quarts de finale")
            self.sectionTitles.append("Demi-finales")
            self.sectionTitles.append("Petite finale")
            self.sectionTitles.append("Finale")
            
            
            
            self.matchTableView.reloadData()
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !self.sectionTitles.isEmpty
        {
            let sectionTitle = self.sectionTitles[section]
            NSLog("%@", sectionTitle)
            let predicate = NSPredicate(format: "group == %@", sectionTitle)
            return self.matchs.count//.filter{/*self.setPredicateWithGroup(group: sectionTitle)*/predicate.evaluate(with: $0)}.count
        }
        else
        {
            return 0
        }
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // cell reuse id (cells that scroll out of view can be reused)
        let cellIdentifier = "MatchCell"
        
        // create a new cell if needed or reuse an old one
        let cell:RBMatchCellViewController = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! RBMatchCellViewController!
        
        if !self.sectionTitles.isEmpty
        {
            let sectionTitle: String = self.sectionTitles[indexPath.section]
            let predicate = NSPredicate(format: "group == %@", sectionTitle)
            let sectionMatchs = self.matchs//.filter{/*self.setPredicateWithGroup(group: sectionTitle)*/predicate.evaluate(with: $0)}
            cell.team1.text = sectionMatchs[indexPath.row].team1
            cell.team2.text = sectionMatchs[indexPath.row].team2
        }
        // set the text from the data model
        //cell.team1.text = self.matchs[indexPath.row].team1
        //cell.team2.text = self.matchs[indexPath.row].team2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if !self.sectionTitles.isEmpty
        {
            if self.sectionTitles[section].characters.count == 1
            {
                return "Groupe ".appending(sectionTitles[section])
            }
            else
            {
                return sectionTitles[section]
            }
        }
        else
        {
            return ""
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return self.sectionTitles.count
        
    }
    
    func setPredicateWithGroup(group: String) -> NSPredicate
    {
        var predicate = NSPredicate()
        if group == "Huitièmes de finale"
        {
            predicate = NSPredicate(format: "matchId >= 49 && matchId <= 56")
        }
        else if group == "Quarts de finale"
        {
            predicate = NSPredicate(format: "matchId >= 57 && matchId <= 60")
        }
        else if group == "Demi-finales"
        {
            predicate = NSPredicate(format: "matchId >= 61 && matchId <= 62")
        }
        else if group == "Petite finale"
        {
            predicate = NSPredicate(format: "matchId == 63")
        }
        else if group == "Finale"
        {
            predicate = NSPredicate(format: "matchId == 64")
        }
        else
        {
            predicate = NSPredicate(format: "group == %@", group)
        }
        return predicate
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
