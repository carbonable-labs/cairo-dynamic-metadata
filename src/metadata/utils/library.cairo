// SPDX-License-Identifier: MIT

%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin, BitwiseBuiltin

from cairopen.string.ASCII import StringCodec
from cairopen.string.string import String
from cairopen.string.utils import StringUtil

func append_ss{bitwise_ptr: BitwiseBuiltin*, range_check_ptr}(str: String, s: felt) -> (
    str: String
) {
    alloc_locals;
    let (tmp_str) = StringCodec.ss_to_string(s);
    let (res) = StringUtil.concat(str, tmp_str);
    return (str=res);
}
