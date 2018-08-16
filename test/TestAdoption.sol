pragma solidity ^0.4.17;

import 'truffle/Assert.sol';
import 'truffle/DeployedAddresses.sol';
import '../contracts/Adoption.sol';

contract TestAdoption {
  Adoption adoption = Adoption(DeployedAddresses.Adoption());

  function testUserCanAdoptPet() public {
    uint returnedId = adoption.adopt(8);
    Assert.equal(returnedId, 8, 'Adoption of pet Id shoudl be 8.');
  }

  function testGetAdopterAddressByPetId() public {
    Assert.equal(adoption.adopters(8), this, 'Owner of pet Id 8 should be recorded.');
  }

  function testGetAdopterAddressByPetIdInArray() public {
    address expected = this;
    address[16] memory adopters = adoption.getAdopters();
    Assert.equal(adopters[8], expected, 'Owner of pet Id 8 should be recorded.');
  }
}
