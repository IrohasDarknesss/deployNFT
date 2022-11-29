// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SampleContract{
    uint private count = 0;
    string public publicData = "public Data";

    function hello() public pure returns (string memory){
        return "Hello Solidity!!";
    }

    function getCount() public view returns(uint256){
        return count;
    }

    function countUp() public {
        count ++;
    }
}