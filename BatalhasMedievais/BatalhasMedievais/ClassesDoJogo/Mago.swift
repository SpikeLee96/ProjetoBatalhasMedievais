//
//  Mago.swift
//  BatalhasMedievais
//
//  Created by Spike Lee on 22/05/2018.
//  Copyright © 2018 Spike Lee. All rights reserved.
//

import Foundation

class Mago : Base {
    
    let classe = "Mago"
    let texto1 = "'x' para Fogo ,'o' para Gelo ou 'z' para Eletricidade: \n\n"
    
    func jogo(player: String, nPlayer: Int, HP: Int){

            if (player == "Caçador"){
                Global.texto.append(texto1)
                Global.verificar()
                let input = Global.input
                Global.limpar()
                if (input.caseInsensitiveCompare("x") == ComparisonResult.orderedSame ||
                    input.caseInsensitiveCompare("o") == ComparisonResult.orderedSame){
                    j30(classe: player, nPlayer: nPlayer)
                } else if (input.caseInsensitiveCompare("z") == ComparisonResult.orderedSame) {
                    if (defesa){
                        j10(classe: player, nPlayer: nPlayer)
                        defesa = false
                    } else {
                        j20(classe: player, nPlayer: nPlayer)
                    }
                }
            } else if (player == "Arqueiro"){
                Global.texto.append(texto1)
                Global.verificar()
                let input = Global.input
                Global.limpar()
                if (input.caseInsensitiveCompare("x") == ComparisonResult.orderedSame ||
                    input.caseInsensitiveCompare("o") == ComparisonResult.orderedSame ||
                    input.caseInsensitiveCompare("z") == ComparisonResult.orderedSame){
                    j20(classe: player, nPlayer: nPlayer)
                }
            } else if (player == "Invocador"){
                Global.texto.append(texto1)
                Global.verificar()
                let input = Global.input
                Global.limpar()
                if (input.caseInsensitiveCompare("x") == ComparisonResult.orderedSame){
                    j20(classe: player, nPlayer: nPlayer)
                } else if (input.caseInsensitiveCompare("o") == ComparisonResult.orderedSame ||
                    input.caseInsensitiveCompare("z") == ComparisonResult.orderedSame){
                    j30(classe: player, nPlayer: nPlayer)
                }
            } else if (player == "Padre"){
                Global.texto.append(texto1)
                Global.verificar()
                let input = Global.input
                Global.limpar()
                if (input.caseInsensitiveCompare("x") == ComparisonResult.orderedSame ||
                    input.caseInsensitiveCompare("z") == ComparisonResult.orderedSame){
                    j40(classe: player, nPlayer: nPlayer)
                } else if (input.caseInsensitiveCompare("o") == ComparisonResult.orderedSame){
                    j30(classe: player, nPlayer: nPlayer)
                }
            }
    }
    
}
