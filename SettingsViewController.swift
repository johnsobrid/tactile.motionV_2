//
//  SettingsViewController.swift
//  tactile.motion_v2
//
//  Created by Bridget Johnson on 29/10/15.
//  Copyright © 2015 bdj. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {


   @IBOutlet var ipField: UITextField!
      
   @IBOutlet var portField: UITextField!
   
      var ipString = String()
      var portString = String()
      
      override func viewDidLoad() {
         super.viewDidLoad()
         
         // Do any additional setup after loading the view.
         ipString = "169.254.11.110"
         portString = "5558"
         ipField.text = ipString
         portField.text = portString
         
      }
      
      override func didReceiveMemoryWarning() {
         super.didReceiveMemoryWarning()
         // Dispose of any resources that can be recreated.
      }
      
      
   @IBAction func connectPressed(sender: UIButton) {

      ipString = ipField.text!
      portString = portField.text!
   }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      if let identifier = segue.identifier {
         if identifier == "connect" {
            if let newVC = segue.destinationViewController as? GameViewController {
               newVC.manual_IP = ipString
               newVC.manual_Port = portString
            }
         }
      }
   }
   
}
