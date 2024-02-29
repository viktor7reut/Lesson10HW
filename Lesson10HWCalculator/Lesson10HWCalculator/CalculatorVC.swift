//
//  CalculatorVC.swift
//  Lesson10HWCalculator
//
//  Created by Виктор Реут on 28.02.24.
//

import UIKit

enum Operation {
    case none
    case sum
    case minus
    case multiplication
    case division
    case fraction
}

class CalculatorVC: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var nullButton: UIButton!
    @IBOutlet weak var fractionButton: UIButton!
    @IBOutlet weak var equalsButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    
    var state: Operation = .none
    var firstValue: Int = 0
    var secondValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func sendValue(_ sender: UIButton) {
        var value = resultLabel.text ?? ""
        value += "\(sender.tag)"
        resultLabel.text = value
    }
    
    
    @IBAction func resultAction(_ sender: UIButton) {
        guard let value = resultLabel.text else { return }
        secondValue = Int(value) ?? 0
        
        switch state {
        case .sum:
            let result = firstValue + secondValue
            resultLabel.text = "\(result)"
        case .minus:
            let result = firstValue - secondValue
            resultLabel.text = "\(result)"
        case .multiplication:
            let result = firstValue * secondValue
            resultLabel.text = "\(result)"
        case .division:
            let result = Double(firstValue) / Double(secondValue)
            resultLabel.text = "\(result)"
        case .fraction:
            let result = Double("\(firstValue).\(secondValue)") //?
            resultLabel.text = "\(result)"
        default:
            break
        }
    }
    
    @IBAction func sumOperation(_ sender: UIButton) {
        guard let value = resultLabel.text else { return }
        firstValue = Int(value) ?? 0
        state = .sum
        resultLabel.text = ""
    }
    
    @IBAction func minusOperation(_ sender: UIButton) {
        guard let value = resultLabel.text else { return }
        firstValue = Int(value) ?? 0
        state = .minus
        resultLabel.text = ""
    }
    
    @IBAction func subsctractionOperation(_ sender: UIButton) {
        guard let value = resultLabel.text else { return }
        firstValue = Int(value) ?? 0
        state = .multiplication
        resultLabel.text = ""
    }
    
    @IBAction func divisionOperation(_ sender: UIButton) {
        guard let value = resultLabel.text else { return }
        firstValue = Int(value) ?? 0
        state = .division
        resultLabel.text = ""
    }
    
    @IBAction func fractionOperation(_ sender: UIButton) {
        guard let value = resultLabel.text else { return }
        firstValue = Int(value) ?? 0
        resultLabel.text = "\(value)."
        state = .fraction
    }
    
}
