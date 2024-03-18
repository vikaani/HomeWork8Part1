//
//  Logger.swift
//  Lesson8HW
//

import UIKit

protocol PrinterDelegate: AnyObject {
    func textToPrint() -> String
}

class Printer {
    weak var delegate: PrinterDelegate?
    
    private var timer: Timer?
    private var seconds: Int = 0
    
    func startPrinting() {
        
        stop()
        
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(timerAction),
            userInfo: nil,
            repeats: true
        )
        
    }
    
    func stop() {
        timer?.invalidate()
    }
    
    @objc private func timerAction() {
        guard let delegate else { return }

        let secondsText = "\(seconds) секунд"
        
        print("\(delegate.textToPrint()) \(secondsText)")
        
        seconds += 1
    }
}
