//
//  MeetupDataStore.swift
//  MeetupFeature
//
//  Created by Flatiron School on 1/8/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class MeetupDataStore{

    static let sharedInstance = MeetupDataStore()
    private init(){}
    //singleton    
    
    var meetupArray: [SingleMeetup] = []
    //array to hold all the meetups
    
    func getMeetupInformationWith(Completion: @escaping(Array<Any>) -> ()){
    
        MeetupAPIClient.getMeetupInformation { (meetupArray) in
            for singleDictionary in meetupArray{

                guard let unwrappedSingleDictionary = singleDictionary as? [String: Any] else {
                    print("singleDictionary in array did not unwrap"); return}
                
                guard let
                    unwrappedEventName = unwrappedSingleDictionary["name"] as? String else {print("group name did not unwrap"); return}
                //Event Name - first level of abstraction--- single Top Dictionary
                
                guard let unwrappedVenueDictionary = unwrappedSingleDictionary["venue"] as? [String: Any] else {print("Venue Dictionary did not unwrap"); return}
                
                guard
                    let unwrappedZipVenue = unwrappedVenueDictionary["zip"] as? String,
                    let unwrappedCountryVenue = unwrappedVenueDictionary["country"] as? String,
                    let unwrappedCityVenue = unwrappedVenueDictionary["city"] as? String,
                    let unwrappedAddressVenue = unwrappedVenueDictionary["address_1"] as? String,
                    let unwrappedPhoneNumVenue = unwrappedVenueDictionary["phone"] as? String,
                    let unwrappedNameVenue = unwrappedVenueDictionary["name"] as? String,
                    let unwrappedStateVenue = unwrappedVenueDictionary["state"] as? String
                    
                else {print("VENUE INFORMATION DID NOT UNWRAP"); return}
                //second level of abstraction--- Dictionary within Dictionary
                
                guard let unwrappedGroupDictionary = unwrappedSingleDictionary["group"] as? [String: Any] else {print("Group Dictionary did not unwrap"); return}
                //third level of abstraction--- Dictionary within Dictionary
                
                guard let unwrappedGroupName = unwrappedGroupDictionary["name"] as? String else {
                    print("group name did not unwrap"); return}
                
                let singleMeetupObject = SingleMeetup(groupName: unwrappedGroupName, eventName: unwrappedEventName, venueZip: unwrappedZipVenue, venueCountry: unwrappedCountryVenue, venueCity: unwrappedCityVenue, venueAddress: unwrappedAddressVenue, venuePhone: unwrappedPhoneNumVenue, venueName: unwrappedNameVenue, venueState: unwrappedStateVenue)
                
                print("***********************************************************")
                print("Meetup Group Name: \(singleMeetupObject.groupName)")
                print("Meetup Event Name: \(singleMeetupObject.eventName)")
                print("Meetup Venue Zip: \(singleMeetupObject.venueZip)")
                print("Meetup Venue Country: \(singleMeetupObject.venueCountry)")
                print("Meetup Venue City: \(singleMeetupObject.venueCity)")
                print("Meetup Venue Address: \(singleMeetupObject.venueAddress)")
                print("Meetup Venue Phone: \(singleMeetupObject.venuePhone)")
                print("Meetup Venue Name: \(singleMeetupObject.venueName)")
                print("Meetup Venue State: \(singleMeetupObject.venueState)")
                print("***********************************************************")
                
                self.meetupArray.append(singleMeetupObject)
                print(self.meetupArray.count)
            }
            Completion(meetupArray)
        }
    }

}
