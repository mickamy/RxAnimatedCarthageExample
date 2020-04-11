//
//  ViewController.swift
//  RxAnimatedCarthageExample
//
//  Created by mickamy on 2020/04/07.
//  Copyright © 2020 mickamy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxAnimated

class ViewController: UIViewController {
    private let bag = DisposeBag()
    private let label = UILabel()
    private let timer = Observable<Int>.timer(RxTimeInterval.seconds(0), period: RxTimeInterval.seconds(1), scheduler: MainScheduler.instance)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        // Animate `text` with a crossfade
        timer
            .map { "Text + fade [\($0)]" }
            .bind(animated: label.rx.animated.fade(duration: 0.33).text)
            .disposed(by: bag)
    }
}

