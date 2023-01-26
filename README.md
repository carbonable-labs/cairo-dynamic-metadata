# Generating ERC3525-compatible On-chain Metadata

## About
The purpose is to displays on-chain attributes via the periphery interface IERC3525MetadataDescriptor.
Starknet L2 compute is cheap enough to be able to generate complex Metadata on-chain.


## To-do:
- Metadata interfaces
  - https://eips.ethereum.org/EIPS/eip-3525#metadata
  - https://github.com/solv-finance/erc-3525/blob/main/contracts/periphery/ERC3525MetadataDescriptor.sol
- Construct on-chain SVG querying on-chain storage
  - PoC: Display ERC3525 Value in the tokenURI SVG
- Investigate Updatable Metadata EIP 5185 https://eips.ethereum.org/EIPS/eip-5185
