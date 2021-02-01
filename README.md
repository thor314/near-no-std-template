# Template for a NEAR project
Modified from https://github.com/thor314/near-template.

This is a `no-std` version of my prior `near-template`. The final wasm blob size is reduced from 43kB to 37kB. This is especially valuable if deploying this contract repeatedly, as in a [factory pattern](https://github.com/thor314/near-factory-pattern/tree/db380d1729041ec4ed9e6b477f98fddac2ed23f4).

Note that Simulation Tests and Cross Contract calls (the latter relies on `ext_contract` which relies ond `std`) are not currently functional in `near_sdk_pure`. The `tests` directory has been removed, relative to `near-template`.

Note that

This repo references patterns here: https://github.com/snjax/nep4_nostd_example.

Contains:
- a setup script
- Cargo.toml setup with simulation testing and NEAR sdk crates
- build and deploy scripts
- a src directory containing lib.rs, with common imports and ignore attributes
- a test directory containing a simulation test setup
- my preferred .gitignore and .rustfmt.toml setup

## Setup script usage:
`./setup.sh my_project_name`
will change all instances of "dummy" to whatever you'd like to call this project, and rename this
README to `instructions.md`.

## Build script usage:
`./build.sh` to build the wasm blob. The wasm blob will be copied into `res/`.

## Deploy script usage:
`./deploy.sh MYADDRESS` to deploy your wasm blob to the NEAR testnet.

Note that if you change the constructor arguments, You will have to modify the arguments int the `deploy.sh`
script. If my constructor is `new(name: String, number: u32) -> Self`, and I want to initialize with ("Todd", 1), I
will change the script to:

`near deploy --wasmFile res/dummy.wasm --initFunction "new" --initArgs '{"name": "Todd", "number": 1}' --accountId $1.testnet`

and call `./deploy.sh MYADDRESS`, or to provide arguments, change `deploy.sh` to:

`near deploy --wasmFile res/dummy.wasm --initFunction "new" --initArgs "{\"name\": $1, \"number\": $2}" --accountId $1.testnet`

and call `./deploy.sh MYADDRESS MYNAME MYNUM`.
