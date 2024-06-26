import Foundation

let jamesMessages: [(String, String)] = [
    ("Girlfriend", "Hey babe! Guess what? I just got your flowers. They’re beautiful! 😊"),
    ("Boyfriend", "I’m glad you like them! Just wanted to make you smile."),
    ("Girlfriend", "You’re the sweetest. These flowers are going to look amazing in my next Instagram post."),
    ("Boyfriend", "I can’t wait to see it! Your makeup tutorials are getting so much attention lately."),
    ("Girlfriend", "Thanks to you! You’re always there cheering me on and helping with all those late-night editing sessions."),
    ("Boyfriend", "I'm always here to support my amazing girlfriend, whether it's with flowers or cheering you on as you conquer the beauty world."),
    ("Girlfriend", "And having you by my side makes it all worth it. You're my biggest supporter."),
    ("Boyfriend", "Well, you deserve all the success in the world. I’m just lucky to be along for the ride."),
    ("Girlfriend", "I love you."),
    ("Boyfriend", "I love you too, more than you’ll ever know."),
    ("Girlfriend", "Hey, we need to talk about last night."),
    ("Boyfriend", "What’s wrong?"),
    ("Girlfriend", "You got really upset when you saw me with Alex at the makeup event."),
    ("Boyfriend", "Yeah, because I saw the way he was looking at you. It made me uncomfortable."),
    ("Girlfriend", "James, Alex is just a colleague. We were discussing work-related stuff."),
    ("Boyfriend", "It’s not just that."),
    ("Boyfriend", "I’ve seen the way he comments on your posts and how you two interact on social media."),
    ("Girlfriend", "We’re just friends! And even if there was something, you should trust me."),
    ("Boyfriend", "It’s hard when I see you with other influencers, especially him."),
    ("Boyfriend", "It’s not the first time this has happened."),
    ("Girlfriend", "What do you mean?"),
    ("Boyfriend", "Remember the event last month? You spent the whole time chatting with that guy from the skincare brand."),
    ("Girlfriend", "That was purely professional! You’re overreacting."),
    ("Boyfriend", "Am I? Because it feels like you’re getting closer to these guys, and I don’t know where I fit in anymore."),
    ("Girlfriend", "James, my work is important to me, but so are you."),
    ("Girlfriend", "I need you to trust me."),
    ("Boyfriend", "I do trust you, it’s just hard sometimes."),
    ("Boyfriend", "I don’t want to lose you."),
    ("Girlfriend", "Then we need to work on this together. But I can’t keep feeling like I’m being accused of something I’m not doing."),
    ("Boyfriend", "I’m sorry, I just get insecure sometimes."),
    ("Girlfriend", "I understand, but we can’t let it ruin us."),
    ("Girlfriend", "I love you."),
    ("Boyfriend", "I love you too. We'll find a way through this, I promise."),
    ("[few days later]", ""),
    ("Girlfriend", "James, we need to talk again. This isn’t working out."),
    ("Boyfriend", "What do you mean? Are you breaking up with me?"),
    ("Girlfriend", "I can’t do this anymore. The same issue keeps coming up, and I'm exhausted."),
    ("Boyfriend", "But I can’t stand the thought of you with him, or any other guy. I feel like I'm losing you."),
    ("Girlfriend", "James, that’s not healthy. I can’t live like this."),
    ("Boyfriend", "What are you talking about? You're overreacting. I'm just looking out for us."),
    ("Girlfriend", "No, James. I'm not overreacting. Your jealousy is suffocating me, and I can't ignore it anymore."),
    ("Boyfriend", "You’re making me out to be the bad guy when all I'm trying to do is protect our relationship."),
    ("Girlfriend", "I’m not making you out to be anything. I'm expressing how your behavior is affecting me. And it's not okay."),
    ("Boyfriend", "You're always twisting things. I'm the one who's been trying to make this work."),
    ("Girlfriend", "I've tried to make it work too, but I can't keep pretending that everything is fine when it's not. Your behavior is not normal or healthy."),
    ("Boyfriend", "Fine, go ahead and leave."),
    ("Boyfriend", "But you'll regret it."),
    ("Boyfriend", "You'll see that I'm the only one who truly cares about you."),
    ("Girlfriend", "James, that's not fair. I can't keep blaming myself for your insecurities. I need to prioritize my own well-being."),
    ("Boyfriend", "You're just like all the others, can't handle a real relationship."),
    ("Boyfriend", "You'll come crawling back, you'll see."),
    ("Girlfriend", "I’m sorry, James. Goodbye.")
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
