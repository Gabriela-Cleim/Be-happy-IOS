//
//  PerfilViewController.swift
//  Be happy
//
//  Created by Gabriela Cleim on 16/02/22.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth


class PerfilViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableViewPosts: UITableView!
    var idUsuarioLogado: String!
    var post: [Dictionary<String, Any>] = []
    //colocando as variaveis para puxar o firebasestore e firebaseauth
    var firestore: Firestore!
    var auth: Auth!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firestore = Firestore.firestore()
        auth = Auth.auth()
        
        // separar a linha da tableview
        tableViewPosts.separatorStyle = .none
        
        
        //recuperar id do usuario logado
        if let idUsuario = auth.currentUser?.uid{
            self.idUsuarioLogado = idUsuario
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        recuperarPosts()
    }
    
    func recuperarPosts(){
        //para limpar os posts
        self.post.removeAll()
        self.tableViewPosts.reloadData()
        
        firestore.collection("postagens")
            .document(idUsuarioLogado)
            .collection("postagens_usuarios")
            .getDocuments{(snapshotResultado, erro) in
                
                if let snapshot = snapshotResultado {
                    for document in snapshot.documents {
                        let dados = document.data()
                        self.post.append(dados)
                    }
                    self.tableViewPosts.reloadData()
                }
                
            }
    }
    
     //Aqui que entra os metodos de listagem para mostrar as postagens
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.post.count
    }
    
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let celula = tableView.dequeueReusableCell(withIdentifier: "celPostagens", for: indexPath) as! PostsTableViewCell
        
        let indice = indexPath.row
        let posts = self.post[indice]
        
        let descricao = posts["descricao"] as? String
        
        celula.descricao.text = descricao
        celula.postagem.image = UIImage(named: "padrao")
        return celula
    }
}
