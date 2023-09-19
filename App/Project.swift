import ProjectDescriptionHelpers
import ProjectDescription

let project = Project.excutable(
    name: "HumanRandomApp",
    platform: .iOS,
    deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
    dependencies: [

    ]
)
