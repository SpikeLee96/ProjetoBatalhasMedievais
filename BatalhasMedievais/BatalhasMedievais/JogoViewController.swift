//
//  JogoViewController.swift
//  BatalhasMedievais
//
//  Created by Spike Lee on 19/05/2018.
//  Copyright © 2018 Spike Lee. All rights reserved.
//


import UIKit

class JogoViewController: UIViewController {
    
    private var primeiraVez = true
    private var acabar = false
    @IBOutlet weak var Player1: UILabel!
    @IBOutlet weak var Player2: UILabel!
    @IBOutlet weak var ImagemJ1: UIImageView!
    @IBOutlet weak var ImagemJ2: UIImageView!
    @IBOutlet weak var HP1: UILabel!
    @IBOutlet weak var HP2: UILabel!
    @IBOutlet weak var HPJ1: UILabel!
    @IBOutlet weak var HPJ2: UILabel!
    @IBOutlet weak var TextoJogo: UITextView!
    @IBOutlet weak var Start: UIButton!
    
    @IBAction func sair(_ sender: Any) {
        exit(0)
    }
    @IBAction func OpcaoX(_ sender: Any) {
        if (acabar){
            reiniciar()
        }
        if(!primeiraVez && (Global.jogador != 0 || Global.oponente != 0)){
            Global.input = "x"
            sleep(2)
            self.TextoJogo.text = ""
            self.TextoJogo.text.append(Global.texto)
            self.TextoJogo.scrollRangeToVisible(NSMakeRange(TextoJogo.text.count - 1, 0))
            self.HPJ1.text = String(Global.HPP1)
            self.HPJ2.text = String(Global.HPP2)
            reiniciar()
        }
    }
    @IBAction func OpcaoO(_ sender: Any) {
        if (acabar){
            reiniciar()
        }
        if(!primeiraVez && (Global.jogador != 0 || Global.oponente != 0)){
            Global.input = "o"
            sleep(2)
            self.TextoJogo.text = ""
            self.TextoJogo.text.append(Global.texto)
            self.TextoJogo.scrollRangeToVisible(NSMakeRange(TextoJogo.text.count - 1, 0))
            self.HPJ1.text = String(Global.HPP1)
            self.HPJ2.text = String(Global.HPP2)
            reiniciar()
        }
    }
    @IBAction func OpcaoZ(_ sender: Any) {
        if (acabar){
            reiniciar()
        }
        if(!primeiraVez && (Global.jogador != 0 || Global.oponente != 0)){
            Global.input = "z"
            sleep(2)
            self.TextoJogo.text = ""
            self.TextoJogo.text.append(Global.texto)
            self.TextoJogo.scrollRangeToVisible(NSMakeRange(TextoJogo.text.count - 1, 0))
            self.HPJ1.text = String(Global.HPP1)
            self.HPJ2.text = String(Global.HPP2)
            reiniciar()
        }
    }
    @IBAction func Up(_ sender: Any) {
        if (primeiraVez && (Global.jogador != 0 || Global.oponente != 0)){
            self.TextoJogo.text = ""
            self.TextoJogo.text.append(Global.texto)
            primeiraVez = false
        }
        Start.isHidden = true
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
            Start.isHidden = true
            self.view.backgroundColor = Global.temaGlobal.corJogo
            //self.navigationController!.navigationBar.topItem!.title = "Sair"
            self.TextoJogo.backgroundColor = Global.temaGlobal.corJogoTextView
            self.TextoJogo.textColor = Global.temaGlobal.corJogoText
            self.HP1.textColor = Global.temaGlobal.corJogoText
            self.HP2.textColor = Global.temaGlobal.corJogoText
            self.Player1.textColor = Global.temaGlobal.corJogoText
            self.Player2.textColor = Global.temaGlobal.corJogoText
            self.navigationController?.navigationBar.isHidden = true
        
            /*
            let alertNome = UIAlertController(title: "Insira seu nome", message: "Nome...", preferredStyle: .alert)
            alertNome.addTextField { (textField) in
                textField.text = ""
            }
            alertNome.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alertNome] (_) in
                let textField = alertNome?.textFields![0] // Force unwrapping because we know it exists.
                self.jogador = (textField?.text)!
                //print("Text field: \(textField?.text)")
            }))
            self.present(alertNome, animated: true, completion: nil)
            */
        
            
            let alert = UIAlertController(title: "Selecione sua classe",message: "",preferredStyle: .alert)
            let mago1 = UIAlertAction(title: "Mago", style: .default, handler: { (action) -> Void in
                Global.jogador = 1
                self.setarImagem(nPlayer: 1, jogador: Global.jogador)
                self.player2()
            })
            
            let cacador1 = UIAlertAction(title: "Caçador", style: .default, handler: { (action) -> Void in
                Global.jogador = 2
                self.setarImagem(nPlayer: 1, jogador: Global.jogador)
                self.player2()
            })
            
            let arqueiro1 = UIAlertAction(title: "Arqueiro", style: .default, handler: { (action) -> Void in
                Global.jogador = 3
                self.setarImagem(nPlayer: 1, jogador: Global.jogador)
                self.player2()
            })
            
            let invocador1 = UIAlertAction(title: "Invocador", style: .default, handler: { (action) -> Void in
                Global.jogador = 4
                self.setarImagem(nPlayer: 1, jogador: Global.jogador)
                self.player2()
            })
            
            let padre1 = UIAlertAction(title: "Padre", style: .default, handler: { (action) -> Void in
                Global.jogador = 5
                self.setarImagem(nPlayer: 1, jogador: Global.jogador)
                self.player2()
            })
            
            alert.addAction(mago1)
            alert.addAction(cacador1)
            alert.addAction(arqueiro1)
            alert.addAction(invocador1)
            alert.addAction(padre1)
            present(alert, animated: true, completion: nil)
        
            let p : Engine! = Engine()
        
            DispatchQueue.global(qos: .userInteractive).async {
                print("\n\nTHREAD")
                p.running()
                if(Global.mesmoJogador){
                    Global.mesmoJogador = false
                    let mesmo = UIAlertController(title: "Selecione outra classe",message: "Jogadores devem ser de classes diferentes!",preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                        Global.jogador = 0
                        Global.oponente = 0
                        self.viewDidLoad()
                    })
                    mesmo.addAction(ok)
                    self.present(mesmo, animated: true, completion: nil)
                }
            }
            self.TextoJogo.text = ""
        
            // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = Global.temaGlobal.corJogo
        self.TextoJogo.backgroundColor = Global.temaGlobal.corJogoTextView
        self.TextoJogo.textColor = Global.temaGlobal.corJogoText
        self.HP1.textColor = Global.temaGlobal.corJogoText
        self.HP2.textColor = Global.temaGlobal.corJogoText
        self.Player1.textColor = Global.temaGlobal.corJogoText
        self.Player2.textColor = Global.temaGlobal.corJogoText
    }
    /*
    override func viewDidDisappear(_ animated: Bool) {
        
        if(self.navigationController?.viewControllers.index(of: self) == nil){
            
            self.TextoJogo.text = nil
            Global.texto = ""
            primeiraVez = true
            Start.isHidden = false
            Global.padrePrimeiro = true
            Global.HPP1 = 0
            Global.HPP2 = 0
            acabar = true
            self.HPJ1.text = "100"
            self.HPJ2.text = "100"
            self.acabar = false
            Global.texto = ""
            Global.input = ""
            Global.jogador = 0
            Global.oponente = 0
            Global.mesmoJogador = false
            //self.viewDidLoad()
            self.navigationController?.popViewController(animated: true)
        }
    }
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func setarImagem(nPlayer: Int, jogador: Int){
        if (nPlayer == 1){
            if (jogador == 1){
                ImagemJ1.image = #imageLiteral(resourceName: "mago")
                Player1.text = "Mago"
            } else if (jogador == 2){
                ImagemJ1.image = #imageLiteral(resourceName: "caçador")
                Player1.text = "Caçador"
            } else if (jogador == 3){
                ImagemJ1.image = #imageLiteral(resourceName: "arqueiro")
                Player1.text = "Arqueiro"
            } else if (jogador == 4){
                ImagemJ1.image = #imageLiteral(resourceName: "invocador")
                Player1.text = "Invocador"
            } else if (jogador == 5){
                ImagemJ1.image = #imageLiteral(resourceName: "padre")
                Player1.text = "Padre"
            }
        } else if (nPlayer == 2){
            if (jogador == 1){
                ImagemJ2.image = #imageLiteral(resourceName: "mago")
                Player2.text = "Mago"
            } else if (jogador == 2){
                ImagemJ2.image = #imageLiteral(resourceName: "caçador")
                Player2.text = "Caçador"
            } else if (jogador == 3){
                ImagemJ2.image = #imageLiteral(resourceName: "arqueiro")
                Player2.text = "Arqueiro"
            } else if (jogador == 4){
                ImagemJ2.image = #imageLiteral(resourceName: "invocador")
                Player2.text = "Invocador"
            } else if (jogador == 5){
                ImagemJ2.image = #imageLiteral(resourceName: "padre")
                Player2.text = "Padre"
            }
        }
    }
    
    @objc func reiniciar(){
        if ((Global.HPP1 <= 0 || Global.HPP2 <= 0) && acabar){
            self.TextoJogo.text = nil
            acabar = false
            Global.texto = ""
            primeiraVez = true
            Start.isHidden = false
            Global.padrePrimeiro = true
            Global.HPP1 = 100
            Global.HPP2 = 100
    
            let alert3 = UIAlertController(title: "Deseja jogar novamente ?",message: "O jogo acabou",preferredStyle: .alert)
            let sim = UIAlertAction(title: "Sim", style: .default, handler: { (action) -> Void in
                self.HPJ1.text = "100"
                self.HPJ2.text = "100"
                self.acabar = false
                self.Start.setTitle("Reiniciar", for: .normal)
                self.viewDidLoad()
            })
                
            let nao = UIAlertAction(title: "Não", style: .default, handler: { (action) -> Void in
                exit(0)
            })
            alert3.addAction(sim)
            alert3.addAction(nao)
            present(alert3, animated: true, completion: nil)
        }
        if (Global.HPP1 <= 0 || Global.HPP2 <= 0){
            self.acabar = true
        }
    }
    
    @objc func reiniciar2(){
        self.TextoJogo.text = nil
        self.acabar = false
        Global.texto = ""
        primeiraVez = true
        Start.isHidden = false
        Global.padrePrimeiro = true
        Global.HPP1 = 100
        Global.HPP2 = 100
        self.viewDidLoad()
    }
    
    @objc func player2(){
        
        if (Global.jogador != 0){
            
            let alert = UIAlertController(title: "Selecione a classe do seu oponente",message: "",preferredStyle: .alert)
            let mago2 = UIAlertAction(title: "Mago", style: .default, handler: { (action) -> Void in
                Global.oponente = 1
                self.setarImagem(nPlayer: 2, jogador: Global.oponente)
                sleep(1)
                self.Start.isHidden = false
            })
            
            let cacador2 = UIAlertAction(title: "Caçador", style: .default, handler: { (action) -> Void in
                Global.oponente = 2
                self.setarImagem(nPlayer: 2, jogador: Global.oponente)
                sleep(1)
                self.Start.isHidden = false
            })
            
            let arqueiro2 = UIAlertAction(title: "Arqueiro", style: .default, handler: { (action) -> Void in
                Global.oponente = 3
                self.setarImagem(nPlayer: 2, jogador: Global.oponente)
                sleep(1)
                self.Start.isHidden = false
            })
            
            let invocador2 = UIAlertAction(title: "Invocador", style: .default, handler: { (action) -> Void in
                Global.oponente = 4
                self.setarImagem(nPlayer: 2, jogador: Global.oponente)
                sleep(1)
                self.Start.isHidden = false
            })
            
            let padre2 = UIAlertAction(title: "Padre", style: .default, handler: { (action) -> Void in
                Global.oponente = 5
                self.setarImagem(nPlayer: 2, jogador: Global.oponente)
                sleep(1)
                self.Start.isHidden = false
            })
            
            alert.addAction(mago2)
            alert.addAction(cacador2)
            alert.addAction(arqueiro2)
            alert.addAction(invocador2)
            alert.addAction(padre2)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func verificarJogadores(){
        if (Global.mesmoJogador){
            Global.mesmoJogador = false
            let mesmo = UIAlertController(title: "Selecione outra classe",message: "Jogadores devem ser de classes diferentes!",preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                self.reiniciar2()
            })
            mesmo.addAction(ok)
            present(mesmo, animated: true, completion: nil)
        }
    }

}
