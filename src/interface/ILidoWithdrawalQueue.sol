// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

interface ILidoWithdrawalQueue {
    function requestWithdrawals(uint256[] calldata _amounts, address _owner)
        external
        returns (uint256[] memory requestIds);

    function claimWithdrawals(uint256[] calldata _requestIds, uint256[] calldata _hints) external;
}

/// @notice structure representing a request for withdrawal
struct WithdrawalRequest {
    /// @notice sum of the all stETH submitted for withdrawals including this request
    uint128 cumulativeStETH;
    /// @notice sum of the all shares locked for withdrawal including this request
    uint128 cumulativeShares;
    /// @notice address that can claim or transfer the request
    address owner;
    /// @notice block.timestamp when the request was created
    uint40 timestamp;
    /// @notice flag if the request was claimed
    bool claimed;
    /// @notice timestamp of last oracle report for this request
    uint40 reportTimestamp;
}
