import UIKit

enum Operation {
    case none
    case sum
    case minus
    case multiplication
    case division
}

class CalculatorVC: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var fractionButton: UIButton!
    @IBOutlet weak var equalsButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    
    var state: Operation = .none
    var firstValue: Double = 0
    var secondValue: Double = 0
    
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
        secondValue = Double(value) ?? 0
        
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
        default:
            break
        }
    }
    
    @IBAction func sumOperation(_ sender: UIButton) {
    
        guard let value = resultLabel.text else { return }
        firstValue = Double(value) ?? 0
        state = .sum
        resultLabel.text = ""
        
    }
    
    @IBAction func minusOperation(_ sender: UIButton) {
        guard let value = resultLabel.text else { return }
        firstValue = Double(value) ?? 0
        state = .minus
        resultLabel.text = ""
    }
    
    @IBAction func multiplicationOperation(_ sender: UIButton) {
        guard let value = resultLabel.text else { return }
        firstValue = Double(value) ?? 0
        state = .multiplication
        resultLabel.text = ""
    }
    
    @IBAction func divisionOperation(_ sender: UIButton) {
        guard let value = resultLabel.text else { return }
        firstValue = Double(value) ?? 0
        state = .division
        resultLabel.text = ""
    }
    
    @IBAction func fractionOperation(_ sender: UIButton) {
        if !(resultLabel.text?.contains(".") ?? false) {
            guard let value = resultLabel.text else { return }
            resultLabel.text = "\(value)."
        }
    }
}

