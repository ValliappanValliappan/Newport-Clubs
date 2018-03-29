//
//  ViewController.swift
//  Newport Clubs
//
//  Created by Chettiar Valliappan, Valliappan on 6/10/17.
//  Copyright © 2017 Ratan. All rights reserved.
//

import UIKit
import AWSDynamoDB
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func goToClubView(_ sender: UIButton) {
        let storyBoard=UIStoryboard(name: "Main", bundle: nil)
        let listOfClubsView=storyBoard.instantiateViewController(withIdentifier: "table view") as! ListOfClubsViewController
        listOfClubsView.clubsType=sender.currentTitle
        let objectMapper=AWSDynamoDBObjectMapper.default()
        objectMapper.load(Club.self, hashKey: sender.currentTitle, rangeKey: nil).continueOnSuccessWith { (res:AWSTask<AnyObject>) -> Any? in
            let array=(res.result as! Club).Array.allObjects as! [String]
            for i in array{
                listOfClubsView.clubs.append(i)
            }
            self.present(listOfClubsView, animated: true, completion: nil)
            return nil
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

