//
//  ViewController.swift
//  RGB Sliders
//
//  Created by Susan Hammons on 8/30/16.
//  Copyright © 2016 Susan Hammons. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var RedSlider: UISlider!
    
    @IBOutlet weak var GreenSlider: UISlider!
    
    @IBOutlet weak var BlueSlider: UISlider!
    
    @IBOutlet weak var colorSquare: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateBackgroundColor()
        colorSquare.layer.borderColor = UIColor.blackColor().CGColor
        colorSquare.layer.borderWidth = 1    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateBackgroundColor() {
        let red = CGFloat(RedSlider.value)
        let green = CGFloat(GreenSlider.value)
        let blue = CGFloat(BlueSlider.value)
        //view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        colorSquare.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)    }

}

