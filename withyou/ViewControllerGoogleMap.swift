//
//  ViewControllerGoogleMap.swift
//  withyou
//
//  Created by Abdullah on 15/05/1446 AH.
//

import UIKit

class ViewControllerGoogleMap: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func BTNgotomap(_ sender: Any) {
        if let url = URL(string: "https://www.google.com/maps/search/?api=1&query=عيادة+الصحة+النفسية") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("نعتذر لم يتم تحديد الموقع !")
            }
    }
    
    
    
    
    

    

}
