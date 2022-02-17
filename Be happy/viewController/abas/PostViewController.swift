//
//  PostViewController.swift
//  Be happy
//
//  Created by Gabriela Cleim on 17/02/22.
//

import UIKit
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore

class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var descricao: UITextField!
    var imagePicker = UIImagePickerController()
    var storage: Storage!
    var auth: Auth!
    var firestore: Firestore!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storage = Storage.storage()
        imagePicker.delegate = self
        auth = Auth.auth()
        firestore = Firestore.firestore()
    }
    
    @IBAction func selecionar(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        self.present (imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let imagemRecuperada = info[UIImagePickerController.InfoKey.originalImage ] as! UIImage
        
        self.imagem.image = imagemRecuperada
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func postar(_ sender: Any) {
        
        let imagens = storage.reference()
            .child("imagens")
        
        let imagemSelecionada = self.imagem.image
        if let imagemUpload =
            imagemSelecionada?.jpegData(compressionQuality: 0.3) {
        
            let identificadorUnico = UUID().uuidString
            
            let imagemPostagemRef = imagens
            .child("postagens")
            .child("\(identificadorUnico).jpg")
            
            imagemPostagemRef.putData(imagemUpload, metadata: nil) {
                (metaData, erro) in
                
                if erro == nil {
                    
                    imagemPostagemRef.downloadURL { (url, erro) in
                        if let urlImagem = url?.absoluteString {
                            if let descricao = self.descricao.text{
                                if let usuarioLogado = self.auth.currentUser{
                                    
                                    
                                    let idUsuario = usuarioLogado.uid
                                    
                                    self.firestore.collection("postagens")
                                        .document(idUsuario)
                                        .collection("postagens_usuarios")
                                }
                            }
                            
                        }
                    }
                    
                    print("ok")
                }else{
                    print("erro")
                }
            }
        }
    }
    
}
