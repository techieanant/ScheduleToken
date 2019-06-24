const ScheduleToken = artifacts.require("./ScheduleToken.sol");

module.exports = async function(deployer) {
  await deployer.deploy(ScheduleToken, "ScheduleToken", "ScheduleToken")
  const erc721 = await ScheduleToken.deployed()
};
