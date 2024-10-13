//
//  PrivacyPolicy.swift
//
//
//  Created by Avery Vine on 15/4/24.
//

import Foundation

struct PrivacyPolicy {
    let effectiveDate: Date
    let policyText: String
}

extension PrivacyPolicy {
    // MARK: Cyclo
    static let cyclo = PrivacyPolicy(
        effectiveDate: DateComponents(calendar: .current, year: 2024, month: 4, day: 15).date!,
        policyText: """
**Policy**

Avery Vine ("I", "me") operates the Cyclo mobile application (the "Service").

This page informs you of my policies regarding the collection, use, and disclosure of personal data when you use my Service and the choices you have associated with that data.

**Information Collection and Use**

I **do not** collect or use any of your personal data for any reason.

**Changes To This Privacy Policy**

I may update this Privacy Policy from time to time. I will notify you of any changes by posting the new Privacy Policy on this page. I will let you know via email and/or a prominent notice on the Service, prior to the change becoming effective and update the "effective date" at the top of this Privacy Policy. You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.

**Contact Me**

If you have any questions about this Privacy Policy, please contact me:
- By email: [averyvine@icloud.com](mailto:averyvine@icloud.com)
"""
    )

    // MARK: Droplet
    static let droplet = PrivacyPolicy(
        effectiveDate: DateComponents(calendar: .current, year: 2024, month: 10, day: 13).date!,
        policyText: """
**Policy**

Avery Vine ("I", "me") operates the Droplet mobile application (the "Service").

This page informs you of my policies regarding the collection, use, and disclosure of personal data when you use my Service and the choices you have associated with that data.

**Information Collection and Use**

I **do not** collect or use any of your personal data for any reason.

**Changes To This Privacy Policy**

I may update this Privacy Policy from time to time. I will notify you of any changes by posting the new Privacy Policy on this page. I will let you know via email and/or a prominent notice on the Service, prior to the change becoming effective and update the "effective date" at the top of this Privacy Policy. You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.

**Contact Me**

If you have any questions about this Privacy Policy, please contact me:
- By email: [averyvine@icloud.com](mailto:averyvine@icloud.com)
"""
    )
}
