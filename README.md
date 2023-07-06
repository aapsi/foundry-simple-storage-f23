(1) To deploy a smart contract using ganache
-> add network in metamask as localhost with rpc url from ganache and also the chain id.
-> use a dummy address and private keys and import the account to metamask.
-> go to terminal and type
    forge create SimpleStorage --interactive
-> now enter the private key  

(2) To deploy using anvil
-> type in terminal:
    anvil
-> now copy a private key from the given keys
-> open another bash and type:
    forge create SimpleStorage --interactive
-> now enter the private key that was copied before
-> another way of doing it:
    forge create SimpleStorage --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 
    -> this method is bad as we are revealing our private key
    -> to remove private kry from command history of bash: 
        history -c   

(3) to deploy contracts through anvil
    -> create a script in script folder
    -> run the script :
        forge script script/DeploySimpleStorage.s.sol 
        -> we didnt mention any rpc url so where did it actually run, it was by default run on a temporary anvil chain
    -> OR (hear we almost deployed it to a blockchain (simulation))
        forge script script/DeploySimpleStorage.s.sol --rpc-url http://127.0
.0.1:8545
    -> actually deploying it to a blockchain
        forge script script/DeploySimpleStorage.s.sol --rpc-url http://127.0.0.1:8545 --broadcast --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
-> we can check our transaction in broadcast folder


-> converting hex to dec:
    cast --to-base 0x714c2 dec
    -> cast is built in function in foundry

-> in the transaction we have nonce and using this we can count out transactions and also replay our txns usin this same nonce.


INTERACTING WITH THE CONTRACT USING CLI

->create a .env filee
->store private key and rpc_url in it
-> in bash:
    source .env
    echo $PRIVATE_KEY
    -> now instead of typing in your private key or rpc url do this
    ->forge script script/DeploySimpleStorage.s.sol --rpc-url $RPC_URL --broadcast --private-key $PRIVATE_KEY

***ERROR IN .env FILE, WHAT TO DO?***
error:
$ source .env
PRIVATE_KEY: command not found
RPC_URL: command not found

solution:

The error message you're encountering suggests that the shell is treating the lines in your .env file as commands rather than environment variable assignments. To resolve this issue, you need to modify the format of your .env file.

The .env file should consist of key-value pairs, where each key-value pair is on a separate line and follows the format KEY=VALUE. Additionally, there should be no spaces surrounding the equal sign.

Here's the corrected version of your .env file:

PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
RPC_URL=http://127.0.0.1:8545

->you can pass encrypted key instead of exposing keys
    -> forge script --help
    -> look into wallet options -keystore


***Important***
For the moment, a `$PRIVATE_KEY` in my `.env` file is cool, so long as I dont expose the `.env` file.

But for real money, I wont do that. I will use `--interactive` or a keystore file with a password once foundry adds that.

***other options to keep keys safe***
dapptools-> ethsign
