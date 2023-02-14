// SPDX-License-Identifier: MIT

%lang starknet

from starkware.cairo.common.uint256 import Uint256

@contract_interface
namespace IERC3525MetadataDescriptor {
    func constructContractURI() -> (uri_len: felt, uri: felt*) {
    }

    func constructSlotURI(slot: Uint256) -> (uri_len: felt, uri: felt*) {
    }

    func constructTokenURI(tokenId: Uint256) -> (uri_len: felt, uri: felt*) {
    }
}
