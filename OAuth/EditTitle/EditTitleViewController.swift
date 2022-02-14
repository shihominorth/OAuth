//
//  EditTitleViewController.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-14.
//

import UIKit


protocol EditTitleView: AnyObject {
    
}

class EditTitleViewController: UIViewController {

    @IBOutlet var explanationLbl: UILabel!
    @IBOutlet weak var textView: TextViewWithPlaceholder!
    
    var presenter: EditTitlePresenter!
    var edittingTitle: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        explanationLbl.text = "タイトルを編集してください"
        textView.text = edittingTitle
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//        textView.placeHolder = "bubbbbbbbb"
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


extension EditTitleViewController: EditTitleView {} 
