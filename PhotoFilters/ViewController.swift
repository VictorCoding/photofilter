//
//  ViewController.swift
//  PhotoFilters
//
//  Created by Victor M Ramos on 5/17/17.
//  Copyright © 2017 Victor M Ramos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    let context = CIContext(options: nil)
    
    @IBAction func applyFilter(_ sender: Any) {
        
        // create an image to filter
        let inputImage = CIImage(image: photoImageView.image!)
        
        let randomColor = [kCIInputAngleKey: (Double(arc4random_uniform(314)) / 100)]
        
        let filteredImage = inputImage?.applyingFilter("CIHueAdjust", withInputParameters: randomColor)
        
        let renderedImage = context.createCGImage(filteredImage!, from: (filteredImage?.extent)!)
    
        photoImageView.image = UIImage(cgImage: renderedImage!)
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

