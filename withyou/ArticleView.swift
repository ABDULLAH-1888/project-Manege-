import UIKit

struct Article{
    let title: String
    let content: String
}

class ArticleView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    var articles: [Article] = [
        Article(title: "فهم القلق", content: """
            القلق هو استجابة طبيعية للتوتر. يمكن أن يساعدك في التعامل مع المواقف الصعبة. ومع ذلك، عندما يصبح مفرطًا، يمكن أن يؤثر على الحياة اليومية. 
            تقنيات مثل التنفس العميق، واليقظة الذهنية، والتحدث مع شخص تثق به يمكن أن تساعد في إدارة القلق.
        """),
        Article(title: "أهمية النوم", content: """
            النوم مهم للصحة النفسية. نقص النوم يمكن أن يؤدي إلى تهيج، وقلق، واكتئاب. 
            إنشاء جدول نوم منتظم، وتهيئة بيئة مريحة، والحد من وقت الشاشة قبل النوم يمكن أن يحسن جودة النوم.
        """),
        Article(title: "التعامل مع الاكتئاب", content: """
            يمكن أن يجعل الاكتئاب من الصعب الشعور بالتحفيز. من المهم البحث عن مساعدة من محترف. 
            الأنشطة البسيطة مثل ممارسة الرياضة، والكتابة في المذكرات، والبقاء على اتصال مع الأصدقاء يمكن أن تساعد أيضًا في إدارة الأعراض.
        """),
        Article(title: "اليقظة الذهنية والتأمل", content: """
            اليقظة الذهنية تعني التركيز على اللحظة الحالية. يمكن أن تقلل من التوتر وتحسن الرفاهية العامة. 
            يمكن أن تساعد ممارسة التأمل بانتظام في تنمية اليقظة الذهنية وتوفير شعور بالهدوء.
        """),
        Article(title: "بناء المرونة", content: """
            المرونة هي القدرة على التعافي من الشدائد. يمكن تطويرها من خلال العلاقات الداعمة، والحفاظ على نظرة إيجابية، 
            وتعلم مهارات حل المشكلات.
        """),
        Article(title: "إدارة التوتر", content: """
            إدارة التوتر ضرورية للصحة النفسية. تقنيات مثل ممارسة الرياضة، وطرق الاسترخاء، وإدارة الوقت يمكن أن تساعد في تقليل مستويات التوتر. 
            العثور على هوايات والانخراط في أنشطة ممتعة يلعب أيضًا دورًا مهمًا.
        """),
        Article(title: "البحث عن المساعدة المهنية", content: """
            في بعض الأحيان، يكون من الضروري التحدث إلى محترف في الصحة النفسية. يمكن أن يوفر العلاج مساحة آمنة لاستكشاف المشاعر وتطوير استراتيجيات التعامل. 
            تذكر أن البحث عن المساعدة هو علامة على القوة.
        """)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    // MARK: - TableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath)
        let article = articles[indexPath.row]
        cell.textLabel?.text = article.title
        return cell
    }
    
    // MARK: - TableView Delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedArticle = articles[indexPath.row]
        print("Selected Artcile:\(selectedArticle.title), \(selectedArticle.content)")
        performSegue(withIdentifier: "Tolistpagetableview", sender: selectedArticle)
    }
    
    // MARK: - Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Tolistpagetableview" {
            let destinationVC = segue.destination as! ArticleDetalisViewController
            if let article = sender as? Article {
                print("Article Content Passed: \(article.content)")
                destinationVC.articleContent = article.content
            }
        }
    }
}
