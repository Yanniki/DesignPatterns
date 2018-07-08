//
//  LoadingOverlay.swift
//  Design Patterns
//
//  Created by Ioannis Pasmatzis on 8/7/18.
//  Copyright © 2018 Yanniki. All rights reserved.
//

import UIKit
import YanniWorks

class LoadingOverlay: UIView {
    
    override var isHidden: Bool {
        didSet {
            if isHidden {
                indicator.stopAnimating()
            } else {
                indicator.startAnimating()
            }
        }
    }
    
    private let background: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.4
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }()
    
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(background)
        background.frame = bounds
        background.addSubview(indicator)
        indicator.sizeToFit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        indicator.centerInParent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
