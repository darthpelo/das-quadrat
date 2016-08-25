//
//  Pageupdates.swift
//  Quadrat
//
//  Created by Constantine Fry on 06/11/14.
//  Copyright (c) 2014 Constantine Fry. All rights reserved.
//

import Foundation

public class PageUpdates: Endpoint {
    override var endpoint: String {
        return "pageupdates"
    }
    
    /** https://developer.foursquare.com/docs/pageupdates/pageupdates */
    public func get(_ updateId: String, parameters: Parameters?, completionHandler: ResponseClosure? = nil) -> Task {
        return self.get(updateId, parameters: parameters, completionHandler: completionHandler)
    }
    
    // MARK: - General
    
    /** https://developer.foursquare.com/docs/pageupdates/add */
    public func add(_ pageId: String, parameters: Parameters?, completionHandler: ResponseClosure? = nil) -> Task {
        let path = pageId + "/add"
        return self.post(with: path, parameters: parameters, completionHandler: completionHandler)
    }
    
    /** https://developer.foursquare.com/docs/pageupdates/list */
    public func list(_ completionHandler: ResponseClosure? = nil) -> Task {
        let path = "list"
        return self.get(path, parameters: nil, completionHandler: completionHandler)
    }
    
    // MARK: - Actions
    
    /** https://developer.foursquare.com/docs/pageupdates/delete */
    public func delete(_ updateId: String, completionHandler: ResponseClosure? = nil) -> Task {
        let path = updateId + "/delete"
        return self.post(with: path, parameters: nil, completionHandler: completionHandler)
    }
    
    /** https://developer.foursquare.com/docs/pageupdates/like */
    public func like(_ updateId: String, completionHandler: ResponseClosure? = nil) -> Task {
        let path = updateId + "/like"
        return self.post(with: path, parameters: nil, completionHandler: completionHandler)
    }
}
