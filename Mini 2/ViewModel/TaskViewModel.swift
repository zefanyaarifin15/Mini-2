import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = [
        Task(title: "1). Find the hate comments on your new post", isCompleted: false),
        Task(title: "2). Talk to Rose about the hate comments", isCompleted: false),
        Task(title: "3). You have to click the stalker account", isCompleted: false),
        Task(title: "4). Connecting clues", isCompleted: false),
        Task(title: "5). Connecting clues", isCompleted: false),
        Task(title: "6). Talk to Stephanie", isCompleted: false),
        Task(title: "7). Talk to Rose", isCompleted: false),
        Task(title: "8). Find out Jasmine’s past relationship", isCompleted: false),
        Task(title: "9). Find out the motives", isCompleted: false),
        Task(title: "10). Chat with the stalker", isCompleted: false),
        Task(title: "11). Examine the house photo.", isCompleted: false),
        Task(title: "12). Eliminate the suspect", isCompleted: false),
        Task(title: "13). Block the stalker", isCompleted: false),
        Task(title: "14). Chat with police.", isCompleted: false),
        Task(title: "15). Chat with Rose", isCompleted: false),
        Task(title: "16). Logged out from Rose phone", isCompleted: false),
        Task(title: "17). Chat with Natalie", isCompleted: false),
        Task(title: "18). Seeing comments in Natalie’s post", isCompleted: false),
        Task(title: "19). Reassure Natalie", isCompleted: false),
        Task(title: "20). Find out the motives", isCompleted: false),
        Task(title: "21). Open image in DM & post it in feed.", isCompleted: false),
        Task(title: "22). Secure even bigger contract", isCompleted: false),
        Task(title: "23). Open DM from fans.", isCompleted: false),
        Task(title: "24). Unblock the stalke", isCompleted: false),
        Task(title: "25). Check stalker's latest post", isCompleted: false),
        Task(title: "26). Answer journalists’ questions", isCompleted: false),
//        Task(title: "27). Users need to maintain a trust level more than 70%.", isCompleted: false),
        Task(title: "28). Chat with stalker ", isCompleted: false),
        Task(title: "29). Examine the voice note and call", isCompleted: false),
        Task(title: "30). Fill out cards in relationship board", isCompleted: false),
        Task(title: "31). Pick a suspect and report to the police", isCompleted: false),
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
