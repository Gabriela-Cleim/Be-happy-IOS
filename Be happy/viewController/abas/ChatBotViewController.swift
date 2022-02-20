//
//  ChatBotViewController.swift
//  Be happy
//
//  Created by Gabriela Cleim on 19/02/22.
//

import UIKit

class ChatBotViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        
    }
    
    //inicio do cod do alert do heart
    @IBAction func send(_ sender: Any) {
        showAlert()
    }
    func showAlert() {
        let alert = UIAlertController(title: "Send", message: "Desculpe, não foi possivel enviar a sua mensagem mas voce ainda pode nos achar no discord.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in print("apertou Ok")}))
        
        present(alert, animated: true)
    }
    
    func showActionsheet() {
        
}
//fim do cod
    
    

}
