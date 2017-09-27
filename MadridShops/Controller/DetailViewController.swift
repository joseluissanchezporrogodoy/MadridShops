//
//  ShopDetailViewController.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 12/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import UIKit
import MapKit
class DetailViewController: UIViewController {
    var entity : Entity!
    
    @IBOutlet weak var textoTienda: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = self.entity.name
        let preferredLanguage = NSLocale.preferredLanguages[0]
        if (preferredLanguage.range(of:"es") != nil) {
            self.textoTienda.text = self.entity.description_es
        }
        if (preferredLanguage.range(of:"en") != nil){
            self.textoTienda.text = self.entity.description_en
        }
        
        //self.activityIndicator.startAnimating()
        //self.shop.image.loadImage(into: imagen,activityIndicator: self.activityIndicator)
        //let imagemapa = getURLImageMapFromEntity(entity: shop)
        //imagemapa.loadImage(into: imagen, activityIndicator: self.activityIndicator)
        //imagen.image = UIImage(data: shop.imageMapData!)
        if let mapData = entity.imageMapData {
            self.imageView.image = UIImage(data: mapData)
        }
        
    }
    
    @IBAction func openInMaps(_ sender: Any) {
        let latitude = self.entity.latitude!
        let longitude = self.entity.longitude!
        
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span),
            MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
            ] as [String : Any]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = self.entity.name
        mapItem.openInMaps(launchOptions: options)
        
    }
    
}
