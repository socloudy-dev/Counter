import UIKit

final class ViewController: UIViewController {

    private var count = 0
    private var formattedCurrentDate: String {
        DateFormatter.localizedString(
            from: Date(),
            dateStyle: .short,
            timeStyle: .medium)
    }
    
    @IBOutlet private weak var valueOfCounter: UILabel!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var resetCounterButton: UIButton!
    @IBOutlet private weak var logTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func scrollDown() {
        let range = NSMakeRange(logTextView.text.count - 1, 1)
        logTextView.scrollRangeToVisible(range)
    }
    
    @IBAction private func plusButtonAction() {
        count += 1
        valueOfCounter.text = "Значение счетчика: \(count)"
        logTextView.text += "\n[\(formattedCurrentDate)]: значение изменено на +1"
        scrollDown()
        
        print(Bundle.main.bundlePath)
    }
    
    @IBAction private func minusButtonAction(_ sender: Any) {
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
    
    @IBAction private func resetCounterAction(_ sender: Any) {
        if count != 0 {
            count = 0
        }
        valueOfCounter.text = "Значение счетчика: \(count)"
        logTextView.text += "\n[\(formattedCurrentDate)]: значение сброшено"
        scrollDown()
    }
    
}
