use starknet::ContractAddress;

#[derive(Copy, Drop, Serde)]
#[dojo::model]
struct Seed{  
#[key] assistantId: felt252,
creator: ContractAddress,
cidA: felt252,
cidB: felt252   
}