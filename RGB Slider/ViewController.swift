//
//  ViewController.swift
//  RGB Slider
//
//  Created by Carol Greenberg on 10/29/17.
//  Copyright © 2017 Carol Greenberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var bluSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var colorSquare: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        redSlider.value = defaults.float(forKey: "red")
        greenSlider.value = defaults.float(forKey: "green")
        bluSlider.value = defaults.float(forKey: "blue")
        
        updateBackgroundColor()
        
        colorSquare.layer.borderWidth = 1
        colorSquare.layer.borderColor = UIColor.black.cgColor
        colorSquare.layer.cornerRadius = 5
    }
    
    @IBAction func updateBackgroundColor() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(bluSlider.value)
        
        colorSquare.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        let defaults = UserDefaults.standard
        defaults.set(redSlider.value, forKey: "red")
        defaults.set(greenSlider.value, forKey: "green")
        defaults.set(bluSlider.value, forKey: "blue")
        defaults.synchronize()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "openColor") {
          let newViewController = segue.destination
            newViewController.view.backgroundColor = colorSquare.backgroundColor
        }
    }
}

