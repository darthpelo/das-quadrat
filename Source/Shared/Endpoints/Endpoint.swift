//
//  Endpoint.swift
//  Quadrat
//
//  Created by Constantine Fry on 06/11/14.
//  Copyright (c) 2014 Constantine Fry. All rights reserved.
//

import Foundation

public func +=<K, V> (left: inout Dictionary<K, V>, right: Dictionary<K, V>?) -> Dictionary<K, V> {
    right?.forEach {
        left.updateValue($1, forKey: $0)
    }
    return left
}

public class Endpoint {
    weak    var session: Session?
    private let baseURL: URL
    
    var endpoint: String {
        return ""
    }
    
    init(session: Session) {
        self.session = session
        self.baseURL = URL(string:session.configuration.server.apiBaseURL) as URL!
    }
    
    func get(with path: String, parameters: Parameters?, completionHandler: ResponseClosure?) -> Task {
        return self.task(with: path, parameters: parameters, httpMethod: "GET", completionHandler: completionHandler)
    }
    
    func post(with path: String, parameters: Parameters?, completionHandler: ResponseClosure?) -> Task {
        return self.task(with: path, parameters: parameters, httpMethod: "POST", completionHandler: completionHandler)
    }
    
    func uploadTask(from URL: URL, path: String,
        parameters: Parameters?, completionHandler: ResponseClosure?) -> Task {
        let request = self.request(with: path, parameters: parameters, httpMethod: "POST")
            let task = UploadTask(session: self.session!, request: request, completionHandler: completionHandler)
            task.fileURL = URL
            return task
    }
    
    private func task(with path: String, parameters: Parameters?,
        httpMethod: String, completionHandler: ResponseClosure?) -> Task {
        let request = self.request(with: path, parameters: parameters, httpMethod: httpMethod)
            return DataTask(session: self.session!, request: request, completionHandler: completionHandler)
    }
    
    private func request(with path: String, parameters: Parameters?, httpMethod: String) -> Request {
        var sessionParameters = session!.configuration.parameters()
        if sessionParameters[Parameter.oauth_token] == nil {
            do {
                let accessToken = try session!.keychain.accessToken()
                if let accessToken = accessToken {
                    sessionParameters[Parameter.oauth_token] = accessToken
                }
            } catch {
                
            }
        }
        let request = Request(baseURL: self.baseURL, path: (self.endpoint + "/" + path),
            parameters: parameters, sessionParameters: sessionParameters, HTTPMethod: httpMethod)
        request.timeoutInterval = session!.configuration.timeoutInterval
        return request
    }
}
