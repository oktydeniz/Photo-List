//
//  AddPhotoViewController.swift
//  Photo List
//
//  Created by oktay on 9.07.2023.
//

import UIKit

class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descView: UITextField!
    @IBOutlet weak var titleView: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func openCameraAction(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImg = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = selectedImg
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goLibraryAction(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
    }

    @IBAction func dismissKeyboard(_ sender: UITextField) {
        self.resignFirstResponder()
    }
    
}
