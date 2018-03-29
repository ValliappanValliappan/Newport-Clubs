//
//  Club.swift
//  Newport Clubs
//
//  Created by Chettiar Valliappan, Valliappan on 6/30/17.
//  Copyright © 2017 Ratan. All rights reserved.
//

import AWSDynamoDB
class Club:AWSDynamoDBObjectModel, AWSDynamoDBModeling{
    var Array:NSSet!//Only the lists have this
    var Name:String!
    var numOfMembers:String!
    var timeCommitment:String!
    var missionStatement:String!
    var numOfLeadershipPositions:String!
    var contactEmail:String!
    public static func dynamoDBTableName() -> String{
        return "NewportClubs"
    }
    public static func hashKeyAttribute() -> String{
        return "Name"
    }
}
