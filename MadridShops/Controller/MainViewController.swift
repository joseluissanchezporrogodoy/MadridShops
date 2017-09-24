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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
    
        
        self.activityInd.startAnimating()
        self.activityInd.hidesWhenStopped = true
        ExecuteOnceInteractorImpl().execute(closureFirstTime: {
            initializeData()
          

        }) {
            self.activityInd.stopAnimating()
        }
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
    
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowShopsSegue"){
            let vc = segue.destination as! ViewController
            vc.context = self.context
        }
    }
    
}
