# Working with Truffle
This repository provides the code and understanding necessary to begin using Truffle to create smart contracts, in sections, and refers to the videos from the following links:

Section 1 : [Installation & Contract Creation](https://youtu.be/ZaqAwOzEiQ8)<br />
Section 2 : [Migration & Deployement](https://youtu.be/TDDuLlOiYJ8)<br />
Section 3 : [Testing](https://youtu.be/YKJkcg_ycpM)<br />
Section 4 : [Further deployement](https://youtu.be/roHoOZXIxYs)


### Section 1
-Installing the requirements required to launch and execute a Truffle smart contract is covered in Section 1 of the tutorial:
NodeJS & Truffle
   ``` npm install truffle -g ```

-To initialize the contract we use   ``` truffle init ``` command.
Once the folders are created, the contract folder includes all of our smart contracts, the migration folder contains the deployment suites, the test folder includes the test suites.<br \>
Migration.sol contract is built by Truffle to keep track of which contracts were deployed in last migration and which will run further.

-We first start with creating a new simple smart contract 'HelloWorld.sol'.<br \>
To compile : ``` truffle comile ```


### Section 2
-For migration, we create '2_hello_world_migration'.<br \>
To migrate : ``` truffle migrate ```<br \>
To connect to loacl instance, run develop command first and then run trufffle migrate.<br \>
To deploy  : ``` truffle deploy ```

-We now create a advanced migration scripts and some scenarios we run into while deploying contracts and work with constructors.
-We add a constructor to HelloWorld to initialize a string:
 ```
   constructor(string memory _message) {
       message = _message;
       owner = msg.sender;
   }
   ```
- The function 'hello' in HelloWorld returns the string initialized by the constructor:
  ```
  function hello() public view returns (string memory) {
      return message;
  }
  ```
- Lastly, the function 'setMessage' allows the user to change the value of the string:
  ```
  function setMessage(string memory _message) public payable {
      require(msg.value >= 1 ether);
      require(msg.sender == owner);
      message = _message;
  }
  ```
-We use ``` let instance = await HelloWorld.deployed() ``` and then ```instance.message()``` to get the output

-Further also different deployement methods using constructors are discussed.

### Section 3
This section puts focus on writing unit tests for the smart contract.
- First, we confirm that the string's value was appropriately set using the'setMessage' function:
  ```
  it("constructor should set the message correctly", async () => {
      let instance = await HelloWorld.deployed();
      let message = await instance.message();
      assert.equal(message, "Hello World constructor");
  });
  ```
- Second, we make sure that the owner's address corresponds to the account's array's initial value:
  ```
  it("owner should be accounts[0]", async () => {
      let instance = await HelloWorld.deployed();
      let owner = await instance.owner();
      assert.equal(owner, accounts[0]);
  });
  ```

### Part 4
