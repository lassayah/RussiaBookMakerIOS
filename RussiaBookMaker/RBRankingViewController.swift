//
//  RankingViewController.swift
//  RussiaBookMaker
//
//  Created by Laurene ASSAYAH on 12/04/2017.
//  Copyright © 2017 Laurene ASSAYAH. All rights reserved.
//

import UIKit


class RBRankingCellViewController: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var rank: UILabel!
}

class RBRankingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var users = [RBUser]()
    @IBOutlet weak var _rankingTableView: UITableView!

    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let rankingClient = ApiClient()
        rankingClient.getRanking(completionHandler: { (users) -> Void in
            self.users = users
            print("Users : \(users)")
            self._rankingTableView.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // cell reuse id (cells that scroll out of view can be reused)
        let cellIdentifier = "RankingCell"
        
        // create a new cell if needed or reuse an old one
        let cell:RBRankingCellViewController = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! RBRankingCellViewController!
        
        // set the text from the data model
        cell.name.text = self.users[indexPath.row].username
        cell.points.text = self.users[indexPath.row].points
        cell.rank.text = self.users[indexPath.row].rank
        
        return cell
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
