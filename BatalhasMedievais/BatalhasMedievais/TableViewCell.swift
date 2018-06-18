//
//  TableViewCell.swift
//  BatalhasMedievais
//
//  Created by Spike Lee on 16/06/2018.
//  Copyright © 2018 Spike Lee. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var colocacao: UILabel!
    @IBOutlet weak var jogador: UILabel!
    @IBOutlet weak var vezesVencidas: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
