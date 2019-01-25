# AzureCocoaSAS
This is a small Swift library to help with the generation of SAS tokens for use in Azure.

## Usage

### Obtain a local copy of the source code
Add this repo to your working directory as a submodule
```
git submodule add https://github.com/mannie/AzureCocoaSAS.git
```
or by cloning the repo to a local directory
```
git clone https://github.com/mannie/AzureCocoaSAS.git
```

### Add the project to your workspace
Drag the `AzureCocoaSAS.xcodeproj` file into your project's workspace. Ensure that `AzureCocoaSAS.xcodeproj` is a subproject and not a top-level project in the workspace.

### Link your project with `AzureCocoaSAS`
Select the target you would like to use AzureCocoaSAS from. Add `AzureCocoaSAS.framework` as a linked framework to your Mac project; add `AzureCocoaTouchSAS.framework` if linking to iOS.

### Add the code to your project

```
import AzureCocoaSAS

let policy = AzureCocoaSAS.SharedAccessPolicy(name: "RootManageSharedAccessKey", key: "Jp9cUB1iCF/MBLCa9A+wLB4DKBDewmkfAkEQ6X7NjP0=")
let endpoint = "https://divergent.servicebus.windows.net/streamer"
let t1 = try? AzureCocoaSAS.generateToken(for: endpoint, using: policy) // defaults to a lifetinme of 1 week
let t2 = try? AzureCocoaSAS.generateToken(for: endpoint, using: policy, lifetime: 60 * 60) // lifetime of 1 hour
```

`t1` and `t2` should contain a value similar to
```
SharedAccessSignature sr=https%3A%2F%2Fdivergent%2Eservicebus%2Ewindows%2Enet%2Fstreamer&sig=HSAV7m0vOLP032URaAlNTMTIdW2MGpJA1xu2Te%2Bi5k8%3D&se=1548446767&skn=RootManageSharedAccessKey
```

