//
//  ClubViewController.swift
//  Newport Clubs
//
//  Created by Chettiar Valliappan, Valliappan on 6/30/17.
//  Copyright © 2017 Ratan. All rights reserved.
//

import UIKit
import AWSDynamoDB
class ClubViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var texView:UITextView!
    var ClubType:String!
    @IBAction func goBack(_ sender: UIButton) {
        let storyBoard=UIStoryboard(name: "Main", bundle: nil)
        let listOfClubsView=storyBoard.instantiateViewController(withIdentifier: "table view") as! ListOfClubsViewController
        listOfClubsView.clubsType=ClubType
        let objectMapper=AWSDynamoDBObjectMapper.default()
        objectMapper.load(Club.self, hashKey: ClubType, rangeKey: nil).continueOnSuccessWith { (res:AWSTask<AnyObject>) -> Any? in
            let array=(res.result as! Club).Array.allObjects as! [String]
            for i in array{
                listOfClubsView.clubs.append(i)
            }
            self.present(listOfClubsView, animated: true, completion: nil)
            return nil
        }
    }
    var club:Club!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text=club.Name!
        texView.text="Mission statement:\(club.missionStatement!)\nNumber of members:\(club.numOfMembers!)\nNumber of leadership positions:\(club.numOfLeadershipPositions!)\nTime commitment:\(club.timeCommitment!)\nFor more information contact:\(club.contactEmail!)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
