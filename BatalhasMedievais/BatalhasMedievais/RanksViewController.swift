//
//  RanksViewController.swift
//  BatalhasMedievais
//
//  Created by Spike Lee on 19/05/2018.
//  Copyright © 2018 Spike Lee. All rights reserved.
//

import UIKit

class RanksViewController: UIViewController {

    @IBOutlet weak var colocacao: UILabel!
    @IBOutlet weak var jogador: UILabel!
    @IBOutlet weak var vezesVencidas: UILabel!
    @IBOutlet weak var ranksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tema
        //self.navigationController!.navigationBar.topItem!.title = "Sair"
        self.view.backgroundColor = Global.temaGlobal.corRanks
        self.colocacao.textColor = Global.temaGlobal.corRanksText
        self.jogador.textColor = Global.temaGlobal.corRanksText
        self.vezesVencidas.textColor = Global.temaGlobal.corRanksText
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.view.backgroundColor = Global.temaGlobal.corRanks
        self.colocacao.textColor = Global.temaGlobal.corRanksText
        self.jogador.textColor = Global.temaGlobal.corRanksText
        self.vezesVencidas.textColor = Global.temaGlobal.corRanksText
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
