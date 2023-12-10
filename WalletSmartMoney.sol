// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract WalletSmartMoney {
    uint256 public balanceReceived;

    function deposit() public payable {
        balanceReceived += msg.value;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function withdrawlAll() public {
        payable(msg.sender).transfer(getBalance());
    }

    function withdraw(address payable sentTo, uint256 amountSent) public {
        if (amountSent > 0) {
            sentTo.transfer(amountSent);
        }
    }
}
