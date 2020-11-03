//
//  PieView.swift
//  PieKit
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 11/3/20.
//  Copyright © 2020 Chenzook. All rights reserved.
//
//
//  StackOverflow: https://stackoverflow.com/story/mojtabahosseini
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//

import UIKit

open class PieView: UIView {

    public var progress: CGFloat = 0.3 { didSet { setNeedsDisplay() } }
    
    public var fillColor: UIColor = .red { didSet { setNeedsDisplay() } }

    public override func draw(_ rect: CGRect) {
        // Drawing code
        PieShape.drawPie(frame: bounds, progress: progress, fillColor: fillColor)
    }

    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        backgroundColor = .clear
    }
}
