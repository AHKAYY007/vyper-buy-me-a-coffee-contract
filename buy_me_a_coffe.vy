# pragma version 0.4.0
# @license: MIT

# This contract should be able to do:
# 1. Get funds from users.
# 2. Withdraw funds.
# 3. Set a minimum value in USD.

interface AggregatorV3Interface:
    def decimals() -> uint8: view
    def description() -> String[1000]: view
    def version() -> uint256: view
    def latestAnswer() -> int256: view


MINIMUM_USD: uint256

@deploy
def __init__():
    self.MINIMUM_USD = 5

@external
@payable
def fund():
    assert msg.value >= self.MINIMUM_USD, 'not enough ETH'

@internal
def _eth_to_usd_rate():
    pass

@external
def get_price():
    price_feed: AggregatorV3Interface = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
    return price_feed.latestAnswer()