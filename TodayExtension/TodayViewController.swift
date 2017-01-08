//
//  TodayViewController.swift
//  TodayExtension
//
//  Created by David Everlöf on 2017-01-07.
//  Copyright © 2017 David Everlöf. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {

    let lbl = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        view.backgroundColor = .red
        lbl.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vitae tempor nulla, in volutpat lectus. Sed quis orci sit amet velit cursus congue non accumsan turpis. Phasellus quis augue lobortis, pharetra arcu vitae, condimentum nunc. Nam rutrum massa ac feugiat eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non erat orci. Ut consequat faucibus sapien, et luctus magna posuere tempor."
        lbl.numberOfLines = 0
        lbl.backgroundColor = .blue
        lbl.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        lbl.preferredMaxLayoutWidth = view.frame.width - (2 * 18)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if activeDisplayMode == .expanded {
            print("EXPANDED")
            preferredContentSize = CGSize(width: 0.0, height: 0.0)
            setupLabel()
        } else if activeDisplayMode == .compact {
            print("COMPACT")
            preferredContentSize = maxSize
            setupLabel()
        }
    }
    
    func setupLabel() {
        lbl.removeFromSuperview()
        view.addSubview(lbl)
        lbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 18).isActive = true
        lbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -18).isActive = true
        lbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 18).isActive = true
        lbl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -18).isActive = true
        lbl.setContentCompressionResistancePriority(1000, for: .vertical)
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
