const { task } = require("hardhat/config")

// task("test", "test", async () => { })
task("block-number", "Prints current block number.").setAction(
    // async function a() { }
    async (taskArgs) => {
        const blockNumber = await ethers.provider.getBlockNumber()
        console.log(`Current block number: ${blockNumber}`);
    }
)



