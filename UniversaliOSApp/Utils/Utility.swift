//
//  Utility.swift
//  UniversaliOSApp
//
//  Created by Ayush Mishra on 29/04/20.
//  Copyright © 2020 Ayush Mishra. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
