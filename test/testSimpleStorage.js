const { ethers } = require("hardhat")
const { expect, assert } = require("chai")


describe("SimpleStorage", async function () {

    let SimpleStorageFactory, simpleStorage

    //测试之前，先部署合约
    this.beforeEach(async function () {
        SimpleStorageFactory = await ethers.getContractFactory("SimpleStorage")
        simpleStorage = await SimpleStorageFactory.deploy()
    })

    it("Should started with a favourate number of 0", async function () {
        const currentFavnum = await simpleStorage.retrive()
        const expectedFavnum = "0"
        assert.equal(currentFavnum.toString(), expectedFavnum)
        // expect(currentFavnum.toString()).to.equal(expectedFavnum)
    })

    it("Should updated to 7", async function () {
        const expectedNum = "7"
        const simpleStorageRespond = await simpleStorage.store(expectedNum)
        await simpleStorageRespond.wait(1)

        const updatedNum = await simpleStorage.retrive()
        assert.equal(updatedNum.toString(), expectedNum)
    })
})