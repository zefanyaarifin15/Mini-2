import Foundation

struct ChatMessage: Identifiable {
    let id = UUID() // Correct way to initialize id as a UUID
    let sender: String
    let text: String
}
// test
let jamesMessages: [ChatMessage] = [
    ChatMessage(sender: "Jasmine", text: "Hey babe! Guess what? I just got your flowers They’re beautiful!"),
    ChatMessage(sender: "James", text: "I’m glad you like them! Just wanted to make you smile 😊"),
    ChatMessage(sender: "Jasmine", text: "You’re the sweetest. These flowers are going to look amazing in my next Instagram post."),
    ChatMessage(sender: "James", text: "I can’t wait to see it! Your makeup tutorials are getting so much attention lately."),
    ChatMessage(sender: "Jasmine", text: "Thanks to you! You’re always there cheering me on and helping with all those late-night editing sessions."),
    ChatMessage(sender: "James", text: "I'm always here to support my amazing girlfriend, whether it's with flowers or cheering you on as you conquer the beauty world 🤩"),
    ChatMessage(sender: "Jasmine", text: "And having you by my side makes it all worth it. You're my biggest supporter."),
    ChatMessage(sender: "James", text: "Well, you deserve all the success in the world. I’m just lucky to be along for the ride 😊"),
    ChatMessage(sender: "Jasmine", text: "I love you."),
    ChatMessage(sender: "James", text: "I love you too, more than you’ll ever know 🖤"),
    ChatMessage(sender: "James", text: "Hey, would you mind if I call you? I just want to hear your voice."),
    ChatMessage(sender: "James", text: "Jasmine, we need to talk about last night."),
    ChatMessage(sender: "Jasmine", text: "What’s wrong?"),
    ChatMessage(sender: "James", text: "You got really upset when you saw me with Stephani at the makeup event."),
    ChatMessage(sender: "Jasmine", text: "Yeah, because I saw the way she was looking at you. It made me uncomfortable."),
    ChatMessage(sender: "James", text: "Jasmine, Stephani is just a friend. We were discussing the new makeup line."),
    ChatMessage(sender: "Jasmine", text: "It’s not just that. I've seen the way she comments on your posts and how you two interact on social media."),
    ChatMessage(sender: "James", text: "We’re just friends! And even if there was something, you should trust me."),
    ChatMessage(sender: "Jasmine", text: "It’s hard when I see you with other girls, especially her. It’s not the first time this has happened."),
    ChatMessage(sender: "James", text: "What do you mean?"),
    ChatMessage(sender: "Jasmine", text: "Remember the event last month? You spent the whole time chatting with that girl from the skincare brand."),
    ChatMessage(sender: "James", text: "That was purely professional! You’re overreacting."),
    ChatMessage(sender: "Jasmine", text: "Am I? Because it feels like you’re getting closer to these girls, and I don’t know where I fit in anymore."),
    ChatMessage(sender: "James", text: "Jasmine, my role is to support you, and I would never do anything to jeopardize our relationship. I need you to trust me."),
    ChatMessage(sender: "Jasmine", text: "I do trust you, it’s just hard sometimes. I don’t want to lose you."),
    ChatMessage(sender: "James", text: "Then we need to work on this together. But I can’t keep feeling like I’m being accused of something I’m not doing."),
    ChatMessage(sender: "Jasmine", text: "I’m sorry, I just get insecure sometimes."),
    ChatMessage(sender: "James", text: "I understand, but we can’t let it ruin us. I love you 🖤"),
    ChatMessage(sender: "Jasmine", text: "I love you too. We'll find a way through this, I promise."),
    ChatMessage(sender: "James", text: "Jasmine, we need to talk again. This isn’t working out."),
    ChatMessage(sender: "Jasmine", text: "What do you mean? Are you breaking up with me?"),
    ChatMessage(sender: "James", text: "I can’t do this anymore. The same issue keeps coming up, and I'm exhausted."),
    ChatMessage(sender: "Jasmine", text: "But I thought we were working on it. I can't stand the thought of losing you."),
    ChatMessage(sender: "James", text: "Jasmine, it’s not just about working on it. It's about how I feel when I see you with Stephani or any other girl. I can't keep feeling this way."),
    ChatMessage(sender: "Jasmine", text: "James, you're overreacting. I'm just being friendly. There's nothing going on between us."),
    ChatMessage(sender: "James", text: "No, Jasmine. I'm not overreacting. Your interactions with her make me feel insecure, and I can't ignore it anymore."),
    ChatMessage(sender: "Jasmine", text: "You’re making me out to be the bad guy when all I'm trying to do is be supportive and make new friends."),
    ChatMessage(sender: "James", text: "I’m not making you out to be anything. I'm expressing how your behavior is affecting me. And it's not okay."),
    ChatMessage(sender: "Jasmine", text: "You're always twisting things. I'm the one who's been trying to make this work."),
    ChatMessage(sender: "James", text: "I've tried to make it work too, but I can't keep pretending that everything is fine when it's not. Your behavior is not normal or healthy."),
    ChatMessage(sender: "James", text: "Fine, go ahead and leave. But you'll regret it. You'll see that I'm the only one who truly cares about you."),
    ChatMessage(sender: "Jasmine", text: "James, that's not fair. I can't keep blaming myself for your insecurities. I need to prioritize my own well-being."),
    ChatMessage(sender: "James", text: "You're just like all the others, can't handle a real relationship. You'll come crawling back, you'll see."),
    ChatMessage(sender: "Jasmine", text: "I’m sorry, James. Goodbye.")
]

let natalieMessages: [ChatMessage] = [
    ChatMessage(sender: "Natalie", text: "Hi Jasmine! It's been a while since we hung out. How about we plan something for this weekend? 😆"),
    ChatMessage(sender: "Jasmine", text: "Hey Nat! That sounds great. I’ve been wanting to catch up too. Do you have any place in mind?")
]

class ChatRepository {
    
    static let shared = ChatRepository()
    
    private init() {}
    
    func fetchAllConversations() -> [String: [ChatMessage]] {
        return [
            "James": jamesMessages,
            "Natalie": natalieMessages
        ]
    }
    
    func fetchMessages(for partner: String) -> [ChatMessage]? {
        switch partner {
        case "James":
            return jamesMessages
        case "Natalie":
            return natalieMessages
        default:
            return nil
        }
    }
}
