pragma solidity ^0.4.23;

import "../node_modules/zeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";
import "../node_modules/zeppelin-solidity/contracts/ownership/Ownable.sol";

contract ScheduleToken is ERC721Token, Ownable {
    constructor (string _name, string _symbol) public
        ERC721Token(_name, _symbol)
    {
    }
    mapping(uint => address) public availableTime;

    function mintScheduleToken(
        address _to,
        uint256 _tokenId
    ) public onlyOwner
    {
        super._mint(_to, _tokenId);
    }

    function scheduleAppointment(
        uint256 _tokenId,
        uint timeslot
    ) public
    {
        require(timeslot > 900 && timeslot < 1700, "Can only schedule between 9 AM and 5 PM");
        require(availableTime[timeslot] == address(0x0), "Timeslot not available");
        super._burn(msg.sender, _tokenId);
        availableTime[timeslot] = msg.sender;
    }

    function getAppointment(
        uint timeslot
    ) public view onlyOwner
    returns (address)
    {
        return availableTime[timeslot];
    }
}