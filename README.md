You need Mint:

```
$ brew install mint
```

To generate by SwagGen 4.3.1:

```sh
$ mint run SwagGen@fix/swiftenv_swift_version swaggen generate openapi.json -d generated
```

To generate by Swaggen 4.2.0:

```sh
$ mint run SwagGen@fix/swiftenv_swift_version swaggen generate openapi.json -d generated
```

The SwagGen is fork of official SwagGen https://github.com/yonaskolb/SwagGen.
The changes are only `.swift-version` from Swift 4.1 to Swift 5.2.
