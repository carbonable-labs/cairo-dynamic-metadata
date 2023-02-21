%lang starknet

from starkware.cairo.common.bool import TRUE
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.uint256 import Uint256

from openzeppelin.introspection.erc165.IERC165 import IERC165
from openzeppelin.token.erc721.enumerable.IERC721Enumerable import IERC721Enumerable
from openzeppelin.token.erc721.IERC721 import IERC721
from openzeppelin.token.erc721.IERC721Metadata import IERC721Metadata

from erc3525.IERC3525Full import IERC3525Full as IERC3525
from erc3525.IERC3525Metadata import IERC3525Metadata

//
// Constants
//

const NAME = 'Carbonable Project';
const SYMBOL = 'CP';
const DECIMALS = 18;

//
// TESTS
//

@external
func __setup__() {
    %{
        context.erc3525_contract = deploy_contract("./src/metadata/examples/ERC3525MetadataOnchain.cairo", 
            [ids.NAME, ids.SYMBOL, ids.DECIMALS]).contract_address
    %}
    return ();
}

@external
func test_initialized_metadata{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() {
    alloc_locals;
    let (local erc3525_contract) = contract_access.deployed();
    let (name) = IERC721Metadata.name(erc3525_contract);
    let (symbol) = IERC721Metadata.symbol(erc3525_contract);
    let (decimals) = IERC3525.valueDecimals(erc3525_contract);

    assert NAME = name;
    assert SYMBOL = symbol;
    assert DECIMALS = decimals;

    let (erc3525_contract) = contract_access.deployed();
    let (_) = IERC3525.mintNew(erc3525_contract, 1, Uint256(1, 0), Uint256(42, 0));  // #01

    let (uri_len, uri) = IERC3525.tokenURI(erc3525_contract, Uint256(1, 0));
    %{
        import json
        uri = [memory[ids.uri + i] for i in range(ids.uri_len)]
        data = "".join(map(chr,uri))
        data = data.split("json,")
        assert len(data) == 2
        data = data[1]
        json_data = json.loads(data)
        image_data = json_data['image_data'].split("xml,")[1]
        assert image_data[:5] == '<?xml'
        assert image_data[-6:] == '</svg>'
    %}
    return ();
}

namespace contract_access {
    func deployed() -> (address: felt) {
        tempvar erc3525_contract;
        %{ ids.erc3525_contract = context.erc3525_contract %}
        return (address=erc3525_contract);
    }
}
