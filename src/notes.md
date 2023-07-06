To deploy a smart contract using ganache
-> add network in metamask as localhost with rpc url from ganache and also the chain id.
-> use a dummy address and private keys and import the account to metamask.
-> go to terminal and type
    forge create SimpleStorage --interactive
-> now enter the private key  

To deploy using anvil
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