//
//  ViewController.swift
//  RGB Sliders
//
//  Created by Susan Hammons on 8/30/16.
//  Copyright © 2016 Susan Hammons. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // create outlets for each item on the view you want to work with
    
    @IBOutlet weak var RedSlider: UISlider!
    
    @IBOutlet weak var GreenSlider: UISlider!
    
    @IBOutlet weak var BlueSlider: UISlider!
    
    @IBOutlet weak var colorSquare: UIView!
    
    // after standard load method, do startup activities
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // get user prefs and set values on view
        let defaults = NSUserDefaults.standardUserDefaults()
        RedSlider.value = defaults.floatForKey("red")
        GreenSlider.value = defaults.floatForKey("green")
        BlueSlider.value = defaults.floatForKey("blue")
        // run the update method with values just now set
        updateBackgroundColor()
        // put a border around the square
        colorSquare.layer.borderColor = UIColor.blackColor().CGColor
        colorSquare.layer.borderWidth = 1    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // segue from initial slider view to new full color view...
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "openColor") {
            // get the name of the new view controller
            let newViewController = segue.destinationViewController
            // set the color of the new view controller background
            newViewController.view.backgroundColor = colorSquare.backgroundColor
        }
    }

    @IBAction func updateBackgroundColor() {
        // get rgb settings from view
        let red = CGFloat(RedSlider.value)
        let green = CGFloat(GreenSlider.value)
        let blue = CGFloat(BlueSlider.value)
        
        //view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        // set the color of the square
        colorSquare.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    
        // get user prefs and then set them to new values from view
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setFloat(RedSlider.value, forKey: "red")
        defaults.setFloat(GreenSlider.value, forKey: "green")
        defaults.setFloat(BlueSlider.value, forKey: "blue")
        // must synch after setting new values
        defaults.synchronize()
    }
}