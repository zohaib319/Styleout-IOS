//
//  MyHelper.swift
//  Shapes Defined
//
//  Created by Apple on 01/10/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

public protocol MyHelperCompatible {
    associatedtype someType
    var shapesdefined: someType { get }
}

public extension MyHelperCompatible {
    public var shapesdefined: MyHelper<Self> {
        get { return MyHelper(self) }
    }
}

public struct MyHelper<Base> {
    let base: Base
    init(_ base: Base) {
        self.base = base
    }
}

/*
 extension to set left and right padding inside text fields
 */
extension UITextField : MyHelperCompatible {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

/*
 // extension to hide keyboard by touching anywhere in safe area
 */
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension Dictionary {
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
            }
            .joined(separator: "&")
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
extension UIViewController{
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
extension UIViewController{
    func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
}
extension UIImage {
    
    func addImagePadding(x: CGFloat, y: CGFloat) -> UIImage? {
        let width: CGFloat = size.width + x
        let height: CGFloat = size.height + y
        UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), false, 0)
        let origin: CGPoint = CGPoint(x: (width - size.width) / 2, y: (height - size.height) / 2)
        draw(at: origin)
        let imageWithPadding = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return imageWithPadding
    }
}
extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}
extension UITableView {
    
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = UIColor(red: 121.0/255, green: 121.0/255, blue: 121.0/255, alpha: 1)
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "Roboto-Regular", size: 12)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }
    
    func restore123() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
    
}
extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor(named: "shadowColor")?.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowRadius = 4
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

extension UIView {
    func addShadow(){
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 4.0
        self.layer.masksToBounds = true
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }
}
extension UIView {
    func addBackgroundToStats(imageName: String) {
    // screen width and height:
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height

    let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
    imageViewBackground.image = UIImage(named: imageName)

    // you can change the content mode:
        imageViewBackground.contentMode = UIView.ContentMode.bottom

    self.addSubview(imageViewBackground)
    self.sendSubviewToBack(imageViewBackground)
    }
    
}
extension UIView {
    func addBackgroundToProfile(imageName: String) {
    // screen width and height:
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height

    let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
    imageViewBackground.image = UIImage(named: imageName)

    // you can change the content mode:
        imageViewBackground.contentMode = UIView.ContentMode.topLeft

    self.addSubview(imageViewBackground)
    self.sendSubviewToBack(imageViewBackground)
    }
    
}
// extension for setting empty table view
extension UITableView {
    
    func setEmptyView(title: String, message: String, messageImage: String) {
        
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        
        let messageImageView = UIImageView()
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        
        messageImageView.backgroundColor = .clear
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageImageView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
//        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        
//        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageImageView)
        emptyView.addSubview(messageLabel)
        
        messageImageView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageImageView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: -20).isActive = true
        messageImageView.widthAnchor.constraint(equalToConstant: 75).isActive = true
        messageImageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: messageImageView.bottomAnchor, constant: 10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        
        messageImageView.image = UIImage(named: messageImage)
        titleLabel.text = title
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        
        UIView.animate(withDuration: 1, animations: {
            
            messageImageView.transform = CGAffineTransform(rotationAngle: .pi / 10)
        }, completion: { (finish) in
            UIView.animate(withDuration: 1, animations: {
                messageImageView.transform = CGAffineTransform(rotationAngle: -1 * (.pi / 10))
            }, completion: { (finishh) in
                UIView.animate(withDuration: 1, animations: {
                    messageImageView.transform = CGAffineTransform.identity
                })
            })
            
        })
        
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    
    func restore() {
        
        self.backgroundView = nil
        self.separatorStyle = .singleLine
        
    }
    
}
extension UIViewController{
    @objc func hidesKeyboardFromTF(){
        view.endEditing(true)
    }
}
//extension UIViewController{
//    func checkConnectivity() -> Bool
//    {
//        if Reachability.isConnectedToNetwork(){
//            return true
//        }else{
//            return false
//        }
//    }
//}
extension UIImage {
    func rotate(radians: Float) -> UIImage? {
        var newSize = CGRect(origin: CGPoint.zero, size: self.size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).size
        // Trim off the extremely small float value to prevent core graphics from rounding it up
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)

        UIGraphicsBeginImageContextWithOptions(newSize, false, self.scale)
        let context = UIGraphicsGetCurrentContext()!

        // Move origin to middle
        context.translateBy(x: newSize.width/2, y: newSize.height/2)
        // Rotate around middle
        context.rotate(by: CGFloat(radians))
        // Draw the image at its center
        self.draw(in: CGRect(x: -self.size.width/2, y: -self.size.height/2, width: self.size.width, height: self.size.height))

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
}

