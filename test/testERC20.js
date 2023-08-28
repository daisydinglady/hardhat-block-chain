const { assert } = require("chai")
const { ethers } = require("hardhat")


describe("ERC20", async function () {
    let erc20Factory, erc20

    beforeEach(async function () {
        erc20Factory = await ethers.getContractFactory("ERC20")
        erc20 = await erc20Factory.deploy("WTF", "WTF")
        // await erc20.waitForDeployment()
    })

    it("Require balance equal 100", async function () {
        const [deployer] = await ethers.getSigners()
        const expectBalance = "100"
        await erc20.mint("100")
        const result = await erc20.balanceOf(deployer)
        assert.equal(expectBalance, result)
    })
})