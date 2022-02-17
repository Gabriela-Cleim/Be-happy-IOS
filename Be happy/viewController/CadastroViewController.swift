//
//  CadastroViewController.swift
//  Be happy
//
//  Created by Gabriela Cleim on 16/02/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class CadastroViewController: UIViewController {
    @IBOutlet weak var campoNome: UITextField!
    @IBOutlet weak var campoEmail: UITextField!
    @IBOutlet weak var campoSenha: UITextField!
    var auth: Auth!
    var firestore: Firestore!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        auth = Auth.auth()
        firestore = Firestore.firestore()
        
    }
    

    @IBAction func cadastrar(_ sender: Any) {
        if let nome = campoNome.text {
            if let email = campoEmail.text {
                if let senha = campoSenha.text {
                    
                    auth.createUser(withEmail: email, password: senha) { (dados, erro) in
                        if erro == nil {
                            
                            if let idUsuario = dados?.user.uid {
                                self.firestore.collection("usuarios")
                                    .document(idUsuario)
                                    .setData([
                                        "nome": nome,
                                        "email": email
                                    ])
                            }
                        }else{
                            print("Erro ao cadastrar usuario")
                        }
                    }
                    
                }else{
                    
                    let alert: UIAlertController = UIAlertController(title: "Alerta", message: "Preencha a sua senha", preferredStyle: .alert)
                    
                    
                    let action1: UIAlertAction = UIAlertAction(title: "OK", style: .default) {
                        (action) in
                        
                        print("vc clicou no ok")
                    }
                    alert.addAction(action1)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                }
            }else{
                
                let alert: UIAlertController = UIAlertController(title: "Alerta", message: "Preencha o seu email", preferredStyle: .alert)
                
                
                let action1: UIAlertAction = UIAlertAction(title: "OK", style: .default) {
                    (action) in
                    
                    print("vc clicou no ok")
                }
                alert.addAction(action1)
                
                self.present(alert, animated: true, completion: nil)
                
            }
        }else{
            
            let alert: UIAlertController = UIAlertController(title: "Alerta", message: "Preencha o seu nome", preferredStyle: .alert)
            
            
            let action1: UIAlertAction = UIAlertAction(title: "OK", style: .default) {
                (action) in
                
                print("vc clicou no ok")
            }
            alert.addAction(action1)
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
