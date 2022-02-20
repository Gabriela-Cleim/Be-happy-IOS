//
//  UsuariosViewController.swift
//  Be happy
//
//  Created by Gabriela Cleim on 16/02/22.
//

import UIKit
import FirebaseFirestore


class UsuariosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewUser: UITableView!
    @IBOutlet weak var searchBarUser: UISearchBar!
    
    var firestore: Firestore!
    var usuarios: [Dictionary<String, Any>] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firestore = Firestore.firestore()
    }
    
    //inicio do cod do alert do heart
    @IBAction func search(_ sender: Any) {
        searchAlert()
    }
        
        func searchAlert() {
            let alert = UIAlertController(title: "ixi", message: "Não foi possivel completar esta ação.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in print("apertou ok")}))
            
            present(alert, animated: true)
        }
        
        func showActionSearch() {
            
}
    //fim do cod
    
    
    
    
    
    
    
    
    
    
    
    //Aqui que entra os metodos de listagem para mostrar as postagens
   func numberOfSections(in tableView: UITableView) -> Int {
       return 1
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.usuarios.count
   }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = tableView.dequeueReusableCell (withIdentifier: "celPostagens", for: indexPath)
        
        celula.textLabel?.text = "Nome"
        celula.detailTextLabel?.text = "email"
        return celula
    }

}
