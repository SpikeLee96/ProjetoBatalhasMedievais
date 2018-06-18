//
//  Invocador.swift
//  BatalhasMedievais
//
//  Created by Spike Lee on 22/05/2018.
//  Copyright © 2018 Spike Lee. All rights reserved.
//

import Foundation

class Invocador : Base {
    
    let classe = "Invocador"
    let texto1 = "Escolha a invocação\n"
    let texto2 = "'x' para Dragões ,'o' para Reaper(a morte) ou 'z' para Unicórnios Alados: \n\n"
    
    var invocouUni = false
    
    func morte(classe: String){
        player2 -= 1
        morte = true
        Global.texto.append("O " + classe + " recebeu a condenação de quatro turnos e perdeu 1 de HP.\n\n")
    }
    
    func unicornios(HP: Int) -> Int{
        var HPaux = HP
        if (uni) {            
            if(HP == 100){
                Global.texto.append("O Invocador já está na capacidade máxima de HP\n\n")
                return 0
            } else if (HP <= 70) {
                HPaux = 30
                Global.texto.append("O Invocador ganhou 30 de HP.\n\n")
            } else {
                HPaux = 100 - HP
                Global.texto.append("O Invocador encheu o HP.\n\n")
            }
            uni = false
        } else {
            Global.texto.append("Você pode invocar os unicórnios alados apenas uma vez.\n\n")
        }
        invocouUni = false
        return HPaux
    }
    
    func nada(classe: String){
        Global.texto.append("O " + classe + " não perdeu nada de HP.\n\n")
    }
    
    func jogo(player: String, nPlayer: Int, HP: Int){

            if (player == "Mago"){
                Global.texto.append(texto1)
                Global.texto.append(texto2)
                Global.verificar()
                let input = Global.input
                Global.limpar()
                if (input.caseInsensitiveCompare("x") == ComparisonResult.orderedSame){
                    j20(classe: player, nPlayer: nPlayer)
                } else if (input.caseInsensitiveCompare("o") == ComparisonResult.orderedSame) {
                    morte(classe: "Mago")
                } else if (input.caseInsensitiveCompare("z") == ComparisonResult.orderedSame) {
                    invocouUni = true
                }
            } else if (player == "Caçador"){
                Global.texto.append(texto1)
                Global.texto.append(texto2)
                Global.verificar()
                let input = Global.input
                Global.limpar()
                if (input.caseInsensitiveCompare("x") == ComparisonResult.orderedSame){
                    j30(classe: player, nPlayer: nPlayer)
                } else if (input.caseInsensitiveCompare("o") == ComparisonResult.orderedSame) {
                    nada(classe: "Caçador")
                } else if (input.caseInsensitiveCompare("z") == ComparisonResult.orderedSame) {
                    invocouUni = true
                }
            } else if (player == "Arqueiro"){
                Global.texto.append(texto1)
                Global.texto.append(texto2)
                Global.verificar()
                let input = Global.input
                Global.limpar()
                if (input.caseInsensitiveCompare("x") == ComparisonResult.orderedSame){
                    j30(classe: player, nPlayer: nPlayer)
                } else if (input.caseInsensitiveCompare("o") == ComparisonResult.orderedSame) {
                    nada(classe: "Arqueiro")
                } else if (input.caseInsensitiveCompare("z") == ComparisonResult.orderedSame) {
                    invocouUni = true
                }
            } else if (player == "Padre"){
                Global.texto.append(texto1)
                Global.texto.append(texto2)
                Global.verificar()
                let input = Global.input
                Global.limpar()
                if (input.caseInsensitiveCompare("x") == ComparisonResult.orderedSame){
                    j20(classe: player, nPlayer: nPlayer)
                } else if (input.caseInsensitiveCompare("o") == ComparisonResult.orderedSame) {
                    Global.padrePrimeiro = false
                    if (!antiReaper) {
                        morte(classe: "Padre")
                    } else {
                        Global.texto.append("A interferência divina previniu a morte.\n")
                    }
                } else if (input.caseInsensitiveCompare("z") == ComparisonResult.orderedSame) {
                    invocouUni = true
                }
            }
    }
}
