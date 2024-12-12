//
//  Challenge.swift
//  withyou
//
//  Created by Abdullah on 10/06/1446 AH.
//



import Foundation

struct DailyChallenge {
    let title: String
    let description: String
    let category: ChallengeCategory
    let duration: Int? // المدة بالدقائق (اختياري)
}

enum ChallengeCategory: String {
    case meditation = "تأمل"
    case writing = "كتابة"
    case movement = "حركة"
}

// قائمة التحديات اليومية
let dailyChallenges: [DailyChallenge] = [
    DailyChallenge(title: "التنفس العميق", description: "مارس التنفس العميق لمدة 3 دقائق", category: .meditation, duration: 3),
    DailyChallenge(title: "كتابة الامتنان", description: "اكتب ثلاثة أشياء تشعر بالامتنان من أجلها", category: .writing, duration: nil),
    DailyChallenge(title: "المشي", description: "قم بالمشي لمدة نصف ساعة", category: .movement, duration: 30)
]
