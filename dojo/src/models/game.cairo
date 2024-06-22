use starknet::ContractAddress;

#[derive(Copy, Drop, Serde)]
#[dojo::model]
struct Game{  
#[key] id: u32,
#[key] seed_id: u32,
player_id: ContractAddress,  
avatar_id: u32,
counter: u64 
}
