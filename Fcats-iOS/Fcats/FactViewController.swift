import UIKit

class FactViewController: UIViewController {
    
    @IBOutlet weak var factLabel: UILabel!
    
    var facts: [String]!
    
    override func viewDidLoad() {
        randomFact()
    }
    
    @IBAction func randomFact() {
        factLabel.text = facts.randomElement() ?? "Little is known about these cats."
    }
}
