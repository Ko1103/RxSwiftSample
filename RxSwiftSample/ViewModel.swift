//
//  ViewModel.swift
//  RxSwiftSample
//
//  Created by 山浦功 on 2018/03/11.
//  Copyright © 2018年 KoYamaura. All rights reserved.
//

import Foundation
import RxSwift


class ViewModel{
    
    let title = Variable<String>("")
    let countTitle: Observable<Int>
    let shouldSubmit: Observable<Bool>
    
    init() {
        self.countTitle = self.title.asObservable().map({ text -> Int in
            text.count
        })
        self.shouldSubmit = self.countTitle.map({ count -> Bool in
            0 < count && count <= 20
        })
    }
}
