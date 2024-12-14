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
        if let url = URL(string: "https://www.google.com/maps/search/عيادة+الصحة+النفسية%E2%80%AD%E2%80%AD/@26.0977891,43.8952698,10.69z?entry=ttu&g_ep=EgoyMDI0MTExMy4xIKXMDSoASAFQAw%3D%3D") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("نعتذر لم يتم تحديد الموقع !")
        }
    }
    
    
    
    
    

    

}
