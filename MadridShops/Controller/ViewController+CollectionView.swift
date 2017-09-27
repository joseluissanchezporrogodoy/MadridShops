//
//  ViewController+CollectionView.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 08/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionInfo = fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: EntityCell = collectionView.dequeueReusableCell(withReuseIdentifier: "EntityCell", for: indexPath) as! EntityCell
        
        let shopCD: EntityCD = fetchedResultsController.object(at: indexPath)
        
        cell.refresh(shop: mapEntityCDIntoEntity(entityCD: shopCD))
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shopCD: EntityCD = fetchedResultsController.object(at: indexPath)
        let shop = mapEntityCDIntoEntity(entityCD: shopCD)
        performSegue(withIdentifier: "ShowDetailSegue", sender: shop)
    }
    
    
}
