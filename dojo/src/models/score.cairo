use starknet::ContractAddress;

#[derive(Copy, Drop, Serde)]
#[dojo::model]
struct Score{  
#[key] assistantId: felt252,
#[key] player: ContractAddress,
points: u32
}