import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // تأكد من أن المشهد هو UIWindowScene
        guard let windowScene = scene as? UIWindowScene else { return }
        
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // يمكن استخدام هذا لإطلاق الموارد المرتبطة بهذا المشهد عند قطع الاتصال به
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // إعادة بدء أي مهام كانت متوقفة
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // التعامل مع الحالات التي قد تؤدي إلى انتقالي للمشهد غير النشط
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // التراجع عن التغييرات التي أجريت عند دخول الخلفية
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // حفظ البيانات وإطلاق الموارد المشتركة
    }
}
