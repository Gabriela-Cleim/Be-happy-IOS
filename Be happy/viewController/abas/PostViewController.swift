//
//  PostViewController.swift
//  Be happy
//
//  Created by Gabriela Cleim on 17/02/22.
//

import UIKit

class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var descricao: UITextField!
    var imagePicker = UIImagePickerController()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }
    
    @IBAction func selecionar(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        self.present (imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func postar(_ sender: Any) {
    }
    
}
