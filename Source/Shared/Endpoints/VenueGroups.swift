//
//  Venuegroups.swift
//  Quadrat
//
//  Created by Constantine Fry on 06/11/14.
//  Copyright (c) 2014 Constantine Fry. All rights reserved.
//

import Foundation

public class VenueGroups: Endpoint {
    override var endpoint: String {
        return "venuegroups"
    }
    
    /** https://developer.foursquare.com/docs/venuegroups/venuegroups */
    public func get(_ groupId: String, completionHandler: ResponseClosure? = nil) -> Task {
        return self.get(with: groupId, parameters: nil, completionHandler: completionHandler)
    }
    
    // MARK: - General
    
    /** https://developer.foursquare.com/docs/venuegroups/add */
    public func add(_ name: String, parameters: Parameters?, completionHandler: ResponseClosure? = nil) -> Task {
        let path = "add"
        var allParameters = [Parameter.name: name]
        allParameters += parameters
        return self.post(with: path, parameters: allParameters, completionHandler: completionHandler)
    }
    
    /** https://developer.foursquare.com/docs/venuegroups/delete */
    public func delete(_ groupId: String, completionHandler: ResponseClosure? = nil) -> Task {
        let path = groupId + "/delete"
        return self.post(with: path, parameters: nil, completionHandler: completionHandler)
    }
    
    /** https://developer.foursquare.com/docs/venuegroups/list */
    public func list(_ completionHandler: ResponseClosure? = nil) -> Task {
        let path = "list"
        return self.get(with: path, parameters: nil, completionHandler: completionHandler)
    }
    
    // MARK: - Aspects
    
    /** https://developer.foursquare.com/docs/venuegroups/timeseries */
    public func timeseries(_ groupId: String,
        parameters: Parameters?, completionHandler: ResponseClosure? = nil) -> Task {
            let path = groupId + "/timeseries"
            return self.get(with: path, parameters: parameters, completionHandler: completionHandler)
    }
    
    // MARK: - Actions
    
    /** https://developer.foursquare.com/docs/venuegroups/addvenue */
    public func addvenue(_ groupId: String, venueId: [String], completionHandler: ResponseClosure? = nil) -> Task {
        let path = groupId + "/addvenue"
        let parameters = [Parameter.venueId: venueId.joined(separator: ",")]
        return self.post(with: path, parameters: parameters, completionHandler: completionHandler)
    }
    
    /** https://developer.foursquare.com/docs/venuegroups/edit */
    public func edit(_ groupId: String, parameters: Parameters?, completionHandler: ResponseClosure? = nil) -> Task {
        let path = groupId + "/edit"
        return self.post(with: path, parameters: parameters, completionHandler: completionHandler)
    }
    
    /** https://developer.foursquare.com/docs/venuegroups/removevenue */
    public func removevenue(_ groupId: String, venueId: [String], completionHandler: ResponseClosure? = nil) -> Task {
        let path = groupId + "/removevenue"
        let parameters = [Parameter.venueId: venueId.joined(separator: ",")]
        return self.post(with: path, parameters: parameters, completionHandler: completionHandler)
    }
    
    /** https://developer.foursquare.com/docs/venuegroups/update */
    public func update(_ groupId: String, parameters: Parameters?, completionHandler: ResponseClosure? = nil) -> Task {
        let path = groupId + "/update"
        return self.post(with: path, parameters: parameters, completionHandler: completionHandler)
    }
    
}
