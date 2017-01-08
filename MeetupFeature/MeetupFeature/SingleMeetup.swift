//
//  SingleMeetup.swift
//  MeetupFeature
//
//  Created by Flatiron School on 1/8/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class SingleMeetup{

    var groupName: String?
    var eventName: String?
    var venueZip: String?
    var venueCountry: String?
    var venueCity: String?
    var venueAddress: String?
    var venuePhone: String?
    var venueName: String?
    var venueState: String?
    
    //designated initializer 
    init(groupName: String, eventName: String, venueZip: String, venueCountry: String, venueCity: String, venueAddress: String, venuePhone: String, venueName: String, venueState: String)
    {
        self.groupName = groupName
        self.eventName = eventName
        self.venueZip = venueZip
        self.venueCountry = venueCountry
        self.venueCity = venueCity
        self.venueAddress = venueAddress
        self.venuePhone = venuePhone
        self.venueName = venueName
        self.venueState = venueState
    }
    







}
