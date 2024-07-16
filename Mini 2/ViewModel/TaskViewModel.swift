import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task1] = [
        Task1(title: "1). See the comments on my new post", isCompleted: false),
        //Task1(title: "2). Find hate comments on my new post", isCompleted: false),
        Task1(title: "2). Talk to Rose about the hate comments", isCompleted: false),
        
        Task1(title: " ", isCompleted: false),
        Task1(title: " ", isCompleted: false),
        Task1(title: " ", isCompleted: false),
        Task1(title: " ", isCompleted: false),
        Task1(title: " ", isCompleted: false),
        Task1(title: " ", isCompleted: false),
        Task1(title: " ", isCompleted: false),
        Task1(title: " ", isCompleted: false),
        Task1(title: " ", isCompleted: false),
        Task1(title: " ", isCompleted: false),
        Task1(title: " ", isCompleted: false),
        Task1(title: " ", isCompleted: false),
        Task1(title: " ", isCompleted: false),
        Task1(title: " ", isCompleted: false),
        Task1(title: " ", isCompleted: false),
        
//        Task1(title: "3). Click the stalker account", isCompleted: false),
//        Task1(title: "4). Talk to Stephanie", isCompleted: false),
//        Task1(title: "6). Talk to Rose about the break up things", isCompleted: false),
//        Task1(title: "7). Find out Jasmine’s past relationship", isCompleted: false),
//        Task1(title: "8). Chat with the stalker", isCompleted: false),
//        Task1(title: "9). Examine the house photo.", isCompleted: false),
//        Task1(title: "10). Block the stalker", isCompleted: false),
//        Task1(title: "11). Chat with police.", isCompleted: false),
//        Task1(title: "12). Talk to Rose about my condition.", isCompleted: false),
//        Task1(title: "13). Logged out from Rose phone.", isCompleted: false),
//        Task1(title: "14). Chat with Natalie about our girls night.", isCompleted: false),
//        Task1(title: "15). Seeing comments in Natalie’s post.", isCompleted: false),
//        Task1(title: "16). Send this comment to Natalie and offer a word of reassurance.", isCompleted: false),
//        Task1(title: "17). Open DM from fans.", isCompleted: false),
//        Task1(title: "18). Unblock the stalker.", isCompleted: false),
//        Task1(title: "19). See the stalker’s newest post. Find some suspicious objects on that post that leads to the stalker's identity.", isCompleted: false),
    ]
    
    func completeTask(_ task: Task1) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted = true
        }
    }
    
    func showTask(at index: Int) -> Bool {
        if index == 0 { return true }
        return tasks[index - 1].isCompleted
    }
}
