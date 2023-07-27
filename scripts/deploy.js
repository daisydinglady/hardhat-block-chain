const { Log } = require("ethers")
const { ethers, run, network } = require("hardhat")
const { networkInterfaces } = require("os")
const hardhatConfig = require("../hardhat.config")


async function main() {
    // const [account1] = await ethers.getSigners()
    // const SimpleStorageFactory = await ethers.getContractFactory("SimpleStorage", account1)
    const SimpleStorageFactory = await ethers.getContractFactory("SimpleStorage")
    console.log("Begin to deploy contract...")
    const simpleStorage = await SimpleStorageFactory.deploy()
    await simpleStorage.waitForDeployment()
    // console.log(`Current deploy address: ${await account1.getAddress()}`)
    console.log(`Current contract address: ${await simpleStorage.getAddress()}`)
    // vetify contracr
    // console.log(`network.config.chainId: ${network.config.chainId}`);
    if (network.config.chainId === 5 && process.env.ETHERSCAN_API_KEY) {
        console.log("Waiting for blok confirmations...");
        await simpleStorage.deploymentTransaction().wait(2)
        await verify(await simpleStorage.getAddress(), [])
    }
    const currentFavnum = await simpleStorage.retrive()
    console.log(`currentFavnum: ${currentFavnum}`)
    const transactionRespond = await simpleStorage.store(3)  //需要等待至少一个block确认该交易？
    await transactionRespond.wait(1)
    const updatedFavnum = await simpleStorage.retrive()
    console.log(`updatedFavnum: ${updatedFavnum}`)
}

async function verify(contractAddress, args) {
    console.log("verify contract....")
    //防止出错终端，加个try...catch
    try {
        await run("verify:verify", {
            address: contractAddress,
            constructorArguments: args
        })
    } catch (e) {
        console.log("Error:", e);
    }
}

main().then(() => { process.exit(1) })
    .catch((error) => {
        console.log(error)
        process.exit(1)
    })



