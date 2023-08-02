//
//  LoginViewController.swift
//  brianApps
//
//  Created by DEVALDA on 16/05/23.
//

import UIKit
//import PhoneNumberKit


class LoginViewController: UIViewController,Coordinating {
    

    var coordinator: Coordinator?
    let userHardcode = "08123456789"

    
    
    @IBOutlet weak var containerLogin: UIView!
    
    @IBOutlet weak var logButton: UIButton!
    
//    @IBOutlet weak var phoneField:UITextField
    
//    let phoneNumberKit = PhoneNumberKit()
    
    override func viewDidLoad() {

        
//        let infoButton = UIBarButtonItem(image:UIImage(systemName: "questionmark.circle.fill"), style: .done, target: self, action: #selector(showInfo(sender: )))
//        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward") ,style: .done, target: self, action: #selector(backToLandingPage(sender:)))
        
        super.viewDidLoad()

//        self.navigationItem.leftBarButtonItem = backButton
//        self.navigationItem.rightBarButtonItem = infoButton
//        self.navigationController!.navigationBar.tintColor = .white
        
//        self.phoneField.addPadding()
//        self.phoneField.addBorder()
//        self.logButton.designLogButton()
        
//
        
    }
    
    
    func TestassertEqual(of enteredAmount: Double,with tip: Double) -> Double?{
            
      guard enteredAmount >= 0 && tip >= 0 else { return nil }
      let tipPercentage = tip / 100
      return enteredAmount * tipPercentage
    }
    
    var isSuccessfullGetPost : Bool!
    var time : Int!
    func TestgetAsyncData(completion: @escaping (Bool) -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(time)){
            
            completion(self.isSuccessfullGetPost)
        }
        
    }
    
    
    
//    func TestNonNullData(){
//        var data A :
//
//    }

    
    func getPostString(params:[String:Any]) -> String
    {
        var data = [String]()
        
        for(key, value) in params
        {
            data.append(key + "=\(value)")
        }
        return data.map { String($0) }.joined(separator: "&")
    }
    
    
    var dataSource = [String]()

    func getPostIsakuData(completion: @escaping (Bool) -> ()){
        print("post isaku data")

        let body :[String:String] = [
            "json" :  "{\"phone_number\":\"088884444222\",\"app_version\":\"324\",\"os_version\":\"25\",\"os_type\":\"aos\",\"device_id\":\"aosxxxx\",\"imei\":\"123456\",\"session_id\":\"738112729\",\"latitude\":\"-8.539087\",\"longitude\":\"115.1399009\",\"bahasa\":\"1\"}",
            "tag" : "get_daftar_pekerjaan_v2"
        ]
        
       guard let UrlPostIsaku = URL( string:"https://devmob.1-saku.com/Index.aspx")else{
            return
        }
        
       let encoder = JSONEncoder()
       guard let encodeBody = try? encoder.encode(body)else{
            return
        }
        print("ENCODE DONE")
        
        var request = URLRequest(url: UrlPostIsaku)
        request.httpMethod = "POST"
        

        let postString = getPostString(params: body)
        request.httpBody = postString.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { Data, URLResponse, Error in
            guard let data = Data, Error == nil else{
                print("The Data is EMPTY!")
                return
            }
            guard let httpRes = URLResponse as? HTTPURLResponse else {
                print("error", Error ?? "Unknown error")
                return
            }
            
            if httpRes.statusCode == 200 {
              
                if let data = Data {
                    print("RESPONSE DATA")
                    print(String(data: data, encoding: String.Encoding.utf8))
                    completion(self.isSuccessfullGetPost)
                    print("DATA RESPONSE COLLECTED")
                    
                    let decoder = JSONDecoder()
                    do{
                        let Result = try decoder.decode(ResponseIsaku.self,from: data)
                        print("DATA RESPONSE DECODED")
                                                
                        print(Result.tag)
                        print(Result.success)
                        self.dataSource = Result.data
                        
                    }
                    catch{
                        print("failed to decode JSON = \(error)")
                    }
                }
            }
        }

 
    
    
    
//    @IBAction func onPhoneNumberChanged(_ sender: Any) {

//            if (phoneField.text?.count ?? 0 < 15) {
//                phoneField.text = PartialFormatter().formatPartial(phoneField.text ?? "")
//            } else {
//                phoneField.deleteBackward()
//            }


//        }

//    @objc func backToLandingPage(sender: UIBarButtonItem) {
//        let transition = CATransition()
//        let vc : UIViewController & Coordinating = LandingPageViewController()
//        transition.type = CATransitionType.push
//        transition.subtype = CATransitionSubtype.fromLeft
//        navigationController?.view.layer.add(transition, forKey: kCATransition)
//        self.navigationController?.setViewControllers([vc], animated: false)
//    }
//
//    @objc func showInfo(sender :UIBarButtonItem){
//
//    }
//
//    @IBAction func registerPageRouting(_ sender: Any) {
//
//        let vc : UIViewController & Coordinating = RegisterPageViewController()
//        self.navigationController?.setViewControllers([vc], animated: true)
//    }
//
//
//    @IBAction func didPressLogin(sender: AnyObject) {
//
//        logButton.isSelected = true
////        phoneField.layer.borderWidth = 0
//
////        if phoneField.text == userHardcode && phoneField.text != ""   {
//
//
////                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//                    self.logButton.isSelected = false
//                    let vc : UIViewController & Coordinating = HomePage()
//                    self.navigationController?.setViewControllers([vc], animated: true)
//

//            }
            
//            fake loading
//        }
//        else if(phoneField.text == nil){
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
//                phoneField.layer.borderColor = UIColor.red.cgColor
//                phoneField.layer.borderWidth = 2.0
//                let alert = UIAlertController(title: "Phonenumber cannot be empty !", message: "try testing profile using : (\(userHardcode))", preferredStyle: UIAlertController.Style.alert)
////                alert.setValue(UIColor.red, forKey: "titleTextColor")
//                alert.addAction(UIAlertAction(title: "try again", style: UIAlertAction.Style.default, handler: nil))
//                present(alert, animated: true, completion: nil)
//                self.logButton.isSelected = false
//            }
//        }
//        else {
//          fake loading
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {[self] in

//                phoneField.layer.borderColor = UIColor.red.cgColor
//                phoneField.layer.borderWidth = 2.0
//                let alert = UIAlertController(title: "User not found !", message: "try testing profile using : (\(userHardcode))", preferredStyle: UIAlertController.Style.alert)
//                alert.addAction(UIAlertAction(title: "try again", style: UIAlertAction.Style.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//
//            self.logButton.isSelected = false
//
//        }

//        }

//    }


}

//extension UITextField  {
//
//    func addPadding(){
//        let paddingView: UIView = UIView.init(frame: CGRect( x:0,y:0,width: 8,height: 0))
//        self.leftView = paddingView
//        self.leftViewMode = .always
//        self.rightView = paddingView
//        self.rightViewMode = .always
//    }
//
//    func addBorder(){
//        self.layer.cornerRadius = 5.0
//        self.layer.borderWidth = 1
//        self.layer.borderColor = UIColor(red: 196.0/255.0, green: 196.0/255.0, blue: 296.0/255.0, alpha: 1.0).cgColor
//    }
//}
//
//extension UIButton{
//
//    func designLogButton(){
//        self.layer.cornerRadius = 20
//        self.layer.borderWidth = 1.5
//        self.layer.borderColor = UIColor(red: 65.0/255.0, green: 159.0/255.0, blue: 249.0/255.0, alpha: 1.0).cgColor
//    }
//
}
