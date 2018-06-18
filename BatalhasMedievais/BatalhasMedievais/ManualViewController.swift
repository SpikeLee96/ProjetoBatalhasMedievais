//
//  ManualViewController.swift
//  BatalhasMedievais
//
//  Created by Spike Lee on 16/06/2018.
//  Copyright © 2018 Spike Lee. All rights reserved.
//

import UIKit

class ManualViewController: UIViewController {

    @IBOutlet weak var Titulo1: UILabel!
    @IBOutlet weak var Texto1: UILabel!
    @IBOutlet weak var Titulo2: UILabel!
    @IBOutlet weak var Texto2: UILabel!
    @IBOutlet weak var Titulo3: UILabel!
    @IBOutlet weak var Texto3: UILabel!
    @IBOutlet weak var Titulo4: UILabel!
    @IBOutlet weak var Texto4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Global.temaGlobal.corManual
        self.Titulo1.textColor = Global.temaGlobal.corManualTextTitle
        self.Titulo2.textColor = Global.temaGlobal.corManualTextTitle
        self.Titulo3.textColor = Global.temaGlobal.corManualTextTitle
        self.Titulo4.textColor = Global.temaGlobal.corManualTextTitle
        self.Texto1.textColor = Global.temaGlobal.corManualText
        self.Texto2.textColor = Global.temaGlobal.corManualText
        self.Texto3.textColor = Global.temaGlobal.corManualText
        self.Texto4.textColor = Global.temaGlobal.corManualText
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.view.backgroundColor = Global.temaGlobal.corManual
        self.Titulo1.textColor = Global.temaGlobal.corManualTextTitle
        self.Titulo2.textColor = Global.temaGlobal.corManualTextTitle
        self.Titulo3.textColor = Global.temaGlobal.corManualTextTitle
        self.Titulo4.textColor = Global.temaGlobal.corManualTextTitle
        self.Texto1.textColor = Global.temaGlobal.corManualText
        self.Texto2.textColor = Global.temaGlobal.corManualText
        self.Texto3.textColor = Global.temaGlobal.corManualText
        self.Texto4.textColor = Global.temaGlobal.corManualText
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
