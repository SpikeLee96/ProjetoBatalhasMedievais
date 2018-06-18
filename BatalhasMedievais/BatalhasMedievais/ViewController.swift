//
//  ViewController.swift
//  BatalhasMedievais
//
//  Created by Spike Lee on 12/05/2018.
//  Copyright © 2018 Spike Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var interruptor = true
    @IBOutlet weak var Titulo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Global.temaGlobal.corMenu
        self.Titulo.textColor = Global.temaGlobal.corMenuTitulo
        self.navigationController?.navigationBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = Global.temaGlobal.corMenu
        self.Titulo.textColor = Global.temaGlobal.corMenuTitulo
    }

}

