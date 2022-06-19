const hre = require('hardhat');
const ethers = hre.ethers;
//deployment file

async function main() {
   const VehicleMapping = await ethers.getContractFactory('VehicleMapping');
   const vehicleMapping = await VehicleMapping.deploy();
   await vehicleMapping.deployed();
   console.log('VehicleMapping deployed to:', vehicleMapping.address);
   const VehicleNFT = await hre.ethers.getContractFactory('VehicleNFT');
   const vehiclenft = await VehicleNFT.deploy(vehicleMapping.address, 'License PLate','LP');
 
   await vehiclenft.deployed();
 
   console.log('Vehicle NFT Contract deployed to:', vehiclenft.address);
}
  
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
