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

  private lazy var emailContainerView: UIView = {
    let view = UIView().inputContainerView(image: UIImage.icMailOutlineWhite2X, textField: emailTextField)
    view.heightAnchor.constraint(equalToConstant: 50).isActive = true
    return view
  }()

  private lazy var passwordContainerView: UIView = {
    let view = UIView().inputContainerView(image: UIImage.icLockOutlineWhite2X, textField: passwordTextField)
    view.heightAnchor.constraint(equalToConstant: 50).isActive = true
    return view
  }()

  private let emailTextField: UITextField = {
    return UITextField().textField(withPlaceHolder: "Email", isSecureTextEntry: false)
  }()

  private let passwordTextField: UITextField = {
    return UITextField().textField(withPlaceHolder: "Password", isSecureTextEntry: true)
  }()

  private let loginButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Log In", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    button.backgroundColor = .mainBlue
    button.layer.cornerRadius = 5
    button.setTitleColor(.white, for: .normal)
    button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    return button
  }()

  private let dontHaveAccountButton: UIButton = {
    let button = UIButton(type: .system)
    let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray])

    attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.mainBlue]))

    button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
    button.setAttributedTitle(attributedTitle, for: .normal)
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }

  @objc func handleLogin() {
    
  }

  @objc func handleShowSignUp() {
    let controller = SignUpController()
    navigationController?.pushViewController(controller, animated: true)
  }

  private func configureUI() {
    configureNavigationBar()
    view.backgroundColor = .background

    view.addSubview(titleLabel)
    titleLabel.centerX(inView: view)
    titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)

    let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])

    view.addSubview(stack)
    stack.axis = .vertical
    stack.distribution = .fillEqually
    stack.spacing = 24
    stack.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)


    view.addSubview(dontHaveAccountButton)
    dontHaveAccountButton.centerX(inView: view)
    dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)
  }

  private func configureNavigationBar() {
    navigationController?.navigationBar.isHidden = true
    navigationController?.navigationBar.barStyle = .black
  }
}
