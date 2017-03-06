import PackageDescription

let package = Package(
    name: "01-logic-programming",
    dependencies: [
        .Package(url: "https://github.com/kyouko-taiga/LogicKit",
                 majorVersion: 0),
    ]
)
