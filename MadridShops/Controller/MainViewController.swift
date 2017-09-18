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
    var myLoader: WavesLoader?
    @IBOutlet weak var redRectangle: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //// Star Drawing
        let starPath = UIBezierPath()
        starPath.move(to: CGPoint(x: 180, y: 25))
        starPath.addLine(to: CGPoint(x: 195.16, y: 43.53))
        starPath.addLine(to: CGPoint(x: 220.9, y: 49.88))
        starPath.addLine(to: CGPoint(x: 204.54, y: 67.67))
        starPath.addLine(to: CGPoint(x: 205.27, y: 90.12))
        starPath.addLine(to: CGPoint(x: 180, y: 82.6))
        starPath.addLine(to: CGPoint(x: 154.73, y: 90.12))
        starPath.addLine(to: CGPoint(x: 155.46, y: 67.67))
        starPath.addLine(to: CGPoint(x: 139.1, y: 49.88))
        starPath.addLine(to: CGPoint(x: 164.84, y: 43.53))
        starPath.close()
        starPath.fill()
        
        let myPath = starPath.cgPath
        myLoader = WavesLoader.showLoader(with: myPath)
        self.view.addSubview(self.myLoader!)
        let rect = CGRect(x: 10, y: 100, width: 200, height: 200)
        let v = UIView(frame: rect)
        v.backgroundColor = UIColor.blue
        self.view.addSubview(v)
        
        // Gesture Recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(animateView))
        tapGesture.numberOfTouchesRequired = 1  // Número de dedos
        tapGesture.numberOfTapsRequired = 1     // Número de veces que los dedos golpean la pantalla
        self.view.addGestureRecognizer(tapGesture)
        
        // Gesture Recognizer
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(restoreView))
        tapGesture2.numberOfTouchesRequired = 2  // Número de dedos
        tapGesture2.numberOfTapsRequired = 1     // Número de veces que los dedos golpean la pantalla
        self.view.addGestureRecognizer(tapGesture2)
        
        // swipr gesture recognizer
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(restoreView))
        swipeLeft.direction = .left
    }
    @objc func animateView(){
        UIView.animate(withDuration: 2.0) {
            if let v = self.myLoader{
                let newFrame = CGRect(x: v.frame.origin.x, y: v.frame.origin.y + 200, width: v.frame.size.width, height: v.frame.size.height)
                v.frame = newFrame
            }
            self.redRectangle.layer.cornerRadius = 20
            self.redRectangle.backgroundColor =  #colorLiteral(red: 0.1776901828, green: 0.256876824, blue: 0.8455742386, alpha: 0.5)
        }
    }
    @objc func restoreView(){
        UIView.animate(withDuration: 2.0, animations: {
            if let v = self.myLoader{
                let newFrame = CGRect(x: 0, y: 0, width: v.frame.size.width, height: v.frame.size.height)
                v.frame = newFrame
            }
        }) { (stop: Bool) in
            UIView.animate(withDuration: 2.0, animations: {
                self.redRectangle.layer.cornerRadius = 0
                self.redRectangle.backgroundColor =  #colorLiteral(red: 0.9994240403, green: 0.5925288014, blue: 0.3953271311, alpha: 1)
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
