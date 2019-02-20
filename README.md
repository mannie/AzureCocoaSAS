# AzureCocoaSAS
This is a small Swift library to help with the generation of SAS tokens for use in Azure.

## Create a Demo Project
1. Using the command line interface, type in the following commands to:
    1. Create a new directory.
    1. Navigate into that new folder.
    1. Create a new Swift project.
    ```sh
    mkdir Demo
    cd Demo
    swift package init --type executable
    ```
1. Open the newly created **Package.swift** file (`./Package.swift`) and edit it to contain the following:
    ```swift
    import PackageDescription

    let package = Package(
        name: "Demo",
        dependencies: [
            .package(url: "https://github.com/mannie/AzureCocoaSAS.git", .branch("master"))
        ],
        targets: [
            .target(name: "Demo", dependencies: [ "AzureCocoaSAS" ]),
            .testTarget(name: "DemoTests", dependencies: ["Demo"]),
        ]
    )
    ```
1. Open the **main.swift** file (`./Sources/Demo/main.swift`) and edit it to contain the following or similar:
    ```swift
    import AzureCocoaSAS

    let policy = AzureCocoaSAS.SharedAccessPolicy(name: "SharedAccessKey", key: "Jp9cUB1iCF=")
    let endpoint = "https://divergent.servicebus.windows.net/streamer"
    
    let t1 = try? AzureCocoaSAS.token(for: endpoint, using: policy) // defaults to a lifetinme of 1 week
    let t2 = try? AzureCocoaSAS.token(for: endpoint, using: policy, lifetime: 60 * 60) // lifetime of 1 hour
    
    print("t1 => \(t1!)")
    print("t2 => \(t2!)")
    ```

1. Using the command line prompt, run your Swift app:
    ```sh
    swift run
    ```

    Your app should output something similar to:
    ```sh
    t1 => SharedAccessSignature sr=https%3A%2F%2Fdivergent%2Eservicebus%2Ewindows%2Enet%2Fstreamer&sig=JFbf9AXbrbqTFlEIioNe%2F36OeKC8QNKMcEAnjmKRo%2BU%3D&se=1551309021&skn=SharedAccessKey
    t2 => SharedAccessSignature sr=https%3A%2F%2Fdivergent%2Eservicebus%2Ewindows%2Enet%2Fstreamer&sig=1dguWqPExRoXy9rwZg%2B5OdpVirOkQEBtZkk0tMTSU%2Fo%3D&se=1550707821&skn=SharedAccessKey
    ```

## Sample Projects
* https://github.com/mannie/EventStreamer
