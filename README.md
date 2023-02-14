<div align="center">
  <h1 align="center">Dynamic Metadata URIs for Starknet</h1>
  <p align="center">
    <a href="https://discord.gg/qqkBpmRDFE">
        <img src="https://img.shields.io/badge/Discord-6666FF?style=for-the-badge&logo=discord&logoColor=white">
    </a>
    <a href="https://twitter.com/intent/follow?screen_name=Carbonable_io">
        <img src="https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white">
    </a>       
  </p>
  <h3 align="center">On-chain Metadata Contracts written in Cairo for Starknet.</h3>
</div>

> ## ⚠️ WARNING! ⚠️
>
> This is repo contains highly experimental code.
> Expect rapid iteration.
> **Use at your own risk.**

### About

This project provides a way to generate metadata attributes on-chain that are dynamic and immutable.
Starknet L2 compute is cheap enough to be able to generate complex Metadata on-the-go and update attributes
based on contract storage.
This way, we could get rid of external sources of truth such as IPFS servers, though semi on-chain attributes are not excluded.

### Roadmap:

- Implement Metadata interfaces
  - https://eips.ethereum.org/EIPS/eip-3525#metadata
  - https://github.com/solv-finance/erc-3525/blob/main/contracts/periphery/ERC3525MetadataDescriptor.sol
- Construct on-chain SVG querying on-chain storage
  - PoC: Display ERC3525 Value in the tokenURI SVG
- Investigate Updatable Metadata EIP 5185 https://eips.ethereum.org/EIPS/eip-5185

### Project setup

#### 📦 Requirements

- [protostar](https://github.com/software-mansion/protostar)

#### 🎉 Install

```bash
make install
```

#### ⛏️ Compile

```bash
make
```

#### 🌡️ Test

```bash
make test
```

### 📄 License

This project is released under the MIT license.
