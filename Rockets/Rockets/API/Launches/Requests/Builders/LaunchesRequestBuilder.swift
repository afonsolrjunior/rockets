//
//  LaunchesRequestBuilder.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 29/01/2023.
//

import Foundation

struct LaunchesRequestBuilder {
    
    private let endpoint: LaunchesEndpoint
    private var requestBodyQuery: [String: String]
    private var requestBodySelectOptions: [String: UInt]?
    private var requestBodySortOption: RequestBodySortOption?
    private var requestBodyLimitOption: UInt?
    private var requestBodyPopulateOptions: [RequestBodyPopulateOption]?
    
    init(
        endpoint: LaunchesEndpoint,
        requestBodyQuery: [String : String] = [:],
        requestBodySelectOptions: [String : UInt]? = nil,
        requestBodySortOption: RequestBodySortOption? = nil,
        requestBodyLimitOption: UInt? = nil,
        requestBodyPopulateOptions: [RequestBodyPopulateOption]? = nil
    ) {
        self.endpoint = endpoint
        self.requestBodyQuery = requestBodyQuery
        self.requestBodySelectOptions = requestBodySelectOptions
        self.requestBodySortOption = requestBodySortOption
        self.requestBodyLimitOption = requestBodyLimitOption
        self.requestBodyPopulateOptions = requestBodyPopulateOptions
    }
    
    func add(queryDictionary: [String: String]) -> LaunchesRequestBuilder {
        LaunchesRequestBuilder(endpoint: endpoint,
                               requestBodyQuery: requestBodyQuery.merging(queryDictionary, uniquingKeysWith: { $1 }),
                               requestBodySelectOptions: requestBodySelectOptions,
                               requestBodySortOption: requestBodySortOption,
                               requestBodyLimitOption: requestBodyLimitOption,
                               requestBodyPopulateOptions: requestBodyPopulateOptions)
    }
    
    func add(selectOption: String) -> LaunchesRequestBuilder {
        var requestBodySelectOptions = self.requestBodySelectOptions ?? [selectOption: 1]
        requestBodySelectOptions[selectOption] = 1
        
        return LaunchesRequestBuilder(endpoint: endpoint,
                                      requestBodyQuery: requestBodyQuery,
                                      requestBodySelectOptions: requestBodySelectOptions,
                                      requestBodySortOption: requestBodySortOption,
                                      requestBodyLimitOption: requestBodyLimitOption,
                                      requestBodyPopulateOptions: requestBodyPopulateOptions)
    }
    
    func add(sortOption: RequestBodySortOption) -> LaunchesRequestBuilder {
        LaunchesRequestBuilder(endpoint: endpoint,
                               requestBodyQuery: requestBodyQuery,
                               requestBodySelectOptions: requestBodySelectOptions,
                               requestBodySortOption: sortOption,
                               requestBodyLimitOption: requestBodyLimitOption,
                               requestBodyPopulateOptions: requestBodyPopulateOptions)
    }
    
    func add(limitOption: UInt) -> LaunchesRequestBuilder {
        LaunchesRequestBuilder(endpoint: endpoint,
                               requestBodyQuery: requestBodyQuery,
                               requestBodySelectOptions: requestBodySelectOptions,
                               requestBodySortOption: requestBodySortOption,
                               requestBodyLimitOption: limitOption,
                               requestBodyPopulateOptions: requestBodyPopulateOptions)
    }
    
    func add(populateOptionPath: RequestBodyPopulateOptionPath, properties: [RequestBodyPopulateOptionSelectKey]) -> LaunchesRequestBuilder {
        var propertiesDictionary: [RequestBodyPopulateOptionSelectKey: UInt] = [:]
        for property in properties {
            propertiesDictionary[property] = 1
        }
        
        let populateOption = RequestBodyPopulateOption(path: populateOptionPath, select: propertiesDictionary)
        let requestBodyPopulateOptions = self.requestBodyPopulateOptions ?? [populateOption]
        var populateOptions = Set<RequestBodyPopulateOption>(requestBodyPopulateOptions)
        populateOptions.insert(populateOption)
        
        return LaunchesRequestBuilder(endpoint: endpoint,
                                      requestBodyQuery: requestBodyQuery,
                                      requestBodySelectOptions: requestBodySelectOptions,
                                      requestBodySortOption: requestBodySortOption,
                                      requestBodyLimitOption: requestBodyLimitOption,
                                      requestBodyPopulateOptions: populateOptions.map({ $0 }))
    }
    
    func build() -> LaunchesRequest {
        let options = RequestBodyOptions(select: requestBodySelectOptions,
                                         sort: requestBodySortOption,
                                         limit: requestBodyLimitOption,
                                         populate: requestBodyPopulateOptions)
        let body = RequestBody(query: requestBodyQuery, options: options)
        return LaunchesRequest(endpoint: endpoint, body: body)
    }
    
}
