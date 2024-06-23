import Foundation

let jamesMessages: [(String, String)] = [
    ("Jasmine", "Hey babe! Guess what? I just got your flowers. They’re beautiful!"),
    ("James", "I’m glad you like them! Just wanted to make you smile 😊"),
    ("Jasmine", "You’re the sweetest. These flowers are going to look amazing in my next Instagram post."),
    ("James", "I can’t wait to see it! Your makeup tutorials are getting so much attention lately."),
    ("Jasmine", "Thanks to you! You’re always there cheering me on and helping with all those late-night editing sessions."),
    ("James", "I'm always here to support my amazing girlfriend, whether it's with flowers or cheering you on as you conquer the beauty world 🤩"),
    ("Jasmine", "And having you by my side makes it all worth it. You're my biggest supporter."),
    ("James", "Well, you deserve all the success in the world. I’m just lucky to be along for the ride 😊"),
    ("Jasmine", "I love you."),
    ("James", "I love you too, more than you’ll ever know 🖤"),
    ("James", "Hey, we need to talk about last night."),
    ("Jasmine", "What’s wrong?"),
    ("James", "You got really upset when you saw me with Stephani at the makeup event."),
    ("Jasmine", "Yeah, because I saw the way she was looking at you. It made me uncomfortable."),
    ("James", "Jasmine, Stephani is just a friend. We were discussing the new makeup line."),
    ("Jasmine", "It’s not just that. I've seen the way she comments on your posts and how you two interact on social media."),
    ("James", "We’re just friends! And even if there was something, you should trust me."),
    ("Jasmine", "It’s hard when I see you with other girls, especially her. It’s not the first time this has happened."),
    ("James", "What do you mean?"),
    ("Jasmine", "Remember the event last month? You spent the whole time chatting with that girl from the skincare brand."),
    ("James", "That was purely professional! You’re overreacting."),
    ("Jasmine", "Am I? Because it feels like you’re getting closer to these girls, and I don’t know where I fit in anymore."),
    ("James", "Jasmine, my role is to support you, and I would never do anything to jeopardize our relationship. I need you to trust me."),
    ("Jasmine", "I do trust you, it’s just hard sometimes. I don’t want to lose you."),
    ("James", "Then we need to work on this together. But I can’t keep feeling like I’m being accused of something I’m not doing."),
    ("Jasmine", "I’m sorry, I just get insecure sometimes."),
    ("James", "I understand, but we can’t let it ruin us. I love you 🖤"),
    ("Jasmine", "I love you too. We'll find a way through this, I promise."),
    ("Jasmine", "James, we need to talk again. This isn’t working out."),
    ("James", "What do you mean? Are you breaking up with me?"),
    ("Jasmine", "I can’t do this anymore. The same issue keeps coming up, and I'm exhausted."),
    ("James", "But I thought we were working on it. I can't stand the thought of losing you."),
    ("Jasmine", "James, it’s not just about working on it. It's about how I feel when I see you with Stephani or any other girl. I can't keep feeling this way."),
    ("James", "Jasmine, you're overreacting. I'm just being friendly. There's nothing going on between us."),
    ("Jasmine", "No, James. I'm not overreacting. Your interactions with her make me feel insecure, and I can't ignore it anymore."),
    ("James", "You’re making me out to be the bad guy when all I'm trying to do is be supportive and make new friends."),
    ("Jasmine", "I’m not making you out to be anything. I'm expressing how your behavior is affecting me. And it's not okay."),
    ("James", "You're always twisting things. I'm the one who's been trying to make this work."),
    ("Jasmine", "I've tried to make it work too, but I can't keep pretending that everything is fine when it's not. Your behavior is not normal or healthy."),
    ("James", "Fine, go ahead and leave. But you'll regret it. You'll see that I'm the only one who truly cares about you."),
    ("Jasmine", "James, that's not fair. I need to prioritize my own well-being."),
    ("James", "You're just like all the others, can't handle a real relationship. You'll come crawling back, you'll see."),
    ("Jasmine", "I’m sorry, James. Goodbye.")
]

class ChatRepository {
    static let shared = ChatRepository()

    private init() {}


    private let conversations: [String: [(String, String)]] = [
        "James": jamesMessages
    ]

    func fetchAllConversations() -> [String: [(String, String)]] {
        return conversations
    }

    func fetchMessages(for partner: String) -> [(String, String)]? {
        return fetchAllConversations()[partner]
    }
    
    func fetchMessageIndex(at index: Int, for partner: String) -> (String, String)? {
        guard let messages = conversations[partner], index < messages.count else {
            return nil
        }
        return messages[index]
    }
    
    func fetchLastMessage(for partner: String) -> (String, String)? {
        guard let messages = conversations[partner] else {
            return nil
        }
        return messages.last
    }
}
