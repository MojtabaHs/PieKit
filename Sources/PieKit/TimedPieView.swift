//
//  TimedPieView.swift
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

public protocol TimedPieViewDelegate: class {
    /// Calls each time the progress changes automatically by the timer.
    ///
    /// - Note: This method can cause a huge impact on performance. The called is responsible for preventing it from executing heavy instructions.
    /// - Parameters:
    ///   - pie: The pie for this delegate.
    ///   - remainingTime: The remaining time of the timer.
    func timedPie(_ pie: PieView, didChangeRemainingTime remainingTime: TimeInterval)
}

open class TimedPieView: PieView {

    /// The instance that holds the timer.
    private var timer: Timer?

    /// The finishing date of the pie.
    private(set) var endDate = Date()

    /// The interval of redrawing the pie.
    public var timeInterval: TimeInterval = 0.01

    /// The delegate that is responsible for outside events.
    public weak var delegate: TimedPieViewDelegate?

    /// The duration of the timer.
    public var duration: TimeInterval = 0 {
        didSet {
            timer?.invalidate()
            progress = 1
            endDate = Date(timeIntervalSinceNow: duration)
            timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { [weak self] timer in
                guard let self = self else { return }
                let remainingTime = Date().distance(to: self.endDate)/self.duration
                let progress = CGFloat(remainingTime)
                DispatchQueue.main.async {
                    self.progress = progress
                    self.delegate?.timedPie(self, didChangeRemainingTime: remainingTime)
                }
                guard progress <= 0 else { return }
                timer.invalidate()
                self.progress = 0
            }
        }
    }

    /// Ensures the invalidation of the timer.
    deinit { timer?.invalidate() }
}
