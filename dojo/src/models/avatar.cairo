use starknet::ContractAddress;

#[derive(Copy, Drop, Serde)]
#[dojo::model]
struct Avatar{  
 #[key] assistantId: felt252,   
 #[key]name: felt252,  
 alias: felt252,
 descriptionA: felt252,
 descriptionB: felt252
}