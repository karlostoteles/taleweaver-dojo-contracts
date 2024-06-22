use taleweaver::models::decision::Decision;
use starknet::ContractAddress;

// define the interface
#[starknet::interface]
trait ISelect<TContractState> {
    fn selectOption(self: @TContractState, assistantIdP:felt252, threadIdP:felt252, runIdP:felt252, cidAP:felt252, cidBP:felt252);
}

// dojo decorator
#[dojo::contract]
mod decision {    
    use starknet::{ContractAddress, get_caller_address};
    use taleweaver::models::{decision::Decision};

    use super::ISelect;

    #[abi(embed_v0)]
    impl SelectImpl of ISelect<ContractState> {
        fn selectOption(self: @ContractState, assistantIdP:felt252, threadIdP:felt252, runIdP:felt252, cidAP:felt252,cidBP:felt252) {

            let world = self.world_dispatcher.read(); 

            // Get the address of the current caller, possibly the player's address.
            let mut player = get_caller_address();

            let mut decisionTmp = Decision {
                assistantId: assistantIdP,
                threadId: threadIdP,                
                player: player,
                runId: runIdP,
                cidA: cidAP,
                cidB: cidBP
            };
            set!(world, (decisionTmp));
        }
    }
 
}
