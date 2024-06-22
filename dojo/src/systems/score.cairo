use taleweaver::models::score::Score;
use starknet::ContractAddress;

// define the interface
#[starknet::interface]
trait ISavePoints<TContractState> {
    fn save_points(self: @TContractState, assistantIdP:felt252, points:u32);
}

// dojo decorator
#[dojo::contract]
mod score {    
    use starknet::{ContractAddress, get_caller_address};
    use taleweaver::models::{score::Score};

    use super::ISavePoints;

    #[abi(embed_v0)]
    impl SavePointsImpl of ISavePoints<ContractState> {
        fn save_points(self: @ContractState, assistantIdP:felt252, points:u32) {

            let world = self.world_dispatcher.read(); 

            // Get the address of the current caller, possibly the player's address.
            let mut player = get_caller_address();

            let mut scoreTmp = Score {
                assistantId: assistantIdP,               
                player: player,
                points: points
            };
            set!(world, (scoreTmp));
        }
    }
 
}
