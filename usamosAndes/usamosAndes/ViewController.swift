//
//  ViewController.swift
//  usamosAndes
//
//  Created by JULIAN BRUNO on 21/01/2021.
//
import AndesUI
import UIKit
//import MyFramework

class ViewController: UIViewController {

    @IBOutlet weak var botonUno: AndesButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        

    }
    
    @IBAction func buttonDidTouch(_ sender: Any) {
        
        
        
        
        
        let rootViewController = ExampleContentViewController()
        let sheet = AndesBottomSheetViewController(rootViewController: rootViewController)
        sheet.titleBar.text = "This is a title"
        sheet.titleBar.textAlignment = .center
        present(sheet, animated: true)
        
       
    
        
        
//        let loginViewController = LoginViewController()
//
//        print (loginViewController)
    }
    
    

}

