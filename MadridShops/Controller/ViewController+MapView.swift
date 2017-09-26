//
//  ViewController+MapView.swift
//  MadridShops
//
//  Created by José Luis Sánchez-Porro Godoy on 21/9/17.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation
import MapKit
extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // Don't want to show a custom image if the annotation is the user's location.
         if let annotation = annotation as? MapPin {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        
        //Better to make this class property
        let annotationIdentifier = "AnnotationIdentifier"
        
        var annotationView: MKAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
            
            
        }
        else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
        }
        
        if let annotationView = annotationView {
            // Configure your annotation view here
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "marker.png")
            annotationView.centerOffset =  CGPoint(x:0,y: -annotationView.image!.size.height / 2);
            if let d: Data = annotation.data{
            let imagen = UIImage(data: d)
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: (imagen?.size.width)!, height: (imagen?.size.height)!))
            annotationView.leftCalloutAccessoryView = imageView
            }
           
            
        }
        
        
        
        return annotationView
        }
        return nil
    }
}


//func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//    if control == view.rightCalloutAccessoryView {
//        print(view.annotation?.title!)
//        performSegue(withIdentifier: "ShowEntityDetailSegue", sender: view.annotation as! MapPin)
//    }
//    
//}
//        if let annotation = annotation as? MapPin {
//            let identifier = "AnnotationIdentifier"
//            var view: MKPinAnnotationView
//            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//                as? MKPinAnnotationView { // 2
//                dequeuedView.annotation = annotation
//                view = dequeuedView
//            } else {
//                // 3
//                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//                view.canShowCallout = true
//
//                view.calloutOffset = CGPoint(x: -5, y: 5)
//                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
//            }
//
//            //view.pinTintColor = annotation.pinTintColor()
//            return view
//        }
//        return nil
//    }
//}

