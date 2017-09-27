//
//  MainViewController.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 11/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import UIKit
import CoreData



class MainViewController: UIViewController {
    
    var context: NSManagedObjectContext!
    
    @IBOutlet weak var activityInd: UIActivityIndicatorView!
    
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    
    @IBOutlet weak var goToShopsButton: UIButton!
    
    @IBOutlet weak var goToActivitiesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configViews()
        self.startApp()
    }
    
    func configViews()  {
        self.activityInd.startAnimating()
        self.activityInd.hidesWhenStopped = true
        self.reloadButton.isEnabled = false
        self.goToShopsButton.isHidden = true
        self.goToActivitiesButton.isHidden = true
    }
    
    func startApp(){
        ExecuteOnceInteractorImpl().execute(closureFirstTime: {
            Reachability.isInternetAvailable(webSiteToPing: nil) { (isInternetAvailable) in
                guard isInternetAvailable else {
                    self.activityInd.stopAnimating()
                    self.showAlert()
                    return
                }
                // Do some action if there is Internet
                self.initializeShopsData()
            }
        }) {
            self.activityInd.stopAnimating()
            self.showButtons()
        }
        
    }
    
    func showAlert(){
        // Inform user for example
        let alertController = UIAlertController(title: NSLocalizedString("NetworkErrorTitle", comment: "NetworkErrorTitle"), message:
            NSLocalizedString("NetworkErrorText", comment: "NetworkErrorText"), preferredStyle: UIAlertControllerStyle.alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: {action in self.enableReloadButton()})
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion:nil)
    }
    func enableReloadButton(){
        self.reloadButton.isEnabled = true
    }
    
    func initializeShopsData(){
        
        let downloadShopsInteractor:DownloadAllInteractor = DownloadAllInteractorNSURLSessionImpl()
        downloadShopsInteractor.execute(type: Type.shop.rawValue) { (shops: Entities) in
            let downloadImagesInteractor: DownloadImagesInteractorImpl = DownloadImagesInteractorImpl()
            downloadImagesInteractor.execute(entities: shops, onSuccess: { (shops) in
                let cacheInteractor = SaveAllInteractorImps()
                cacheInteractor.execute(entities: shops, type: Type.shop.rawValue, context: self.context, onSuccess: { () in
                    ///Llamar a activities
                    self.initializeActivitiesData()
                })
                
            })
        }
        
        
    }
 
    func initializeActivitiesData(){
        
        let downloadActivitiesInteractor:DownloadAllInteractor = DownloadAllInteractorNSURLSessionImpl()
        downloadActivitiesInteractor.execute(type: Type.activity.rawValue) { (shops: Entities) in
            let downloadImagesInteractor: DownloadImagesInteractorImpl = DownloadImagesInteractorImpl()
            downloadImagesInteractor.execute(entities: shops, onSuccess: { (shops) in
                let cacheInteractor = SaveAllInteractorImps()
                cacheInteractor.execute(entities: shops, type: Type.activity.rawValue, context: self.context, onSuccess: { () in
                    self.activityInd.stopAnimating()
                    SetExecutedOnceInteractorImpl().execute()
                    self.showButtons()
                })
                
            })
        }
    }
    
    
    func showButtons () {
    
        // swift:
        self.goToShopsButton.alpha = 0
        self.goToShopsButton.isHidden =  false
        UIView.animate(withDuration: 2) {
            self.goToShopsButton.alpha = 1
        }
        
        self.goToActivitiesButton.alpha = 0
        self.goToActivitiesButton.isHidden =  false
        UIView.animate(withDuration: 2) {
            self.goToActivitiesButton.alpha = 1
        }
    }

    
    @IBAction func reload(_ sender: Any) {
        self.configViews()
        self.startApp()
    }
    
    @IBAction func goToShops(_ sender: Any) {
        
        performSegue(withIdentifier: "ShowListSegue", sender: Type.shop.rawValue)
    }
  
    @IBAction func goToActivities(_ sender: Any) {
        
        performSegue(withIdentifier: "ShowListSegue", sender: Type.activity.rawValue)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let type = sender as! String
        if (segue.identifier == "ShowListSegue"){
            let vc = segue.destination as! ViewController
            vc.context = self.context
            vc.type = type
        }
    }
    
}
