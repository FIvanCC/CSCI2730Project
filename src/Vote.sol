// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Vote {
    address public owner;
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    struct Voter {
        bool isVoted;
        uint voteTo;
    }

    mapping(address => Voter) public voters;
    mapping(uint => Candidate) public candidates;
    uint public totalCandidates;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can use this function");
        _;
    }
    modifier notOwner() {
        require(msg.sender != owner, "The owner cant use this function");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function addCandidate(string memory _name) public onlyOwner {
        totalCandidates += 1;
        candidates[totalCandidates] = Candidate(totalCandidates, _name, 0);
    }

    function vote(uint _voteIndex) public notOwner {
        require(!voters[msg.sender].isVoted, "Voter voted.");

        voters[msg.sender].voteTo = _voteIndex;
        voters[msg.sender].isVoted = true;

        candidates[_voteIndex].voteCount += 1;
    }
}
