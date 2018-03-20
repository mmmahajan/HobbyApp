//
//  AppUtil.swift
//  HobbyApp
//
//  Created by Manish Mahajan on 17/12/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import UIKit

class AppUtil {
    
    //Pass startcolor, endcolor and alpha for gradient color
    class func viewWithGradient(view: UIView, startColor: UIColor, endColor: UIColor, alpha: CGFloat) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.frame.size.width = UIScreen.main.bounds.size.width
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
        view.alpha = alpha
    }
    
    //Make image rounded with imageview and radius parameter
    class func makeImageRounded(imageView: UIImageView, radius: CGFloat) {
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, 0.0)
        UIBezierPath(roundedRect: imageView.bounds, cornerRadius: radius).addClip()
        imageView.image?.draw(in: imageView.bounds)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    //Alert with handling
    class func showMessageWithAction(_ messageText:String, messageTitle:String, okButtonTitle:String, cancelButtonTitle:String?, vc: UIViewController, completion:@escaping (Bool) -> Void) {
        
        let alert = UIAlertController(title: messageTitle,
                                      message: messageText,
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: okButtonTitle,
                                      style: UIAlertActionStyle.default,
                                      handler: {(alert: UIAlertAction!) in
                                        completion(true)
        }))
        if let cancelButton = cancelButtonTitle {
            alert.addAction(UIAlertAction(title: cancelButton,
                                          style: UIAlertActionStyle.cancel,
                                          handler: {(alert: UIAlertAction!) in
                                            completion(false)
            }))
        }        
        vc.present(alert, animated: true, completion: nil)
    }
    
    //Alert message without handling with OK and Cancel button
    class func showMessageWithCancel(_ messageText:String, messageTitle:String, buttonTitle:String, vc: UIViewController) {
        let alert = UIAlertController(title: messageTitle,
                                      message: messageText,
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: OK,
                                      style: UIAlertActionStyle.default,
                                      handler: {(alert: UIAlertAction!) in
                                        
        }))
        alert.addAction(UIAlertAction(title: CANCEL,
                                      style: UIAlertActionStyle.cancel,
                                      handler: {(alert: UIAlertAction!) in
        }))
        vc.present(alert, animated: true, completion: nil)
    }
    
    //Alert message with OK button
    class func showMessage(_ messageText:String, messageTitle:String, buttonTitle:String, vc: UIViewController) {
        let alert = UIAlertController(title: messageTitle,
                                      message: messageText,
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: OK,
                                      style: UIAlertActionStyle.default,
                                      handler: {(alert: UIAlertAction!) in
                                        
        }))
        vc.present(alert, animated: true, completion: nil)
    }
    
    //Get month name from index
    class func getMonthNameInShort(index: Int) -> String {
        switch index {
        case 01:
            return "Jan"
        case 02:
            return "Feb"
        case 03:
            return "Mar"
        case 04:
            return "Apr"
        case 05:
            return "May"
        case 06:
            return "Jun"
        case 07:
            return "Jul"
        case 08:
            return "Aug"
        case 09:
            return "Sep"
        case 10:
            return "Oct"
        case 11:
            return "Nov"
        default:
            return "Nov"
        }
    }
    
    //Convert 24 time into 12
    class func to12FormatString(time: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let date: Date? = dateFormatter.date(from: time)
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: date!)
    }
    
    //Get weekdays
    class func getWeekDay(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let currentDate = dateFormatter.date(from: date)
        
        dateFormatter.dateFormat = "EEEE, dd MMM yyyy"
        let currentDateString: String = dateFormatter.string(from: currentDate!)
        print("Current date is \(currentDateString)")
        return currentDateString
    }
    
    //Add blur effect
    class func addBlurEffect(view: UIView) {
        var blurEffectView = UIVisualEffectView()
        blurEffectView.isUserInteractionEnabled = false
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.backgroundColor = UIColor.black
        blurEffectView.alpha = 0.62
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
    }
    
    //Open dialogue box for Camera or Gallery
    func captureImage(vc: UIViewController, picker: UIImagePickerController) {
        let alert = UIAlertController(title: CHOOSE_IMAGE_FROM, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: CAMERA_TITLE, style: .default, handler: { _ in
            self.openCamera(vc: vc, picker: picker)
        }))
        
        alert.addAction(UIAlertAction(title: GALLERY_TITLE, style: .default, handler: { _ in
            self.openGallary(vc: vc, picker: picker)
        }))
        
        alert.addAction(UIAlertAction.init(title: CANCEL, style: .cancel, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
    func openCamera(vc: UIViewController, picker: UIImagePickerController) {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)) {
            picker.sourceType = UIImagePickerControllerSourceType.camera
            picker.allowsEditing = true
            vc.present(picker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(title: WARNING, message: DONT_HAVE_CAMERA, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: OK, style: .default, handler: nil))
            vc.present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallary(vc: UIViewController, picker: UIImagePickerController) {
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        picker.allowsEditing = true
        vc.present(picker, animated: true, completion: nil)
    }
}
