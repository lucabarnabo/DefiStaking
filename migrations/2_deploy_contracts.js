const Tether = artifacts.require("Tether");
const Latam = artifacts.require("Latam");
const DescentralBank = artifacts.require("DescentralBank");

module.exports = async function(deployer) {
  await deployer.deploy(Tether);
  await deployer.deploy(Latam);
  await deployer.deploy(DescentralBank);
};
