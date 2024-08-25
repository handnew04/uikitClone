//
//  LoginController.swift
//  UberClone
//
//  Created by handnew on 8/23/24.
//

import UIKit

class LoginController: UIViewController {

  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "UBER"
    label.font = UIFont(name: "Avenir-Light", size: 36)
    label.textColor = UIColor(white: 1, alpha: 0.8)
    return label
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = UIColor(red: 24/255, green: 25/255, blue: 25/255, alpha: 1)

    view.addSubview(titleLabel)
    //Autolayout과 자동 리사이즈 마스크(legacy)를 같이 사용 할건지
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
  }

  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }


}
