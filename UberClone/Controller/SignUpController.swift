//
//  SignUpController.swift
//  UberClone
//
//  Created by handnew on 9/7/24.
//

import UIKit

class SignUpController: UIViewController {
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "UBER"
    label.font = UIFont(name: "Avenir-Light", size: 36)
    label.textColor = UIColor(white: 1, alpha: 0.8)
    return label
  }()

  private lazy var emailContainerView: UIView = {
    let view = UIView().inputContainerView(image: UIImage.icMailOutlineWhite2X, textField: emailTextField)
    view.heightAnchor.constraint(equalToConstant: 50).isActive = true
    return view
  }()

  private lazy var nameContainerView: UIView = {
    let view = UIView().inputContainerView(image: UIImage.icPersonOutlineWhite2X, textField: nameTextField)
    view.heightAnchor.constraint(equalToConstant: 50).isActive = true
    return view
  }()

  private lazy var passwordContainerView: UIView = {
    let view = UIView().inputContainerView(image: UIImage.icLockOutlineWhite2X, textField: passwordTextField)
    view.heightAnchor.constraint(equalToConstant: 50).isActive = true
    return view
  }()

  private lazy var accountTypeContainerView: UIView = {
    let view = UIView().inputContainerView(image: UIImage.icAccountBoxWhite2X, segmentedCotroller: accountTypeSegmentedControl)
    view.heightAnchor.constraint(equalToConstant: 80).isActive = true
    return view
  }()

  private let emailTextField: UITextField = {
    return UITextField().textField(withPlaceHolder: "Email", isSecureTextEntry: false)
  }()

  private let nameTextField: UITextField = {
    return UITextField().textField(withPlaceHolder: "Full Name", isSecureTextEntry: false)
  }()

  private let passwordTextField: UITextField = {
    return UITextField().textField(withPlaceHolder: "Password", isSecureTextEntry: true)
  }()

  private let accountTypeSegmentedControl: UISegmentedControl = {
    let sc = UISegmentedControl(items: ["Rider", "Driver"])
    sc.backgroundColor = .background
    sc.tintColor = UIColor(white: 1, alpha: 0.87)
    sc.selectedSegmentIndex = 0
    return sc
  }()

  private let signUpButton: AuthButton = {
    let button = AuthButton(type: .system)
    button.setTitle("Sign Up", for: .normal)
    button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
    return button
  }()

  private let alreadyHaveAccountButton: UIButton = {
    let button = UIButton(type: .system)
    let attributedTitle = NSMutableAttributedString(string: "Already have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray])

    attributedTitle.append(NSAttributedString(string: "Log In", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.mainBlue]))

    button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
    button.setAttributedTitle(attributedTitle, for: .normal)
    return button
  }()

  override func viewDidLoad() {
    configureUI()
  }

  @objc func handleSignUp() {

  }

  @objc func handleShowLogin() {
    navigationController?.popViewController(animated: true)
  }

  private func configureUI() {
    view.backgroundColor = .background
    
    view.addSubview(titleLabel)
    titleLabel.centerX(inView: view)
    titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)

    let stack = UIStackView(arrangedSubviews: [emailContainerView, 
                                               nameContainerView,
                                               passwordContainerView,
                                               accountTypeContainerView,
                                               signUpButton])
    view.addSubview(stack)
    stack.axis = .vertical
    stack.distribution = .fill
    stack.spacing = 24
    stack.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)

    view.addSubview(alreadyHaveAccountButton)
    alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)
    alreadyHaveAccountButton.centerX(inView: view)
  }
}
