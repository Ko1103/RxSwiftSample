//
//  ViewController.swift
//  RxSwiftSample
//
//  Created by 山浦功 on 2018/03/11.
//  Copyright © 2018年 KoYamaura. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet private weak var titleTextView: UITextView!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var submitButton: UIButton!
    
    private let viewModel = ViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBind()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpBind() {
        
        self.titleTextView.rx.text.orEmpty
            .bind(to: self.viewModel.title)
            .disposed(by: disposeBag)
        
        self.viewModel.countTitle
            .map({ count -> String in
                String(count)
            })
            .bind(to: self.numberLabel.rx.text)
            .disposed(by: disposeBag)
        
        self.viewModel.shouldSubmit
            .bind(to: self.submitButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
}

