//
//  Extensions.swift
//  UberClone
//
//  Created by handnew on 9/5/24.
//

import UIKit

extension UIColor {
  convenience init(hexCode: String) {
    let scanner = Scanner(string: hexCode)
    let r, g, b: CGFloat
    var rgbValue: UInt64 = 0

    scanner.scanHexInt64(&rgbValue)

    r = CGFloat((rgbValue & 0xff0000) >> 16) / 0xff
    g = CGFloat((rgbValue & 0xff00) >> 8) / 0xff
    b = CGFloat(rgbValue & 0xff) / 0xff

    self.init(red: r, green: g, blue: b, alpha: 1.0)
  }

  static let background = UIColor(hexCode: "191919")
  static let mainBlue = UIColor(hexCode: "119AED")
  static let outlineStroke = UIColor(hexCode: "EA2E6F")
  static let tracksStroke = UIColor(hexCode: "381931")
  static let pulsatingFill = UIColor(hexCode: "561E3F")
}

extension UIView {
  func anchor(top: NSLayoutYAxisAnchor? = nil, 
              left: NSLayoutXAxisAnchor? = nil,
              bottom: NSLayoutYAxisAnchor? = nil,
              right: NSLayoutXAxisAnchor? = nil,
              paddingTop: CGFloat = 0,
              paddingLeft: CGFloat = 0,
              paddingBottom: CGFloat = 0,
              paddingRight: CGFloat = 0, 
              width: CGFloat? = nil,
              height: CGFloat? = nil) {
    
    translatesAutoresizingMaskIntoConstraints = false

    if let top {
      topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
    }

    if let left {
      leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
    }

    if let bottom {
      bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
    }

    if let right {
      rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
    }

    if let width {
      widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    if let height {
      heightAnchor.constraint(equalToConstant: height).isActive = true
    }
  }

  func centerX(inView view: UIView) {
      translatesAutoresizingMaskIntoConstraints = false
      centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }

  func centerY(inView view: UIView, constant: CGFloat = 0) {
      translatesAutoresizingMaskIntoConstraints = false
      centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
  }

  func inputContainerView(image: UIImage, textField: UITextField? = nil, segmentedCotroller: UISegmentedControl? = nil) -> UIView {
    let view = UIView()

    let imageView = UIImageView()
    imageView.image = image
    imageView.alpha = 0.87
    view.addSubview(imageView)

   
    if let textField {
      imageView.centerY(inView: view)
      imageView.anchor(left: view.leftAnchor, paddingRight: 8, width: 24, height: 24)
      view.addSubview(textField)
      textField.centerY(inView: view)
      textField.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
    }

    if let segmentedCotroller {
      imageView.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: -8, width: 24, height: 24)

      view.addSubview(segmentedCotroller)
      segmentedCotroller.anchor(left: view.leftAnchor, right: view.rightAnchor)
      segmentedCotroller.centerY(inView: view, constant: 8)
    }

    let separatorView = UIView()
    separatorView.backgroundColor = .lightGray
    view.addSubview(separatorView)
    separatorView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, height: 0.75)

    return view
  }
}

extension UITextField {
  func textField(withPlaceHolder placeHolder: String, isSecureTextEntry: Bool) -> UITextField {
    let tf = UITextField()
    tf.borderStyle = .none
    tf.font = UIFont.systemFont(ofSize: 16)
    tf.textColor = .white
    tf.keyboardAppearance = .dark
    tf.isSecureTextEntry = isSecureTextEntry
    tf.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
    return tf
  }
}
