// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const DeadMansSwitchModule = buildModule("DeadMansSwitchModule", (m) => {
  const deadMansSwitch = m.contract("DeadMansSwitch", [
    "0xa0Ee7A142d267C1f36714E4a8F75612F20a79720",
  ]);
  return { deadMansSwitch };
});

export default DeadMansSwitchModule;
