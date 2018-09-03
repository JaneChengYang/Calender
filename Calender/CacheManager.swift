//
//  CacheManager.swift
//  Calender
//
//  Created by Simon on 2018/8/24.
//  Copyright © 2018年 Simon. All rights reserved.
//

import Foundation
enum CacheConfiguration{
    static let maxObjects = 100
    static let maxSize = 1024*1024*50
}
final class CacheManager {
    static let shard:CacheManager = CacheManager()
    private static var cache:NSCache<NSString, AnyObject> = {
        let cache = NSCache<NSString, AnyObject>()
        cache.countLimit = CacheConfiguration.maxObjects
        cache.totalCostLimit = CacheConfiguration.maxSize
        return cache
    }()
    private init(){}
    func cache(object: AnyObject, key: String) {
        CacheManager.cache.setObject(object, forKey: key as NSString)
    }
    
    func getFromCache(key: String) -> AnyObject? {
        return CacheManager.cache.object(forKey: key as NSString)
    }
}
