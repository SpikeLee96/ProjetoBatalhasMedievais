//
//  TemaViewController.swift
//  BatalhasMedievais
//
//  Created by Spike Lee on 19/05/2018.
//  Copyright © 2018 Spike Lee. All rights reserved.
//

import UIKit

class TemaViewController: UIViewController {

    @IBAction func Trevas(_ sender: Any) {
        Global.temaGlobal = Global.temaTrevas
        self.view.backgroundColor = Global.temaGlobal.corTema
    }
    @IBAction func Luz(_ sender: Any) {
        Global.temaGlobal = Global.temaLuz
        self.view.backgroundColor = Global.temaGlobal.corTema
    }
    @IBAction func Equilibrio(_ sender: Any) {
        Global.temaGlobal = Global.temaEquilibrio
        self.view.backgroundColor = Global.temaGlobal.corTema
    }
    @IBAction func Nebulosa(_ sender: Any) {
        Global.temaGlobal = Global.temaNebulosa
        self.view.backgroundColor = Global.temaGlobal.corTema
    }
    @IBAction func Padrao(_ sender: Any) {
        Global.temaGlobal = Global.temaPadrao
        self.view.backgroundColor = Global.temaGlobal.corTema
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Global.temaGlobal.corTema
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.view.backgroundColor = Global.temaGlobal.corTema
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
