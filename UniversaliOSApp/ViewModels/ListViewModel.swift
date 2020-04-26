//
//  ListViewModel.swift
//  UniversaliOSApp
//
//  Created by Ayush Mishra on 26/04/20.
//  Copyright © 2020 Ayush Mishra. All rights reserved.
//

import Foundation
class ListViewModel {
    static let shared = ListViewModel()
    var heading = Title()
    var arrListData = [SubTitle]()
    init() {
        self.heading = Title()
        self.arrListData = [SubTitle]()
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return self.arrListData.count
    }
    
    func modelAt(_ index: Int) -> SubTitle {
        return self.arrListData[index]
    }
    
}
