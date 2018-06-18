//
//  Engine.swift
//  BatalhasMedievais
//
//  Created by Spike Lee on 22/05/2018.
//  Copyright © 2018 Spike Lee. All rights reserved.
//

import Foundation

class Engine {
    
    private var b : Base! = Base()
    private var m : Mago! = Mago()
    private var c : Cacador! = Cacador()
    private var a : Arqueiro! = Arqueiro()
    private var i : Invocador! = Invocador()
    private var p : Padre! = Padre()
    var acabouUni = false
    
    enum Exception: Error{
        typealias RawValue = String
        case SimplesmenteErro
    }
    
    //selecionarJogador(Int) -> Character
    //selecionarNomeclatura(Int) -> String
    //atualizar(Character, Character)
    //sorteio() -> Int
    //jogo(Int, Character, Character, Int)
    //running()
    
    private func padre(rival: Base, nPlayer: Int){
        if (p.orou && p.prays != 2){
            if(nPlayer == 1){
                rival.player2 += p.oracao(HP: b.player1)
            } else if (nPlayer == 2){
                rival.player2 += p.oracao(HP: b.player2)
            }
        } else if (p.orou){
            p.oracao(HP: 0)
        }
    }
    
    private func cacador(rival: Base){
        if (!c.secondChance){
            m.player2 = 100
            c.player2 = 100
            a.player2 = 100
            i.player2 = 100
            p.player2 = 100
            c.secondChance = true
            c.usarSecondChance = false
            Global.texto.append("--- Segunda Chance --- \n")
        } else {
            Global.texto.append("Você já usou segunda chance ,não há uma terceira ;-;\n")
        }
    }
    
    private func cacadorDefesa(rival: Base){
        if (c.defesa){
            rival.defesa = true
            c.defesa = false
        } else {
            rival.defesa = false
        }
    }
    
    private func invocador(rival: Base, nPlayer: Int){
        if (i.invocouUni && i.uni){
            if(nPlayer == 1){
                rival.player2 += i.unicornios(HP: b.player1)
            } else if (nPlayer == 2){
                rival.player2 += i.unicornios(HP: b.player2)
            }
            i.uni = false
        } else if (i.invocouUni){
            i.unicornios(HP: 0)
        }
    }
    
    private func selecionarJogador(classe: Int) -> Character{
        if (classe == 1){
            return "M"
        } else if (classe == 2){
            return "C"
        } else if (classe == 3){
            return "A"
        } else if (classe == 4){
            return "I"
        } else if (classe == 5){
            return "P"
        }
        return "q"
    }
    
    private func selecionarNomeclatura(classe: Int) -> String{
        if (classe == 1){
            return "Mago"
        } else if (classe == 2){
            return "Caçador"
        } else if (classe == 3){
            return "Arqueiro"
        } else if (classe == 4){
            return "Invocador"
        } else if (classe == 5){
            return "Padre"
        }
        return "q"
    }
    
    private func atualizar(j1: Character, j2: Character){
        if (j1 == "M"){
            //padre
            padre(rival: m, nPlayer: 1)
            //caçador
            if (c.usarSecondChance){
                cacador(rival: m)
            }
            cacadorDefesa(rival: m)
            //invocador
            invocador(rival: m, nPlayer: 1)
            b.player1 = m.player2
        } else if (j1 == "C"){
            //padre
            padre(rival: c, nPlayer: 1)
            invocador(rival: c, nPlayer: 1)
            b.player1 = c.player2
        } else if (j1 == "A"){
            //padre
            padre(rival: a, nPlayer: 1)
            //caçador
            if (c.usarSecondChance){
                cacador(rival: a)
            }
            cacadorDefesa(rival: a)
            //invocador
            invocador(rival: a, nPlayer: 1)
            b.player1 = a.player2
        } else if (j1 == "I"){
            //padre
            padre(rival: i, nPlayer: 1)
            //caçador
            if (c.usarSecondChance){
                cacador(rival: i)
            }
            cacadorDefesa(rival: i)
            b.player1 = i.player2
        } else if (j1 == "P"){
            //caçador
            if (c.usarSecondChance){
                cacador(rival: p)
            }
            cacadorDefesa(rival: p)
            //invocador
            invocador(rival: p, nPlayer: 1)
            b.player1 = p.player2
        }
        if (j2 == "M"){
            //padre
            padre(rival: m, nPlayer: 2)
            //caçador
            if (c.usarSecondChance){
                cacador(rival: m)
            }
            cacadorDefesa(rival: m)
            //invocador
            invocador(rival: m, nPlayer: 2)
            b.player2 = m.player2
        } else if (j2 == "C"){
            //padre
            padre(rival: c, nPlayer: 2)
            //invocador
            invocador(rival: c, nPlayer: 2)
            b.player2 = c.player2
        } else if (j2 == "A"){
            //padre
            padre(rival: a, nPlayer: 2)
            //caçador
            if (c.usarSecondChance){
                cacador(rival: a)
            }
            cacadorDefesa(rival: a)
            //invocador
            invocador(rival: a, nPlayer: 2)
            b.player2 = a.player2
        } else if (j2 == "I"){
            //padre
            padre(rival: i, nPlayer: 2)
            //caçador
            if (c.usarSecondChance){
                cacador(rival: i)
            }
            cacadorDefesa(rival: i)
            b.player2 = i.player2
        } else if (j2 == "P"){
            //caçador
            if (c.usarSecondChance){
                cacador(rival: p)
            }
            cacadorDefesa(rival: p)
            //invocador
            invocador(rival: p, nPlayer: 2)
            b.player2 = p.player2
        }
    }
    
    private func sorteio() -> Int{
        return Int(arc4random_uniform(6) + 1)
    }
    
    private func jogo(nPlayer: Int, player1: Character, player2: Character, HP: Int){
        if(nPlayer == 1){
            if(player1 == "M" && player2 == "C"){
                m.jogo(player: "Caçador", nPlayer: nPlayer, HP: HP);
            } else if (player1 == "M" && player2 == "A"){
                m.jogo(player: "Arqueiro", nPlayer: nPlayer, HP: HP);
            } else if (player1 == "M" && player2 == "I"){
                m.jogo(player: "Invocador", nPlayer: nPlayer, HP: HP);
            } else if (player1 == "M" && player2 == "P"){
                m.jogo(player: "Padre", nPlayer: nPlayer, HP: HP);
            } else if (player1 == "C" && player2 == "M"){
                c.jogo(player: "Mago", nPlayer: nPlayer, HP: HP);
            } else if (player1 == "C" && player2 == "A"){
                c.jogo(player: "Arqueiro", nPlayer: nPlayer, HP: HP);
            } else if (player1 == "C" && player2 == "I"){
                c.jogo(player: "Invocador", nPlayer: nPlayer, HP: HP);
            } else if (player1 == "C" && player2 == "P"){
                c.jogo(player: "Padre", nPlayer: nPlayer, HP: HP);
            } else if (player1 == "A" && player2 == "M"){
                a.jogo(player: "Mago", nPlayer: nPlayer, HP: HP);
            } else if (player1 == "A" && player2 == "C"){
                a.jogo(player: "Caçador", nPlayer: nPlayer, HP: HP);
            } else if (player1 == "A" && player2 == "I"){
                a.jogo(player: "Invocador",nPlayer: nPlayer, HP: HP);
            } else if (player1 == "A" && player2 == "P"){
                a.jogo(player: "Padre",nPlayer: nPlayer, HP: HP);
            } else if (player1 == "I" && player2 == "M"){
                i.jogo(player: "Mago", nPlayer: nPlayer, HP: HP);
            } else if (player1 == "I" && player2 == "C"){
                i.jogo(player: "Caçador", nPlayer: nPlayer, HP: HP);
            } else if (player1 == "I" && player2 == "A"){
                i.jogo(player: "Arqueiro", nPlayer: nPlayer, HP: HP);
            } else if (player1 == "I" && player2 == "P"){
                i.jogo(player: "Padre", nPlayer: nPlayer, HP: HP);
            } else if (player1 == "P" && player2 == "M"){
                p.jogo(player: "Mago", nPlayer: nPlayer, HP: HP);
            } else if (player1 == "P" && player2 == "C"){
                p.jogo(player: "Caçador", nPlayer: nPlayer, HP: HP);
            } else if (player1 == "P" && player2 == "A"){
                p.jogo(player: "Arqueiro", nPlayer: nPlayer, HP: HP);
            } else if (player1 == "P" && player2 == "I"){
                p.jogo(player: "Invocador", nPlayer: nPlayer, HP: HP);
            }
        } else if (nPlayer == 2) {
            jogo(nPlayer: 1, player1: player1, player2: player2, HP: HP)
        }
    }
    
    func randomIA() -> String {
        let alcance = ["x", "o", "z"]
        let sorteio = alcance[Int(arc4random_uniform(UInt32(alcance.count)))]
        Global.input = sorteio
        return sorteio
    }
    
    func running(){
        while(true){
            if(b.acabou){
                //let input = Global.input
                Global.jogador = 0
                Global.oponente = 0
                break
                //sleep(10)
                /*
                if(!Global.reiniciar){
                    break
                } else {
                    self.b = nil
                    self.b = Base()
                    self.m = nil
                    self.m = Mago()
                    self.c = nil
                    self.c = Cacador()
                    self.a = nil
                    self.a = Arqueiro()
                    self.i = nil
                    self.i = Invocador()
                    self.p = nil
                    self.p = Padre()
                    acabouUni = false
                    Global.padrePrimeiro = true
                }
                */
            }
            
                
                //let inputClasse = Global.input
                //let inputClasse = Int(readLine()!)
                Global.verificarPlayer()
                let inputClasse = Global.jogador
                
                if(inputClasse != 1 && inputClasse != 2 && inputClasse != 3 && inputClasse != 4 && inputClasse != 5){
                    Global.texto.append("Seleção inválida!")
                    continue
                }
            
                    
                    //let inputClasse2 = Global.input
                    //let inputClasse2 = Int(readLine()!)
                    Global.verificarPlayer2()
                    let inputClasse2 = Global.oponente
                    
                    if(inputClasse2 != 1 && inputClasse2 != 2 && inputClasse2 != 3 && inputClasse2 != 4 && inputClasse2 != 5){
                        Global.texto.append("Seleção inválida!")
                        continue
                    }
                    
                    if(inputClasse == inputClasse2){
                        Global.mesmoJogador = true
                        break
                    }
                    
                    let j1 : Character = selecionarJogador(classe: inputClasse)
                    let j2 : Character = selecionarJogador(classe: inputClasse2)
                    let n1 : String = selecionarNomeclatura(classe: inputClasse)
                    let n2 : String = selecionarNomeclatura(classe: inputClasse2)
                    
                    let alcance = [1, 2]
                    let mix = Int(arc4random_uniform(UInt32(alcance.count)))
                    let sorteio = alcance[mix]
                    //let sorteio : Int = self.sorteio() random
                    
                    if (sorteio == 1){
                        b.turno = true
                        Global.texto.append("Parabéns " + n1 + ", o swift escolheu você para jogar primeiro!!\n\n")
                    } else if (sorteio == 2){
                        b.turno = false
                        Global.texto.append("Parabéns " + n2 + ", o swift escolheu você para jogar primeiro!!\n\n")
                    }
                    
                    while(true) {
                        
                        if (b.player1 <= 0 && b.player2 <= 0){
                            Global.texto.append("O jogo empatou !_!\n\n")
                            Global.texto.append("Pressione qualquer opção para proseguir...")
                            b.acabou = true
                            break
                        } else if (b.player1 <= 0){
                            Global.texto.append("O " + n1 + " GANHOU!\n\n")
                            Global.texto.append("Pressione qualquer opção para proseguir...")
                            b.acabou = true
                            break
                        } else if (b.player2 <= 0){
                            Global.texto.append("O " + n2 + " GANHOU!\n\n")
                            Global.texto.append("Pressione qualquer opção para proseguir...")
                            b.acabou = true
                            break
                        }
                        
                        if(b.turno){
                            
                            Global.texto.append("\nVez do " + n1 + "\n\n")
                            b.turno = false
                            
                            if (i.morte && b.player1 % 2 == 1 && !p.antiReaper){
                                b.condenado += 1
                            }
                            if (p.antiReaper){
                                p.antiReaper = false
                                i.antiReaper = true
                                b.condenado-=1
                            }
                            
                            jogo(nPlayer: 1, player1: j1, player2: j2, HP: b.player2)
                            
                            if (b.condenado == 4){
                                i.player2 = 0
                                Global.texto.append(n2 + " foi condenado pelo Reaper!\n\n")
                            }
                            
                            atualizar(j1: j1, j2: j2)
                            //Global.texto.append("HP do " + n1 + ": " + String(b.player2) + "\n")
                            Global.HPP1 = b.player2
                            //Global.texto.append("HP do " + n2 + ": " + String(b.player1) + "\n\n")
                            Global.HPP2 = b.player1
                            
                        } else {
                            
                            Global.texto.append("\nVez do " + n2 + "\n\n")
                            b.turno = true
                            
                            if (i.morte && b.player1 % 2 == 1 && !p.antiReaper){
                                b.condenado += 1
                            }
                            if (p.antiReaper){
                                p.antiReaper = false
                                i.antiReaper = true
                                b.condenado -= 1
                            }
                            
                            let escolha = randomIA()
                            sleep(1)
                            
                            jogo(nPlayer: 2, player1: j2, player2: j1, HP: b.player1)
                            
                            Global.texto.append("O "+n2+" escolheu a opção [ "+escolha+" ]\n")
                            
                            if (b.condenado == 4) {
                                i.player2 = 0
                                Global.texto.append(n1 + " foi condenado pelo Reaper!\n\n")
                            }
                            
                            atualizar(j1: j1, j2: j2)
                            //Global.texto.append("HP do " + n1 + ": " + String(b.player2) + "\n")
                            Global.HPP1 = b.player2
                            //Global.texto.append("HP do " + n2 + ": " + String(b.player1) + "\n\n")
                            Global.HPP2 = b.player1
                            
                        }
                        
                    }
        }
    }
}

