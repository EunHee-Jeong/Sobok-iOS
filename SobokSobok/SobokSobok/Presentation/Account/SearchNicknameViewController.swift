//
//  SearchNicknameViewController.swift
//  SobokSobok
//
//  Created by 김선오 on 2022/01/19.
//

import UIKit

final class SearchNicknameViewController: BaseViewController {

    // MARK: - @IBOutlet Properties
    @IBOutlet weak var searchNicknameTextField: UITextField!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var resultTextLabel: UILabel!
    @IBOutlet weak var noResultImageView: UIImageView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        assignDelgation()
    }

    override func style() {
        navigationController?.navigationBar.isHidden = true
        resultTextLabel.isHidden = true
        noResultImageView.isHidden = true
    }
    
    // MARK: - Functions
    private func assignDelgation() {
        searchNicknameTextField.delegate = self
    }
    
    // MARK: - @IBAction Properties
    @IBAction func touchUpToClose(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func touchUpToAddFriend(_ sender: Any) {
        print("\(searchNicknameTextField.text ?? "")")
        navigationController?.pushViewController(SaveNicknameViewController.instanceFromNib(), animated: true)
    }
}

extension SearchNicknameViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      if searchNicknameTextField.text != "no" {
          resultTextLabel.text = searchNicknameTextField.text ?? ""
          resultTextLabel.isHidden = false
          noResultImageView.isHidden = true
          searchNicknameTextField.resignFirstResponder()
    } else {
        resultTextLabel.isHidden = true
        noResultImageView.isHidden = false
        searchNicknameTextField.resignFirstResponder()
    }
    return true
  }
}
