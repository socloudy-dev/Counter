import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var valueOfCounter: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var resetCounterButton: UIButton!
    @IBOutlet weak var logTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private var count = 0
    private var formattedCurrentDate: String {
        DateFormatter.localizedString(
            from: Date(),
            dateStyle: .short,
            timeStyle: .medium)
    }
    
    @IBAction func plusButtonAction() {
        count += 1
        valueOfCounter.text = "Значение счетчика: \(count)"
        logTextView.text += "\n[\(formattedCurrentDate)]: значение изменено на +1"
        scrollDown()
    }
    
    @IBAction func minusButtonAction(_ sender: Any) {
        if count > 0 {
            count -= 1
            valueOfCounter.text = "Значение счетчика: \(count)"
            logTextView.text += "\n[\(formattedCurrentDate)]: значение изменено на -1"
            scrollDown()
        } else {
            logTextView.text += "\n[\(formattedCurrentDate)]: попытка уменьшить значение счётчика ниже 0"
            scrollDown()
        }
        
    }
    
    @IBAction func resetCounterAction(_ sender: Any) {
        if count != 0 {
            count = 0
        }
        valueOfCounter.text = "Значение счетчика: \(count)"
        logTextView.text += "\n[\(formattedCurrentDate)]: значение сброшено"
        scrollDown()
    }
    
    func scrollDown() {
        let range = NSMakeRange(logTextView.text.count, 0)
        logTextView.scrollRangeToVisible(range)
    }
}

