/* const Tether = artifacts.require("Tether"); */
const Latam = artifacts.require("Latam");

module.exports = async function(deployer) {
  /* await deployer.deploy(Tether); */
  await deployer.deploy(Latam);
};
