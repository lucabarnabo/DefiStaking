const Tether = artifacts.require("Tether");
const Latam = artifacts.require("Latam");
const DescentralBank = artifacts.require("DescentralBank");

module.exports = async function(deployer, network, accounts) {
  await deployer.deploy(Tether);

  await deployer.deploy(Latam);
  const latam = await Latam.deployed();
  await deployer.deploy(DescentralBank);
};
