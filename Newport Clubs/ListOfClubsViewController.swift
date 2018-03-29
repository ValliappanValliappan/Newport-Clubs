//
//  ListOfClubsViewController.swift
//  Newport Clubs
//
//  Created by Chettiar Valliappan, Valliappan on 6/30/17.
//  Copyright © 2017 Ratan. All rights reserved.
//

import UIKit
import AWSDynamoDB
class ListOfClubsViewController: UITableViewController {
    var clubsType:String!
    var clubs:[String]=[String]()
    @IBAction func goToClubView(sender:UIButton){
        var objectMapper=AWSDynamoDBObjectMapper.default()
        objectMapper.load(Club.self, hashKey: sender.currentTitle, rangeKey: nil).continueOnSuccessWith { (res:AWSTask<AnyObject>) -> Any? in
            let nextView=UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "How")
            (nextView as! ClubViewController).club=res.result as! Club
            (nextView as! ClubViewController).ClubType=self.clubsType
            DispatchQueue.main.sync {
            self.present(nextView, animated: true, completion: nil)
            }
            return nil
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //get the array with all of a kind of clubs
        
        //Finish storing it in
        self.tableView.dataSource=self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     func present(nextView:UIViewController){
        present(nextView, animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell=self.tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.button.setTitle(clubs[indexPath.row], for: UIControlState.normal)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clubs.count
    }
}
