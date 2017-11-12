//
//  ViewController.swift
//  Transit Status
//
//  Created by Neftali Samarey on 11/11/17.
//  Copyright © 2017 Neftali Samarey. All rights reserved.
//

import UIKit
import Firebase
import CircleMenu

extension UIColor {
    static func color(_ red: Int, green: Int, blue: Int, alpha: Float) -> UIColor {
        return UIColor(
            red: 1.0 / 255.0 * CGFloat(red),
            green: 1.0 / 255.0 * CGFloat(green),
            blue: 1.0 / 255.0 * CGFloat(blue),
            alpha: CGFloat(alpha))
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , CircleMenuDelegate{
    
    @IBOutlet weak var TSTableview: UITableView!
    var Feedback : UINotificationFeedbackGenerator?
    
    var TSReportView = PopoverView()
    var card = Card()
    
    @IBAction func TSTapticEngine(_ sender: Any) {
        
        
        UIView.animate(withDuration: 0.5, animations: {
            self.view.addSubview(self.TSReportView)
        })
        Feedback?.notificationOccurred(.success)
    }
    
    
    
    let ref = Database.database().reference()
    let items: [(icon: String, color: UIColor)] = [
        ("icon_home", UIColor(red:0.19, green:0.57, blue:1, alpha:1)),
        ("icon_search", UIColor(red:0.22, green:0.74, blue:0, alpha:1)),
        ("notifications-btn", UIColor(red:0.96, green:0.23, blue:0.21, alpha:1)),
        ("settings-btn", UIColor(red:0.51, green:0.15, blue:1, alpha:1)),
        ("nearby-btn", UIColor(red:1, green:0.39, blue:0, alpha:1)),
        ]

    var trainLines = ["R", "4", "F"]
    

    //let rootReference = FirebaseApp.data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TSTableview.delegate = self
        TSTableview.dataSource = self
        TSTableview.register(TransitStatusTableViewCell.self, forCellReuseIdentifier: "cell")
        self.TSTableview.rowHeight = 100
        self.title = "Transit Status"
        
        Feedback = UINotificationFeedbackGenerator()
        // Adding a button on lower bottom

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       let status = ref.child("Status")
        status.observe(.value) {(snap: DataSnapshot) in
//            let value = snap.value
//            self.trainLines.append(value as! String)
//            for item in self.trainLines {
//                print(">> \(item)")
//            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK - Tableview
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainLines.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TransitStatusTableViewCell
        //cell.TrainLineLabel.text = trainLines[indexPath.row]
       //  cell.textLabel!.text = trainLines[indexPath.row]
        cell.TSLabel.text = trainLines[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected \(indexPath.row)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        return "Current Status as of \(hour):\(minutes)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
   

    // MARK: <CircleMenuDelegate>
    
    func circleMenu(_ circleMenu: CircleMenu, willDisplay button: UIButton, atIndex: Int) {
        
        button.backgroundColor = items[atIndex].color
        button.setImage(UIImage(named: items[atIndex].icon), for: .normal)
        
        // set highlited image
        let highlightedImage  = UIImage(named: items[atIndex].icon)?.withRenderingMode(.alwaysTemplate)
        button.setImage(highlightedImage, for: .highlighted)
        button.tintColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
    
    func circleMenu(_ circleMenu: CircleMenu, buttonWillSelected button: UIButton, atIndex: Int) {
        print("button will selected: \(atIndex)")
    }
    
    func circleMenu(_ circleMenu: CircleMenu, buttonDidSelected button: UIButton, atIndex: Int) {
        print("button did selected: \(atIndex)")
    }

}

