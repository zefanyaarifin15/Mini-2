import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = [
        Task(title: "1). See the comments on my new post", isCompleted: false),
        Task(title: "2). Find hate comments on my new post", isCompleted: false),
        Task(title: "3). Talk to Rose about the hate comments", isCompleted: false),
        Task(title: "4). Click the stalker account", isCompleted: false),
        Task(title: "5). Talk to Stephanie", isCompleted: false),
        Task(title: "6). Talk to Rose about the break up things", isCompleted: false),
        Task(title: "7). Find out Jasmine’s past relationship", isCompleted: false),
        Task(title: "8). Chat with the stalker", isCompleted: false),
        Task(title: "9). Examine the house photo.", isCompleted: false),
        Task(title: "10). Block the stalker", isCompleted: false),
        Task(title: "11). Chat with police.", isCompleted: false),
        Task(title: "12). Talk to Rose about my condition.", isCompleted: false),
        Task(title: "13). Logged out from Rose phone.", isCompleted: false),
        Task(title: "14). Chat with Natalie about our girls night.", isCompleted: false),
        Task(title: "15). Seeing comments in Natalie’s post.", isCompleted: false),
        Task(title: "16). Send this comment to Natalie and offer a word of reassurance.", isCompleted: false),
        Task(title: "17). Open DM from fans.", isCompleted: false),
        Task(title: "18). Unblock the stalker.", isCompleted: false),
        Task(title: "19). See the stalker’s newest post. Find some suspicious objects on that post that leads to the stalker's identity.", isCompleted: false),
    ]
    
    func completeTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted = true
        }
    }
    
    func showTask(at index: Int) -> Bool {
        if index == 0 { return true }
        return tasks[index - 1].isCompleted
    }
}
