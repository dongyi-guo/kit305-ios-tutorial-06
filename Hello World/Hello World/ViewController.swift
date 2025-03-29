//
//  ViewController.swift
//  Hello World
//
//  Created by Lindsay Wells on 2/1/18.
//  Copyright © 2018 University of Tasmania. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        // create an alert view
        let alert = UIAlertController(
            title: "Alert!",
            message: "Dongyi is now over 140kg! He is so fat and he may bring your floor to the ground one at any time!",
            preferredStyle: UIAlertController.Style.actionSheet
        )
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Oh No!",
                                      style: UIAlertAction.Style.default,
                                      handler: {_ in print("Well I show after the alertbox is ticked.")}
                                     ))

        // show the alert
        self.present(alert,
                     animated: true,
                     completion: nil
                    )
        print("Got to this part of the program")
    }
}
