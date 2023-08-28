# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a script that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```

#待解决问题
1、如何指定hardhat提供的虚拟钱包进行测试？  
   const accounts = await ethers.getSingers();
   const fac = await ethers.getContractFactory("xxx"); 
   const con = await fac.connect(accounts[0]).deploy();

#2、erc20代币水龙头的领取没有测试完成

3、task没有添加参数成功

#20230825
#获取当前合约的gas花费情况
1、安装hardhat-gas-reporter插件
2、在hardhat.config.js中配置gasReporter
3、可配置coinmarketcap，在官网https://pro.coinmarketcap.com/api注册账号，并获取秘钥，获取货币的实时或历史价格

