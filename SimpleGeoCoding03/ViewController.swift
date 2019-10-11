//
//  ViewController.swift
//  SimpleGeoCoding03
//
//  Created by dit02 on 2019. 10. 11..
//  Copyright © 2019년 DIT. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var pins : [MKAnnotation] = []
        
        let addr = "부산광역시 양정동 429-10"

        //GeoCoder 클래스 객체 하나 생성
        let fGeoCoder = CLGeocoder()
        
        fGeoCoder.geocodeAddressString(addr) { placemarks, error in
            if error != nil {
                print("Unable to geocoding \(error!)")
            }
            if let myPlacemark = placemarks {
                let placemark = myPlacemark[0]
                let pin01 = MKPointAnnotation()
                pin01.coordinate = placemark.location!.coordinate
                pin01.title = "동의과학대학교"
                pin01.subtitle = "꿈이 자라는곳"
                pins.append(pin01)
                
                self.mapView.showAnnotations(pins, animated: true)
            }
        }
    }
}

