# Generating ERC3525-compatible On-chain Metadata

## Summary

Storing Metadata On-chain is strongly advised to achieve immutabilty.
Since Starknet compute is cheap, generating complex Metadata on Starknet

Using the periphery interface IERC3525MetadataDescriptor

## To do:

- Implement MetadataDescriptor interface
  - https://eips.ethereum.org/EIPS/eip-3525#metadata
  - https://github.com/solv-finance/erc-3525/blob/main/contracts/periphery/ERC3525MetadataDescriptor.sol
- Display on-chain attributes
- Construct on-chain SVG querying on-chain storage
  - PoC: Display ERC3525 Value in the tokenURI SVG
- Investigate Updatable Metadata EIP 5185 https://eips.ethereum.org/EIPS/eip-5185
