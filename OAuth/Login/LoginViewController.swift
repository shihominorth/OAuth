//
//  LoginViewController.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-08.
//

import UIKit

protocol LoginView: AnyObject {
    func loginBtnTapped()
    func setPresenter(presenter: LoginPresenter)
}

class LoginViewController: UIViewController, BindableType {

    
    @IBOutlet weak var loginBtn: UIButton!
    
    var presenter: LoginPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginBtn.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
    
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


extension LoginViewController: LoginView {
    func setPresenter(presenter: LoginPresenter) {
        self.presenter = presenter
    }
    
    @objc func loginBtnTapped() {
        self.presenter.loginButtonTapped()
    }
}
