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
    
    @IBAction func unwindToLogin(unwindSegue: UIStoryboard) {
        
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
            
            
            
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

}
