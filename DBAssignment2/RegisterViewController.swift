//
//  RegisterViewController.swift
//  DBAssignment2
//
//  Created by Neosoft on 07/02/22.
//

import UIKit

class RegisterViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var firstNameTxtField: UITextField!
    @IBOutlet weak var lastNameTxtField: UITextField!
    @IBOutlet weak var phoneTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passTxtField: UITextField!
    @IBOutlet weak var cPassTxtField: UITextField!
    @IBOutlet weak var educationTxtField: UITextField!
    @IBOutlet weak var dobTxtField: UITextField!
    
    
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    var gender:String = ""
    
    let dbHelper = DatabaseHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        maleBtn.isSelected = true
        gender = "male"
    }
    
    @IBAction func pickPhotoClicked(_ sender: UIButton) {
        let imageController = UIImagePickerController()
        imageController.sourceType = .photoLibrary
        imageController.delegate = self
        self.present(imageController, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        profileImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func maleBtnClicked(_ sender: Any) {
        if femaleBtn.isSelected == true{
            femaleBtn.isSelected = false
            maleBtn.isSelected = true
            gender = "male"
        }
        else{
            maleBtn.isSelected = true
            gender = "male"
        }
    }
    
    
    @IBAction func femaleBtnClicked(_ sender: Any) {
        if maleBtn.isSelected == true{
            femaleBtn.isSelected = true
            maleBtn.isSelected = false
            gender = "female"
        }
        else{
            femaleBtn.isSelected = true
            gender = "female"
        }
    }
    
    
    @IBAction func submitBtnClicked(_ sender: Any) {
        
        let fName = firstNameTxtField.text!
        let lName = lastNameTxtField.text!
        let phone = phoneTxtField.text!
        let email = emailTxtField.text!
        let password = passTxtField.text!
        let dateOfBirth = dobTxtField.text!
        let education = educationTxtField.text!
        let photoData = self.profileImage.image?.jpegData(compressionQuality: 0.75)
        
        let dict = ["firstName":fName,"lastName":lName,"phone":phone,"email":email,"gender":gender,"password":password,"dateOfBirth":dateOfBirth,"education":education,"photo":photoData!] as [String : Any]
        
        print(fName,lName,gender)
        
        dbHelper.save(object: dict)
        
    }
}
