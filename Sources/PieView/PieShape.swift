//
//  PieShape.swift
//  PieView
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

final internal class PieShape: NSObject {

    /// Draws a pie.
    /// - Parameters:
    ///   - frame: The frame containing the pie.
    ///   - progress: The progress of the pie. 1 means full.
    public dynamic class func drawPie(frame: CGRect = CGRect(x: 0, y: 0, width: 100, height: 100),
                                      progress: CGFloat,
                                      fillColor: UIColor = .red) {

        //// Variable Declarations
        let calculatedAngle: CGFloat = (1 - progress) * 360 + 90

        //// Oval Drawing
        let ovalRect = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: frame.height)
        let ovalPath = UIBezierPath()
        ovalPath.addArc(withCenter: CGPoint(x: ovalRect.midX, y: ovalRect.midY), radius: ovalRect.width / 2, startAngle: -450 * CGFloat.pi/180, endAngle: -calculatedAngle * CGFloat.pi/180, clockwise: true)
        ovalPath.addLine(to: CGPoint(x: ovalRect.midX, y: ovalRect.midY))
        ovalPath.close()

        fillColor.setFill()
        ovalPath.fill()
    }
}
