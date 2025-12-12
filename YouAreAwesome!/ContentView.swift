//
//  ContentView.swift
//  YouAreAwesome!
//
//  Created by Villalobos, Stephanie on 11/5/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1// lastMessageNumber will never be -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    let numberOfImages = 10// images labeled images0-image9
    let numberOfSounds = 6// sounds labeled sound0-sound5
    
    var body: some View {
        
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                . multilineTextAlignment(.center)
                . minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: message)

            Spacer()
              
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)

            
            Spacer()
            
            Button("Show Message") {
                let messages = ["You Are Awesome!",
                                "When the Genius Bar Needs Help, They Call You!",
                                "You Are Great!",
                                "You Are Fantastic!",
                                "Fabulous? That's You!",
                                "You Make Me Smile!"]
                
                
                // generate a random messageNumber to use an index
                // if messageNumber = lastMessageNumber {
                //        keep generating a new random messageNumber
                //        until you get a messageNumber !=  lastMessageNumber
                // set messageString to messages[messageNumber]
                // update the lastMessageNumber with messageNumber
                
                lastMessageNumber =  nonRepeatingRandom(lastNumber: lastMessageNumber, upperBound: messages.count-1)
                message = messages[lastMessageNumber]
                
                
                lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBound: numberOfImages-1)
                var imageNumber: Int
                repeat {
                    imageNumber = Int.random(in: 0...numberOfImages-1)
                }  while imageNumber == lastImageNumber
                lastImageNumber = imageNumber
                imageName = "image\(imageNumber)"
                
                var soundNumber: Int
                repeat {
                     soundNumber = Int.random(in:0...numberOfSounds-1)
                } while soundNumber == lastSoundNumber
                lastSoundNumber = soundNumber
                
                playSound(soundName: "sound\(soundNumber)")
                
            }
                    .buttonStyle(.borderedProminent)
                    .font(.title2)
                
                    .padding()
            }
        }
    
    
    func nonRepeatingRandom(lastNumber: Int, upperBound: Int) -> Int {
        var newNumber: Int
        repeat{
            newNumber = Int.random(in: 0...upperBound)
        } while newNumber == lastNumber
        return newNumber

    }
    
    
    
    
    
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else{
            print("😡 Could not read file named \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer")
        }
     

        }
    }

   
    #Preview {
            ContentView()
        }
