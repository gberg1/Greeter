pragma solidity ^0.4.11;

contract Greeter {
  string message;

  function Greeter() {
    message = "The ultimate greeting, hi hi hiya!";
  }

  function setGreeter(string _message) public {
    message = _message;
  }

  function getGreeter() constant returns (string) {
    return message;
  }
}
