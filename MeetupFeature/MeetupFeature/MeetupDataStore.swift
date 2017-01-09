//
//  MeetupDataStore.swift
//  MeetupFeature
//
//  Created by Flatiron School on 1/8/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class MeetupDataStore{

    static let sharedInstance = MeetupAPIClient()
    private init(){}
    
    var meetupArray: [SingleMeetup] = []
    
    func getMeetupInformationWith(Completion: @escaping(Array<Any>) -> ()){
    
        MeetupAPIClient.getMeetupInformation { (meetupArray) in
            for singleDictionary in meetupArray{

                guard let unwrappedSingleDictionary = singleDictionary as? [String: Any] else {
                    print("singleDictionary in array did not unwrap"); return}
                
                guard let
                    unwrappedEventName = unwrappedSingleDictionary["name"] as? String else {print("group name did not unwrap"); return}
                //Event Name - first level of abstraction
                
                guard let unwrappedVenueDictionary = unwrappedSingleDictionary["venue"] as? [String: Any] else {print("Venue Dictionary did not unwrap"); return}
                
                guard
                    let unwrappedZipVenue = unwrappedVenueDictionary["zip"] as? String,
                    let unwrappedCountryVenue = unwrappedVenueDictionary["country"] as? String,
                    let unwrappedCityVenue = unwrappedVenueDictionary["city"] as? String,
                    let unwrappedAddressVenue = unwrappedVenueDictionary["address_1"] as? String,
                    let unwrappedPhoneNumVenue = unwrappedVenueDictionary["phone"] as? String,
                    let 
                
                
                
                
                
                
                
                
                
                
            
            }
        }
    
    }
    
    
    


}
