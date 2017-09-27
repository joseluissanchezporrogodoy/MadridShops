//
//  ViewController.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 07/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation
import MapKit
class ViewController: UIViewController{//, CLLocationManagerDelegate{
    
    var context: NSManagedObjectContext!
   
    
    @IBOutlet weak var shopsCollectionView: UICollectionView!
    @IBOutlet weak var map: MKMapView!
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.requestWhenInUseAuthorization()
        self.map.delegate = self
        //self.locationManager.delegate = self
        //self.locationManager.startUpdatingLocation()
        
        //Quizás sacarlo a una extensión en un método
        shopsCollectionView.register(UINib(nibName: "ShopCell", bundle: nil), forCellWithReuseIdentifier: "ShopCell")
        
       // Centro el mapa
        let madridLocation = CLLocationCoordinate2D(latitude: 40.416775, longitude:  -3.703790)
        self.map.setCenter(madridLocation, animated: true)
        let region = MKCoordinateRegion(center: madridLocation, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        let reg = self.map.regionThatFits(region)
        self.map.setRegion(reg, animated: true)
        //self.map.userLocation
        // Añadir span al mapa
            self.shopsCollectionView.delegate = self
            self.shopsCollectionView.dataSource = self
            self.addPinsToMap()
    
    }
    
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopDetailSegue"{
            let vc = segue.destination as! ShopDetailViewController
            //let indexPath = self.shopsCollectionView.indexPathsForSelectedItems![0]// lo puedo obtener del collection
           // let shop = self.shops?.get(index: indexPath.row)
            let shop = sender as! Shop
            vc.shop = shop
            
        }
    }
    
    // MARK: - Fetched results controller
    var _fetchedResultsController: NSFetchedResultsController<ShopCD>? = nil
    
    var fetchedResultsController: NSFetchedResultsController<ShopCD> {
        if (_fetchedResultsController != nil) {
            return _fetchedResultsController!
        }
        
        let fetchRequest: NSFetchRequest<ShopCD> = ShopCD.fetchRequest()
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        _fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.context!, sectionNameKeyPath: nil, cacheName: "ShopsCacheFile")
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }

    func addPinsToMap(){
        let sectionInfo = fetchedResultsController.sections![0]
        let numberOfElements = sectionInfo.numberOfObjects
 
        var list = [MapPin]()
        for i in 0..<numberOfElements{
       list.append(MapPin(shop:fetchedResultsController.object(at:IndexPath(row: i, section: 0) ) ))
        }
        self.map.addAnnotations(list)
        
    }
}

