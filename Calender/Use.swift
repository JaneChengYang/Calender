//
//  Use.swift
//  Calender
//
//  Created by Simon on 2018/6/3.
//  Copyright © 2018年 Simon. All rights reserved.
//

import Foundation
struct Use:Codable{
    var use:String?
    var money = ""
//    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in:.userDomainMask).first
//    //寫檔案
////    static func saveToFile(use:[Use],total:Int){
////        let propertyListEncoder = PropertyListEncoder()
////        if let data = try? propertyListEncoder.encode(use),let total = try? propertyListEncoder.encode(total){
////            let url = Use.documentsDirectory?.appendingPathComponent("user")
////            try? data.write(to: url!)
////            try? total.write(to: url!)
////        }
////    }
//    static func saveToFile(use:[Use]){
//        let propertyListEncoder = PropertyListEncoder()
//        if let data = try? propertyListEncoder.encode(use){
//            let url = Use.documentsDirectory?.appendingPathComponent("user")
//            try? data.write(to: url!)
//        }
//    }
//    //讀檔案
//    static func decoderUse() -> [Use]?{
//      let propertyListDecoder = PropertyListDecoder()
//        let url = Use.documentsDirectory?.appendingPathComponent("user")
//        if let data = try? Data(contentsOf: url!),let user = try?propertyListDecoder.decode([Use].self, from: data){
//            return user
//        }else{
//            return nil
//        }
//    }
//}
//struct Moneny:Codable{
//       // var money = [0,0,0,0,0,0,0,0,0,0,0,0,0,0]
//    var money = ["","","","","","","","","","","","","",""]
//   // var money = [String]()
//    var total:Int
////    init(){
////        self.money = ["","","","","","","","","","","","","",""]
////    }
}
