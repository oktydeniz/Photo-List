//
//  AddPhotoViewController.swift
//  Photo List
//
//  Created by oktay on 9.07.2023.
//

import UIKit
import CoreData
class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descView: UITextField!
    @IBOutlet weak var titleView: UITextField!
    
    var ps = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var selectedModel: Entity? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Add New Row"
        if selectedModel != nil {
            descView.text = selectedModel?.desc
            titleView.text = selectedModel?.title
            imageView.image = UIImage(data: (selectedModel?.img)!)
            self.navigationItem.title = selectedModel?.title
        }
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
        if selectedModel != nil {
            
            selectedModel?.title = titleView.text
            selectedModel?.desc = descView.text
            selectedModel?.img = imageView.image?.jpegData(compressionQuality: 0.8) as Data?
        } else {
            let entityDesc = NSEntityDescription.entity(forEntityName: "Entity", in: ps)
            let data = Entity(entity: entityDesc!, insertInto: ps)
            data.title = titleView.text
            data.desc = descView.text
            data.img = imageView.image?.jpegData(compressionQuality: 0.8) as Data?
        }
        
        do {
            if(ps.hasChanges) {
                try ps.save()
            }
        } catch {
            print(error.localizedDescription)
            return
        }
        navigationController?.popViewController(animated: true)
    }

    @IBAction func dismissKeyboard(_ sender: UITextField) {
        self.resignFirstResponder()
    }
    
}
