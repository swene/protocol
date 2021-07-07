pragma solidity >=0.5.0 <0.8.0;

import "AggregatorV3Interface.sol";

abstract contract LivePrice {

    AggregatorV3Interface internal priceFeed;

    /**
     * Network: Binance Smart Chain MainNet
     * Aggregator: BNB/USD
     * Address: 0x0567F2323251f0Aab15c8dFb1967E4e8A7D42aeE

     * Network: Binance Smart Chain TestNet
     * Aggregator: BNB/USD
     * Address: 0x2514895c72f50D8bd4B4F9b1110F0D6bD2c97526
     */
    constructor() {
        priceFeed = AggregatorV3Interface(0x0567F2323251f0Aab15c8dFb1967E4e8A7D42aeE);
    }

    /**
     * Returns the latest price
     */
    function getLatestPrice() public view returns (uint) {
        (
            ,
            int price,
            ,
            uint timeStamp,

        ) = priceFeed.latestRoundData();
        // If the round is not complete yet, timestamp is 0
        require(timeStamp > 0, "Round not complete");
        require(price > 0, "Price calculation error");
        return uint(price);
    }
}
