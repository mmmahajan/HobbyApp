//
//  APIManager.swift
//  SwiftStub
//
//

import Foundation
import Alamofire
import SDWebImage

open class NetworkHelper {

    class var sharedManager: NetworkHelper {
        struct Static{
            static let instance: NetworkHelper = NetworkHelper()
        }
        return Static.instance
    }

    /**
        Created call back method for Alamofire request.
        The completionHandler block return the responsein any object
        and failure returns error from the Alamofire.

        shows loading spinner while requesting
    */

    func request(_ method: HTTPMethod
        , _ URLString: String
        , parameters: [String : AnyObject]? = [:]
        , headers: [String : String]? = [:]
        , onView: UIView?, vc: UIViewController, completion:@escaping (Any?) -> Void
        , failure: @escaping (Error?) -> Void) {

        if let view = onView {
            LoadingOverlay.shared.showProgressView(view)
        }

        let URL = BASE_PATH + URLString
        Alamofire.request(URL, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in

                LoadingOverlay.shared.hideProgressView()
                switch response.result {
                case .success:
                    completion(response.result.value!)
                case .failure(let error):
                    failure(error)
                    guard error.localizedDescription == JSON_COULDNOT_SERIALISED else {
                        AppUtil.showMessage((error.localizedDescription), messageTitle: EMPTY_STRING, buttonTitle: OK, vc: vc)
                        return
                    }
//                    AppUtil.showMessage(SOMETHING_WNET_WRONG, messageTitle: EMPTY_STRING, buttonTitle: OK)
                }
        }
    }

    func requestWithoutJSONEncoding(_ method: HTTPMethod
        , _ URLString: String
        , parameters: [String : AnyObject]? = [:]
        , headers: [String : String]? = [:]
        , onView: UIView?, vc: UIViewController, completion:@escaping (Any?) -> Void
        , failure: @escaping (Error?) -> Void) {

        if let view = onView {
            LoadingOverlay.shared.showProgressView(view)
        }
        let URL = BASE_PATH + URLString
        Alamofire.request(URL, method: method, parameters: parameters, headers: headers)
            .responseJSON { response in

                switch response.result {
                case .success:
                    completion(response.result.value!)
                case .failure(let error):
                    guard error.localizedDescription == JSON_COULDNOT_SERIALISED else {
                        AppUtil.showMessage((error.localizedDescription), messageTitle: EMPTY_STRING, buttonTitle: OK, vc: vc)
                        return
                    }
                    AppUtil.showMessage(SOMETHING_WNET_WRONG, messageTitle: EMPTY_STRING, buttonTitle: OK, vc: vc)
                    failure(error)
                }
                LoadingOverlay.shared.hideProgressView()
        }
    }

    //Download image in background
    func getImage(_ path: String, forImageView imageView: UIImageView, placeholderImage: String) {
        if URL(string: BASE_PATH + path) != nil {
            imageView.sd_setImage(with: URL(string: BASE_PATH + path), placeholderImage: UIImage(named: placeholderImage) , options:.refreshCached)
        }
    }
}

