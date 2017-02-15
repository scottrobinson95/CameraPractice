//
//  ViewController.swift
//  Camera_Practice
//
//  Created by Srobinson1 on 2/14/17.
//  Copyright © 2017 Srobinson1. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var myImageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imagePicker.delegate = self
        
    }
    
    @IBAction func photosButtonTapped(_ sender: Any)
    {
        getPhotoLibrary()
    }
    
    
    @IBAction func cameraButtonTapped(_ sender: Any)
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            present(imagePicker, animated: true, completion: nil)
            
        }
        else
        {
            getPhotoLibrary()
        }
    }

    func getPhotoLibrary()
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true)
        {
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.myImageView.image = selectedImage
        }
    }
}

