local kosmos = require("kosmos")
-- Creates a component type with one field called 'x' which must have a type of 'table'
local my_comp = kosmos.components("my_comp", {x = "table"})
-- This should obtain the type that was just created through its id
local my_comp_again = kosmos.components("my_comp")
-- Creates a component of type 'my_comp'
local my_comp_value = my_comp_again{x = {}}
-- Creates another component type that contains an element of type 'my_comp'
local my_comp_2 = kosmos.components("my_comp_2", {x = "my_comp"})
-- Creates a component of type 'my_comp_2'
local my_comp_2_value = my_comp_2{x = my_comp_value}

local string_wrapper = kosmos.components("string_wrapper", {c = "string"})

kosmos.entities:spawn({string_wrapper{c = "hi"}, my_comp_value, my_comp_2_value})
kosmos.entities:spawn({string_wrapper{c = "hi"}})

print(kosmos.query{"my_comp_2", "my_comp"})