//
//  ListModel.swift
//  UniversaliOSApp
//
//  Created by Ayush Mishra on 26/04/20.
//  Copyright © 2020 Ayush Mishra. All rights reserved.
//

import Foundation
struct Title : Decodable {
    var title : String?
    var rows :[SubTitle]?
}
struct SubTitle : Decodable {
    var title : String?
    var description : String?
    var imageHref : String?
}

