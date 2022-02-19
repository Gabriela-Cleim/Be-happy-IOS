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
