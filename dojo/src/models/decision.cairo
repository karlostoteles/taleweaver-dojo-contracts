use starknet::ContractAddress;

#[derive(Copy, Drop, Serde)]
#[dojo::model]
struct Decision{  
#[key] assistantId: felt252,
#[key] threadId: felt252,
#[key] player: ContractAddress,
runId: felt252,
cidA: felt252,
cidB: felt252
}