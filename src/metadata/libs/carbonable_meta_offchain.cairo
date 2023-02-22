// SPDX-License-Identifier: MIT

%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin, BitwiseBuiltin
from starkware.cairo.common.uint256 import Uint256

from cairopen.string.ASCII import StringCodec
from cairopen.string.utils import StringUtil

from erc3525.IERC3525Full import IERC3525Full as IERC3525

from metadata.utils.library import append_ss

namespace ERC3525MetadataDescriptor {
    func constructContractURI{
        syscall_ptr: felt*,
        pedersen_ptr: HashBuiltin*,
        bitwise_ptr: BitwiseBuiltin*,
        range_check_ptr,
        instance,
    }() -> (uri_len: felt, uri: felt*) {
        let (str) = StringCodec.ss_to_string('https://dev-carbonable-metadata');
        let (str) = append_ss(str, '.fly.dev/collection/1');
        return (str.len, str.data);
    }

    func constructSlotURI{
        syscall_ptr: felt*,
        pedersen_ptr: HashBuiltin*,
        bitwise_ptr: BitwiseBuiltin*,
        range_check_ptr,
        instance,
    }(slot: Uint256) -> (uri_len: felt, uri: felt*) {
        return (0, cast(0, felt*));
    }

    func constructTokenURI{
        syscall_ptr: felt*,
        pedersen_ptr: HashBuiltin*,
        bitwise_ptr: BitwiseBuiltin*,
        range_check_ptr,
        instance,
    }(tokenId: Uint256) -> (uri_len: felt, uri: felt*) {
        alloc_locals;

        let (decimals) = IERC3525.valueDecimals(instance);
        let (local decimals_str) = StringCodec.felt_to_string(decimals);
        let (value) = IERC3525.valueOf(instance, tokenId);
        let (local value_str) = StringCodec.felt_to_string(value.low);

        let (str) = StringCodec.ss_to_string('https://dev-carbonable-metadata');
        let (str) = append_ss(str, '.fly.dev/collection/1');
        let (str) = append_ss(str, '/token?value=');
        let (str) = StringUtil.concat(str, value_str);
        let (str) = append_ss(str, '&decimals=');
        let (str) = StringUtil.concat(str, decimals_str);

        return (str.len, str.data);
    }
}
