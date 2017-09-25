//
//  MainViewController.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 11/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import UIKit
import FillableLoaders
import CoreData
class MainViewController: UIViewController {
    
    var context: NSManagedObjectContext!

    @IBOutlet weak var activityInd: UIActivityIndicatorView!
    
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

            self.configViews()
            self.startApp()
    }
    func configViews()  {
        self.activityInd.startAnimating()
        self.activityInd.hidesWhenStopped = true
        self.reloadButton.isEnabled = false
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
                self.initializeData()
            }
        }) {
            self.activityInd.stopAnimating()
        }

    }
    func showAlert(){
        // Inform user for example
        let alertController = UIAlertController(title: "No hay conexión a internet", message: "Por favor vuelve a intentarlo mas tarde", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: {action in self.enableReloadButton()})
        alertController.addAction(defaultAction)
        
        //let alertController = UIAlertController(title: "Default AlertController", message: "A standard alert", preferredStyle: .alert)
        self.present(alertController, animated: true, completion:nil)
    }
    func enableReloadButton(){
        self.reloadButton.isEnabled = true
        print("Que pasa neng")
    }
    
    func initializeData(){
        
        let downloadShopsInteractor:DownloadAllShopsInteractor = DownloadAllShopsInteractorNSURLSessionImpl()
        downloadShopsInteractor.execute{ (shops: Shops) in
            // todo Ok
            let downloadImagesInteractor: DownloadImagesInteractorImpl = DownloadImagesInteractorImpl()
            downloadImagesInteractor.execute(shops: shops, onSuccess: { (shops) in
                let cacheInteractor = SaveAllShopsInteractorImps()
                cacheInteractor.execute(shops: shops, context: self.context, onSuccess: { (shops: Shops) in
                    self.activityInd.stopAnimating()
                    SetExecutedOnceInteractorImpl().execute()
                    
                })
            })
            
            
        }
    }
    
    
   
    @IBAction func reload(_ sender: Any) {
        self.configViews()
        self.startApp()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowShopsSegue"){
            let vc = segue.destination as! ViewController
            vc.context = self.context
        }
    }
    
}
