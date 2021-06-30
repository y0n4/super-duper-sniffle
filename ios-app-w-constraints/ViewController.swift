import UIKit

class ViewController: UIViewController {
    var currentLabel = "press button"

    override func viewDidLoad() {
        super.viewDidLoad()

        // label section
        someLabel.text = currentLabel
        
        // manually creating a label outlet
        let myLabel = UILabel()
        self.view.addSubview(myLabel)
        // adding decoration
        myLabel.backgroundColor = UIColor.orange
        myLabel.textAlignment = NSTextAlignment.center
        myLabel.font = UIFont.systemFont(ofSize: 18)
        myLabel.text = "manual outlet (no constraints)"
        // setting margin and size of frame and populate it with label
        let myFrame = CGRect (
            x: 20, // horiztonal margin
            y: 50, // vertical margin
            width: 374,
            height: 112
        )
        myLabel.frame = myFrame
        
        
        // manually creating outlet with constraints
        let redBox = UIView(frame: CGRect.zero)
        redBox.backgroundColor = UIColor.red
        self.view.addSubview(redBox)
        // tells compiler we are adding constraints
        redBox.translatesAutoresizingMaskIntoConstraints = false
        // 3 ways to set constraints programmatically
        // set height constraint
        redBox.heightAnchor.constraint(equalToConstant: 100).isActive = true
        // set margin (horiztonally and vertically) constraint at center
        redBox.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        redBox.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        // set width constraints with all the properties
        let widthCons = NSLayoutConstraint(
            item: redBox,
            attribute: NSLayoutConstraint.Attribute.width,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: 150
        )
        redBox.addConstraint(widthCons)
    }
    
    // segment section
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func selectedSegment(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        switch index {
            case 0:
                resultLabel.text = "changed to mango"
            case 1:
                resultLabel.text = "changed to kiwi"
            default:
                resultLabel.text = "changed to watermelon"
        }
    }
    
    // label section
    @IBOutlet weak var someLabel: UILabel!
    @IBAction func someButtonFunc() {
        someLabel.text = "button is pressed"
    }
}

