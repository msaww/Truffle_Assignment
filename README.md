# Working with Truffle
This repository provides the code and understanding necessary to begin using Truffle to create smart contracts, in sections, and refers to the videos from the following links:

Section 1 : [Installation & Contract Creation](https://youtu.be/ZaqAwOzEiQ8)<br />
Section 2 : [Migration & Deployement](https://youtu.be/TDDuLlOiYJ8)<br />
Section 3 : [Testing](https://youtu.be/YKJkcg_ycpM)<br />
Section 4 : [Further deployement](https://youtu.be/roHoOZXIxYs)


### Part 1
Part 1 of the tutorial involves installing the prerequisites needed to run and deploy a Truffle smart contract:
- NodeJS
- Truffle
- Ganache

### Part 2
Part 2 involves the creation of a simple smart contract called HelloWorld.
- This contract has a constructor which is used to initialize a string:
   ```
   constructor(string memory _message) {
       message = _message;
       owner = msg.sender;
   }
   ```
- The function *hello* returns the string initialized by the constructor:
  ```
  function hello() public view returns (string memory) {
      return message;
  }
  ```
- Finally, the function *setMessage* allows the user to change the value of the string:
  ```
  function setMessage(string memory _message) public payable {
      require(msg.value >= 1 ether);
      require(msg.sender == owner);
      message = _message;
  }
  ```

### Part 3
This part of the tutorial is focussed on writing unit tests for the smart contract.
- The first test checks if the *setMessage* function set the value of the string correctly:
  ```
  it("constructor should set the message correctly", async () => {
      let instance = await HelloWorld.deployed();
      let message = await instance.message();
      assert.equal(message, "Hello World constructor");
  });
  ```
- The second test ensures that the owner's address is equal to the first value of the accounts array:
  ```
  it("owner should be accounts[0]", async () => {
      let instance = await HelloWorld.deployed();
      let owner = await instance.owner();
      assert.equal(owner, accounts[0]);
  });
  ```

### Part 4
