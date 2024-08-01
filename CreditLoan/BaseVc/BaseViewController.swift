//
//  BaseViewController.swift
//  CreditLoan
//
//  Created by apple on 2024/7/19.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    
    lazy var disposeBag = {
        return DisposeBag()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
