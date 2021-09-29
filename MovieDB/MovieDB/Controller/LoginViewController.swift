//
//  LoginViewController.swift
//  MovieDB
//
//  Created by Minseok Choi on 9/27/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtFieldID: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtFieldPW: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func btnLoginTap(_ sender: Any) {
        if validateID(id: txtFieldID.text ?? "") && validatePW(pw: txtFieldPW.text ?? "") {
            let st = UIStoryboard(name: "Main", bundle: nil)
            let vc = st.instantiateViewController(withIdentifier: "MovieListViewController") as! MovieListViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func validateID(id: String) -> Bool {
        if id.count < 6{
            return false
        }
            return true
    }
    func validatePW(pw: String) -> Bool {
        if pw.count < 6{
            return false
        }
            return true
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
