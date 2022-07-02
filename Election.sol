// SPDX-License-Identifier: GPL-3.0

pragma solidity  0.8.14;  

contract Election{

struct Candidate{

  uint id;
  string name;
  uint voteCount;
}
  mapping(uint => Candidate) public candidates;
  mapping(address => bool) public voters;
  uint public candidatesCount; 

  event votedEvent (uint indexed _candidateId);

  constructor() {

      addCandidate("Candidate 1");
      addCandidate("Candidate 2");
  }

  function addCandidate(string memory _name) private{
      candidatesCount++;
      candidates[candidatesCount] = Candidate(candidatesCount,_name,0);
  }
  
   
 
  function vote(uint _candidateId) public  {

        require(!voters[msg.sender],"A voter can vote only once");
        require(_candidateId > 0 && _candidateId <= candidatesCount,"There are only 2 candidates");

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;
        emit votedEvent(_candidateId);
    }

}
