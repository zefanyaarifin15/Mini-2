//import Foundation
//import SwiftData
//
//@Model
//class TaskModel {
//    var id = UUID()
//    var title: String?
//    var isCompleted: Bool?
//    
//    init(title: String? = nil, isCompleted: Bool? = nil) {
//        self.title = title
//        self.isCompleted = isCompleted
//    }
//}
//
//class SwiftData {
//    private let modelContainer: ModelContainer
//    private let modelContext: ModelContext
//
//    @MainActor
//    static let shared = SwiftData()
//
//    @MainActor
//    private init() {
//        // Initialize the schema with TaskModel
//        let schema = Schema([TaskModel.self as! any PersistentModel.Type])
//        
//        self.modelContainer = try! ModelContainer(for: schema, configurations: ModelConfiguration(isStoredInMemoryOnly: false))
//        self.modelContext = modelContainer.mainContext
//    }
//
//    func fetchNotes() -> [TaskModel] {
//        
//        var fetchDescriptor = FetchDescriptor<TaskModel>()
//        fetchDescriptor.sortBy = [SortDescriptor(\TaskModel.id, order: .reverse)] // Sort by id or some other property
//
//        do {
//            return try modelContext.fetch(fetchDescriptor)
//        } catch {
//            fatalError(error.localizedDescription)
//        }
//    }
//
//    // Uncomment and use this function to save notes
//    // func saveNotes(note: TaskModel) {
//    //     modelContext.insert(note)
//    // }
//}
