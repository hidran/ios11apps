//
//  ViewController.swift
//  map pinner
//
//  Created by Hidran Arias on 02/08/17.
//  Copyright © 2017 Hidran Arias. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var lonLabel: UILabel!
    @IBOutlet weak var latLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTouchMap(_ sender: UILongPressGestureRecognizer) {
        
         let position = sender.location(in: mapView)
        
        let coord = mapView.convert(position, toCoordinateFrom: mapView)
        latLabel.text = "LAT \(coord.latitude)"
         lonLabel.text = "LON \(coord.longitude)"
    }
    
}

