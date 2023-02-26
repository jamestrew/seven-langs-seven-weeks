food_type(velveeta, cheese).
food_type(ritz, cracker).
food_type(spam, meat).
food_type(saugage, meat).
food_type(jolt, soda).
food_type(twinkie, dessert).

flavor(sweet, dessert).
flavor(sweet, soda).
flavor(savory, cheese).
flavor(savory, meat).

food_flavor(X, Y) :- food_type(X, Z), flavor(Y, Z).
