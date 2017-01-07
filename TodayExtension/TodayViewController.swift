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
        
        view.addSubview(lbl)
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        lbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 18).isActive = true
        lbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -18).isActive = true
        
        lbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 18).isActive = true
        lbl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -18).isActive = true
        
        // view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        lbl.preferredMaxLayoutWidth = 300
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func widgetActiveDisplayModeDidChange(activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        // This isnt getting called
        if activeDisplayMode == .expanded {
            preferredContentSize = CGSize(width: 0.0, height: 200.0)
        } else if activeDisplayMode == .compact {
            preferredContentSize = maxSize
        }
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
