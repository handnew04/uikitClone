//
//  AuthButton.swift
//  UberClone
//
//  Created by handnew on 9/9/24.
//

import UIKit

class AuthButton: UIButton {
  override init(frame: CGRect) {
    super.init(frame: frame)

    layer.cornerRadius = 5
    self.backgroundColor = .mainBlue
    self.layer.cornerRadius = 5
    self.setTitleColor(.white, for: .normal)
    self.heightAnchor.constraint(equalToConstant: 50).isActive = true
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func setTitle(_ title: String?, for state: UIControl.State) {
    super.setTitle(title, for: state)
    self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
  }
}
