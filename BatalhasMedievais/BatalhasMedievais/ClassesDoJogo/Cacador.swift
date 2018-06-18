//
//  Cacador.swift
//  BatalhasMedievais
//
//  Created by Spike Lee on 22/05/2018.
//  Copyright © 2018 Spike Lee. All rights reserved.
//

import Foundation

class Cacador : Base {
    
    let classe = "Caçador"
    let texto1 = "'x' para atacar com a espada de Grayskull ,'o' para usar o escudo ou 'z' para segunda chance: \n\n"
    var usarSecondChance = false
    
    func jogo(player: String, nPlayer: Int, HP: Int){
        
            if (player == "Mago") {
                Global.texto.append(texto1)
                Global.verificar()
                let input = Global.input
                Global.limpar()
                if (input.caseInsensitiveCompare("x") == ComparisonResult.orderedSame){
                    j30(classe: player, nPlayer: nPlayer)
                } else if (input.caseInsensitiveCompare("o") == ComparisonResult.orderedSame){
                    Global.texto.append("O Caçador se defendeu.\n")
                    defesa = true
                } else if (input.caseInsensitiveCompare("z") == ComparisonResult.orderedSame) {
                    usarSecondChance = true
                }
            } else if (player == "Arqueiro" || player == "Invocador" || player == "Padre") {
                Global.texto.append(texto1)
                Global.verificar()
                let input = Global.input
                Global.limpar()
                if (input.caseInsensitiveCompare("x") == ComparisonResult.orderedSame){
                    j20(classe: player, nPlayer: nPlayer)
                } else if (input.caseInsensitiveCompare("o") == ComparisonResult.orderedSame){
                    Global.texto.append("O Caçador se defendeu.\n")
                    defesa = true
                } else if (input.caseInsensitiveCompare("z") == ComparisonResult.orderedSame) {
                    usarSecondChance = true
                }
            }
    }
}
