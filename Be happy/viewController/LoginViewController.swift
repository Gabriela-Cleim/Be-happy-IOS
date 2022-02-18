//
//  LoginViewController.swift
//  Be happy
//
//  Created by Gabriela Cleim on 16/02/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var campoEmail: UITextField!
    @IBOutlet weak var campoSenha: UITextField!
    var auth: Auth!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        auth = Auth.auth()
        
        auth.addStateDidChangeListener { (autenticacao, usuario) in
            if usuario != nil {
                self.performSegue(withIdentifier: "LoginAuto", sender: nil)
            }else{
                print("Usuario nao logado")
            }
    }
}
    
    
    
    
    
    @IBAction func unwind( sender: UIStoryboardSegue){
        do {
            try auth.signOut()
        } catch {
            print("Erro ao deslogar")
        }
    }
    
    
    
    
    
    
    
    @IBAction func login(_ sender: Any) {
        
        if let email = campoEmail.text {
            if let senha = campoSenha.text {
                auth.signIn(withEmail: email, password: senha) { (usuario, erro) in
                    if erro == nil {
                        print("Sucesso ao logar")
                    }else{
                        print("Erro ao logar")
                    }
                }
            }else{
                print("2")
            }

        }else{
            print("1")
        }
            
            
            
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    
}
