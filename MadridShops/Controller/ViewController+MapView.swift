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
            
            
            //Better to make this class property
            let annotationIdentifier = "AnnotationIdentifier"
            
            var annotationView: MKAnnotationView?
            if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
                annotationView = dequeuedAnnotationView
                annotationView?.annotation = annotation
            }
            else {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            }
            
            if let annotationView = annotationView {
                // Configure your annotation view here
                annotationView.canShowCallout = true
                annotationView.image = UIImage(named: "marker.png")
                annotationView.centerOffset =  CGPoint(x:0,y: -annotationView.image!.size.height / 2);
                if let d: Data = annotation.data{
                    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: annotationView.frame.height, height: annotationView.frame.height))
                    imageView.image = UIImage(data: d)
                    imageView.contentMode = .scaleAspectFit
                    annotationView.leftCalloutAccessoryView = imageView
                }
                

            }
            
            
            
            return annotationView
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, didSelect view:MKAnnotationView) {
        let tapGesture = UITapGestureRecognizer(target:self,  action:#selector(calloutTapped(sender:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        view.removeGestureRecognizer(view.gestureRecognizers!.first!)
    }
    
    @objc func calloutTapped(sender:UITapGestureRecognizer) {
        let view = sender.view as! MKAnnotationView
        if (view.annotation as? MapPin) != nil {
             let anot = view.annotation as! MapPin
            performSegue(withIdentifier: "ShowDetailSegue", sender: mapEntityCDIntoEntity(entityCD: anot.entity))
        }
    }
}




