Deploying and interacting with an ethereum smart contract in a test environment using truffle and testrpc.

Truffle simplifies the build and deployment process of smart contracts. Truffle can manage the deployment cycle and check if a deployment is required or not based on the version of the last deployment, while offering a console to interact with the smart contract from a high level abstraction. Note if your smart contract has changed and you want to redeploy it you can do so with:

`truffle migrate --reset`

To run the following truffle commands in a test environment we will want to have testrpc running in a separate tab from the commands we will run that are listed below.

`testrpc`

Make sure to leave that running and open a new tab. We will initialize truffle and use the truffle console to interact with our Greeter smart contract.

`truffle init`

`truffle console`

Many methods such as the deployed method in truffle run asynchronously so we use a promise to deploy the Greeter smart contract via:

`Greeter.deployed().then(function(instance){app = instance})`

Once we get the deployed instance of the Greeter smart contract we assign to an external variable app.
To access the app instance run:

`app`

Truffle creates a high level abstraction of our contract instance. The high level abstraction is configured based on the JSON file created by truffle that can be found at build/contracts/Greeter.json.

We can interact with our smart contracts via the app object that we just initialized using it to call the functions that our smart contract exposes.

Because we are calling a constant function we will use the call() method to execute the getGreeter function. Calling a function declared as a constant does not allow it to modify the blockchain in any way so we don't need to send any information such as the sender. We are simply checking the state of the network.

`app.getGreeter.call()`

To modify the state of the network in our example change the message of our Greeter smart contract we can call the setGreeter function that we declared in our Greeter.sol file. This time there will be a transaction and we are modifying the state on the network so we much specify the account where the transaction is coming from. Note we already have access to web3 in the truffle console. From our truffle init command we ran at the beginning

`app.setGreeter("Yo! This da best greeting!", {from: web3.eth.accounts[0]})`

To check that the state was successfully updated to "Yo! This da best greeting!" we can use the getGreeter method again.

`app.getGreeter.call()`

To exit the truffle console run:

`.exit`

or Ctrl + c
