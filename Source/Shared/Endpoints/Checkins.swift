//
//  Checkins.swift
//  Quadrat
//
//  Created by Constantine Fry on 06/11/14.
//  Copyright (c) 2014 Constantine Fry. All rights reserved.
//

import Foundation

public class Checkins: Endpoint {
    override var endpoint: String {
        return "checkins"
    }
    
    /** https://developer.foursquare.com/docs/checkins/checkins */
    public func get(_ checkinId: String, parameters: Parameters?, completionHandler: ResponseClosure? = nil) -> Task {
        return self.get(checkinId, parameters: nil, completionHandler: completionHandler)
    }
    
    // MARK: - General
    
    /** https://developer.foursquare.com/docs/checkins/add */
    public func add(_ venueId: String, parameters: Parameters?, completionHandler: ResponseClosure? = nil) -> Task {
        let path = "add"
        var allParameters = [Parameter.venueId:venueId]
        allParameters += parameters
        return self.post(with: path, parameters: allParameters, completionHandler: completionHandler)
    }
    
    /** https://developer.foursquare.com/docs/checkins/recent */
    public func recent(_ parameters: Parameters?, completionHandler: ResponseClosure? = nil) -> Task {
        let path = "recent"
        return self.get(path, parameters: parameters, completionHandler: completionHandler)
    }
    
    
    // MARK: - Aspects
    
    /** https://developer.foursquare.com/docs/checkins/likes */
    public func likes(_ checkinId: String, completionHandler: ResponseClosure? = nil) -> Task {
        let path = checkinId + "/likes"
        return self.get(path, parameters: nil, completionHandler: completionHandler)
    }
    
    // MARK: - Actions
    
    /** https://developer.foursquare.com/docs/checkins/addcomment */
    public func addcomment(_ checkinId: String,
        parameters: Parameters?, completionHandler: ResponseClosure? = nil) -> Task {
            let path = checkinId + "/addcomment"
            return self.post(with: path, parameters: parameters, completionHandler: completionHandler)
    }
    
    /** https://developer.foursquare.com/docs/checkins/addpost */
    public func addpost(_ checkinId: String, parameters: Parameters?, completionHandler: ResponseClosure? = nil) -> Task {
        let path = checkinId + "/addpost"
        return self.post(with: path, parameters: parameters, completionHandler: completionHandler)
    }
    
    /** https://developer.foursquare.com/docs/checkins/deletecomment */
    public func deletecomment(_ checkinId: String, commentId: String, completionHandler: ResponseClosure? = nil) -> Task {
        let path = checkinId + "/deletecomment"
        let parameters = [Parameter.commentId:commentId]
        return self.post(with: path, parameters: parameters, completionHandler: completionHandler)
    }
    
    /** https://developer.foursquare.com/docs/checkins/like */
    public func like(_ checkinId: String, like: Bool, completionHandler: ResponseClosure? = nil) -> Task {
        let path = checkinId + "/like"
        let parameters = [Parameter.set: (like) ? "1":"0"]
        return self.post(with: path, parameters: parameters, completionHandler: completionHandler)
    }
}
