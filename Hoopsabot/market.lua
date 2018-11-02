ret = {}
ret[1] = {
  name = "Market Coins to 2 Credits",
  sellers = {bot = math.huge},
  price = 15,
  item = {type = "cur", item = "coins", count = 2}
}
ret[2] = {
  name = "Market Coins to 14 Credits",
  sellers = {bot = math.huge},
  price = 100,
  item = {type = "cur", item = "coins", count = 14}
}
ret[3] = {
  name = "Market Coins to Gems",
  sellers = {bot = math.huge},
  price = 1500,
  item = {type = "cur", item = "gems", count = 1}
}
ret[4] = {
  name = "Points to Credits",
  sellers = {bot = math.huge},
  price = {item = "points", count = 100},
  item = {type = "cur", item = "coins", count = 1}
}
ret[5] = {
  name = "Points to 10 Credits",
  sellers = {bot = math.huge},
  price = {item = "points", count = 1000},
  item = {type = "cur", item = "coins", count = 10}
}
ret[6] = {
  name = "Points to 25 Credits",
  sellers = {bot = math.huge},
  price = {item = "points", count = 2500},
  item = {type = "cur", item = "coins", count = 25}
}
ret[7] = {
  name = "Points to 50 Credits",
  sellers = {bot = math.huge},
  price = {item = "points", count = 5000},
  item = {type = "cur", item = "coins", count = 50}
}
ret[8] = {
  name = "Market Coins to Gun",
  sellers = {bot = math.huge},
  price = 300,
  item = {type = "item", item = {name="Gun",atk=3,def=0, range=3}}
}
return ret
