


 SPDX-License-Identifier MIT
pragma solidity ^0.8.0;

import @openzeppelincontractstokenERC20ERC20.sol;
import @openzeppelincontractsaccessOwnable.sol;

interface IUniswapV2Factory {
    event PairCreated(address indexed token0, address indexed token1, address pair, uint);

    function feeTo() external view returns (address);
    function feeToSetter() external view returns (address);

    function getPair(address tokenA, address tokenB) external view returns (address pair);
    function allPairs(uint) external view returns (address pair);
    function allPairsLength() external view returns (uint);

    function createPair(address tokenA, address tokenB) external returns (address pair);

    function setFeeTo(address) external;
    function setFeeToSetter(address) external;
}


 pragma solidity =0.5.0;

interface IUniswapV2Pair {
    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);

    function name() external pure returns (string memory);
    function symbol() external pure returns (string memory);
    function decimals() external pure returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);

    function DOMAIN_SEPARATOR() external view returns (bytes32);
    function PERMIT_TYPEHASH() external pure returns (bytes32);
    function nonces(address owner) external view returns (uint);

    function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;

    event Mint(address indexed sender, uint amount0, uint amount1);
    event Burn(address indexed sender, uint amount0, uint amount1, address indexed to);
    event Swap(
        address indexed sender,
        uint amount0In,
        uint amount1In,
        uint amount0Out,
        uint amount1Out,
        address indexed to
    );
    event Sync(uint112 reserve0, uint112 reserve1);

    function MINIMUM_LIQUIDITY() external pure returns (uint);
    function factory() external view returns (address);
    function token0() external view returns (address);
    function token1() external view returns (address);
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
    function price0CumulativeLast() external view returns (uint);
    function price1CumulativeLast() external view returns (uint);
    function kLast() external view returns (uint);

    function mint(address to) external returns (uint liquidity);
    function burn(address to) external returns (uint amount0, uint amount1);
    function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data) external;
    function skim(address to) external;
    function sync() external;

    function initialize(address, address) external;
}

 pragma solidity =0.6.2;

interface IUniswapV2Router01 {
    function factory() external pure returns (address);
    function WETH() external pure returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);
    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETHWithPermit(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountToken, uint amountETH);
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);
    function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);

    function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
}



 pragma solidity =0.6.2;

interface IUniswapV2Router02 is IUniswapV2Router01 {
    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountETH);
    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountETH);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable;
    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
}

interface IMasterChef {
    
    function pendingCake(uint256 _pid, address _user) external view returns (uint256);
    
     Stake CAKE tokens to MasterChef
    function enterStaking(uint256 _amount) external;

     Withdraw CAKE tokens from STAKING.
    function leaveStaking(uint256 _amount) external;
}

contract MasterChef is IMasterChef {
    
     Info of each user.
    struct UserInfo {
        uint256 amount;      How many LP tokens the user has provided.
        uint256 rewardDebt;  Reward debt. See explanation below.
        
         We do some fancy math here. Basically, any point in time, the amount of CAKEs
         entitled to a user but is pending to be distributed is
        
           pending reward = (user.amount  pool.accCakePerShare) - user.rewardDebt
        
         Whenever a user deposits or withdraws LP tokens to a pool. Here's what happens
           1. The pool's `accCakePerShare` (and `lastRewardBlock`) gets updated.
           2. User receives the pending reward sent to hisher address.
           3. User's `amount` gets updated.
           4. User's `rewardDebt` gets updated.
    }
    
     Info of each user that stakes LP tokens.
    mapping (uint256 = mapping (address = UserInfo)) public userInfo;
    
    function pendingCake(uint256 _pid, address _user) external view override returns (uint256)  {
        return 1;
    }
    
     Stake CAKE tokens to MasterChef
    function enterStaking(uint256 _amount) external override {
        
    }

     Withdraw CAKE tokens from STAKING.
    function leaveStaking(uint256 _amount) external override {
        
    }
}

library IterableMapping {
     Iterable mapping from address to uint;
    struct Map {
        address[] keys;
        mapping(address = uint) values;
        mapping(address = uint) indexOf;
        mapping(address = bool) inserted;
        uint256 totalValues;
    }

    function get(Map storage map, address key) public view returns (uint) {
        return map.values[key];
    }

    function getIndexOfKey(Map storage map, address key) public view returns (int) {
        if(!map.inserted[key]) {
            return -1;
        }
        return int(map.indexOf[key]);
    }

    function getKeyAtIndex(Map storage map, uint index) public view returns (address) {
        return map.keys[index];
    }


    function size(Map storage map) public view returns (uint) {
        return map.keys.length;
    }

    function set(Map storage map, address key, uint val) public {
        if (map.inserted[key]) {
            uint256 currentValue = map.values[key];
            if(currentValue  val) {
                map.totalValues += val - currentValue;
            } else {
                map.totalValues -= currentValue - val;
            }
            map.values[key] = val;
        } else {
            map.inserted[key] = true;
            map.values[key] = val;
            map.indexOf[key] = map.keys.length;
            map.keys.push(key);
            map.totalValues += val;
        }
    }

    function remove(Map storage map, address key) public {
        if (!map.inserted[key]) {
            return;
        }

        map.totalValues -= map.values[key];
        delete map.inserted[key];
        delete map.values[key];

        uint index = map.indexOf[key];
        uint lastIndex = map.keys.length - 1;
        address lastKey = map.keys[lastIndex];

        map.indexOf[lastKey] = index;
        delete map.indexOf[key];

        map.keys[index] = lastKey;
        map.keys.pop();
    }
}


contract SteakBot is ERC20, Ownable  {
    
    using IterableMapping for IterableMapping.Map;
    
    address manualCake = 0x73feaa1eE314F8c655E354234017bE2193C9E24E;
    address cake = 0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82;
    address marketingAddress = 0x2da3BD3Df711D0C257F7f318E2e29B068Ae8285A;
    IUniswapV2Router02 public immutable uniswapV2Router;
    address public immutable uniswapV2Pair;
    uint256 private numTokensSellToreachThreshold = 10000000  1018;
    bool inSwapAndLiquify;
    address public stakingToken;
    bool public swapAndLiquifyEnabled = false;
    bool private swapAndLiquifyPaused = false;
    uint public fee = 10;
    uint256 public maxWallet = 10000000  109;  Max Wallet 10 Million 
    uint cakePercent = 60;
    uint liquidityPercent = 30;
    uint marketingPercent = 10;
    uint distributionPercent = 5;
    
    IterableMapping.Map private tokenHoldersMap;
    
    uint256 daysToDistribute = 31 days;
    uint256 hodlDays = 15;
    uint256 minHodlAmount = 10000  109;
    uint256 lastDistribution;
    uint256 public lastProcessedIndex;
    
    uint256 private amountToBeDistributed;
    uint256 private valueOfCakeToHolderToken;
    
    
    mapping(address = bool) feeDisabled;
    mapping(address = bool) rewardsDisabled;
    mapping(address = uint256) hodlStartDate;
    
    uint256 rescueUnlock;
    mapping(address = bool) lockedDevs;
    uint lockedDevCount;
    uint devUnlock;
    
    
    event SwapAndLiquify(
        uint256 tokensSwapped,
        uint256 ethReceived,
        uint256 tokensIntoLiqudity
    );
    
    modifier lockTheSwap {
        inSwapAndLiquify = true;
        _;
        inSwapAndLiquify = false;
    }
    
    constructor() ERC20(SeakBot Prime, SB) Ownable() {
        _mint(msg.sender, 100000000109);
        IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(0x10ED43C718714eb63d5aA57B78B54704E256024E);
        uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory())
            .createPair(address(this), _uniswapV2Router.WETH());
        uniswapV2Router = _uniswapV2Router;
        lastDistribution = block.timestamp;
        rescueUnlock = block.timestamp + 365 days;
        devUnlock = block.timestamp + 365 days;
    }
    
    function decimals() public view override returns (uint8) {
        return 9;
    }
    
    function setIsSwapAndLiquify(bool active) public onlyOwner {
        swapAndLiquifyEnabled = active;
    }
    
    function setMarketingAddress(address newAddress) public onlyOwner {
        marketingAddress = newAddress;
    }
    
    function setFeesStatus(address user, bool disabled)   public onlyOwner {
        feeDisabled[user] = disabled;
    }
    
    function setRewardStatus(address user, bool disabled)  public onlyOwner {
        rewardsDisabled[user] = disabled;
        uint256 balance = balanceOf(user);
        if(disabled && balance = minHodlAmount) {
            tokenHoldersMap.remove(user);
        } else if(!disabled && balance = minHodlAmount) {
            tokenHoldersMap.set(user, balance);
        }
    }
    
    Incase the manualCake addressChanges;
    function setManualCake(address _manualCake) public onlyOwner {
        manualCake = _manualCake;
    }
    
    function deposit(uint256 amount) internal {
        MasterChef(manualCake).enterStaking(amount);
    }
    
    function withdraw(uint256 amount) internal {
        MasterChef(manualCake).leaveStaking(amount);
    }
    
    function addNewCakeToPool() public {
        uint256 pendingRewards = MasterChef(manualCake).pendingCake(0, address(this));
        uint256 balance = ERC20(cake).balanceOf(address(this));
         approve token transfer to cover all possible scenarios
        _approve(address(this), manualCake, balance);
        deposit(pendingRewards + balance);
    }
    
    function swapEthForTokens(uint256 ethAmount, address tokenAddress, address receiver) private returns (bool){
         generate the uniswap pair path of weth - token
        address[] memory path = new address[](2);
        path[0] = uniswapV2Router.WETH();
        path[1] = tokenAddress;

         make the swap
        uniswapV2Router.swapExactETHForTokensSupportingFeeOnTransferTokens{value ethAmount}(
            0,  accept any amount of ETH
            path,
            receiver,
            block.timestamp
        );
        return true;
    }
    
    function swapTokensForEth(uint256 tokenAmount) private {
         generate the uniswap pair path of token - weth
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = uniswapV2Router.WETH();

        _approve(address(this), address(uniswapV2Router), tokenAmount);

         make the swap
        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            tokenAmount,
            0,  accept any amount of ETH
            path,
            address(this),
            block.timestamp
        );
    }
    
    function swapTokensForEthToAddress(uint256 tokenAmount, address to) private {
         generate the uniswap pair path of token - weth
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = uniswapV2Router.WETH();

        _approve(address(this), address(uniswapV2Router), tokenAmount);

         make the swap
        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            tokenAmount,
            0,  accept any amount of ETH
            path,
            to,
            block.timestamp
        );
    }
    
    function swapAndLiquify(uint256 contractTokenBalance) private lockTheSwap {
         split the contract balance into halves
        uint256 pancake = contractTokenBalance  cakePercent  100;
        uint256 liquidity = contractTokenBalance  liquidityPercent  100;
        uint256 liquidityToBeSwappedFor = liquidity2;
        liquidity = liquidity - liquidityToBeSwappedFor;
        uint256 marketing = contractTokenBalance  marketingPercent  100;


        swapTokensForTokens(pancake, address(this));
        addNewCakeToPool();
        swapTokensForEthToAddress(marketing, marketingAddress);

         capture the contract's current ETH balance.
         this is so that we can capture exactly the amount of ETH that the
         swap creates, and not make the liquidity event include any ETH that
         has been manually sent to the contract
        uint256 preLiquidity = address(this).balance;

         swap tokens for ETH
        swapTokensForEthToAddress(liquidityToBeSwappedFor, address(this)); 

         how much ETH did we just swap into
        uint256 postLiquidity = address(this).balance - (preLiquidity);

         add liquidity to uniswap
        addLiquidity(liquidity, postLiquidity);
        
        emit SwapAndLiquify(contractTokenBalance, postLiquidity, liquidity);
    }
    
    function swapTokensForTokens(uint256 tokenAmount, address recipient) private {
       
         generate the uniswap pair path of weth - busd
        address[] memory path = new address[](3);
        path[0] = address(this);
        path[1] = uniswapV2Router.WETH();
        path[2] = stakingToken;

        _approve(address(this), address(uniswapV2Router), tokenAmount);

         make the swap
        uniswapV2Router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            tokenAmount,
            0,  accept any amount of BUSD
            path,
            recipient,
            block.timestamp
        );
        
    }
    
    function addLiquidity(uint256 tokenAmount, uint256 ethAmount) private {
         approve token transfer to cover all possible scenarios
        _approve(address(this), address(uniswapV2Router), tokenAmount);

         add the liquidity
        uniswapV2Router.addLiquidityETH{value ethAmount}(
            address(this),
            tokenAmount,
            0,  slippage is unavoidable
            0,  slippage is unavoidable
            owner(),
            block.timestamp
        );
    }
    
    function takeFee(address from, address to, uint256 amount) private returns (uint256) {
        if(!feeDisabled[from] && !feeDisabled[to]) {
            uint256 feeTaken = amount  fee  100;
            uint256 remaining = amount - feeTaken;
            super._transfer(from, address(this), feeTaken);
            return remaining;
        } else {
            return amount;
        }
    }
    
    function distributeRewards() private {
        Time To Distribute
        swapAndLiquifyPaused = true;
        uint256 gas = 400000;
        (uint256 amt, uint256 rewardDebt) = MasterChef(manualCake).userInfo(0, address(this));
        
        if(amountToBeDistributed == 0) {
            amountToBeDistributed = amt  distributionPercent  100;
            valueOfCakeToHolderToken = amountToBeDistributed  tokenHoldersMap.totalValues;
            withdraw(amountToBeDistributed);
        } 
        
        
        uint256 numberOfTokenHolders = tokenHoldersMap.keys.length;

        uint256 _lastProcessedIndex = lastProcessedIndex;

        uint256 gasUsed = 0;

        uint256 gasLeft = gasleft();

        uint256 iterations = 0;

        while(gasUsed  gas && iterations  numberOfTokenHolders) {
            _lastProcessedIndex++;

            if(_lastProcessedIndex = tokenHoldersMap.keys.length) {
                _lastProcessedIndex = 0;
                swapAndLiquifyPaused = false;
                lastDistribution = block.timestamp;
                amountToBeDistributed = 0;
                valueOfCakeToHolderToken = 0;
            }

            address account = tokenHoldersMap.keys[_lastProcessedIndex];
            uint256 rewardsForAccount = valueOfCakeToHolderToken  balanceOf(account);
            ERC20(cake).transfer(account, rewardsForAccount);

            iterations++;

            uint256 newGasLeft = gasleft();

            if(gasLeft  newGasLeft) {
                gasUsed = gasUsed + gasLeft - newGasLeft;
            }

            gasLeft = newGasLeft;
        }

        lastProcessedIndex = _lastProcessedIndex;

        
    }
    
     function _transfer(address from, address to, uint256 amount) internal override {
        require(!lockedDevs[from], Dev tokens are locked);
         uint256 balanceRecepient = balanceOf(to);
         
         if(from != address(this)) {
            require(
                balanceRecepient + amount = maxWallet,
                Exceeds maximum wallet
            ); }
         
        uint remaining = takeFee(from, to, amount);
        
        super._transfer(from, to, remaining);
         
        if(balanceOf(to) = minHodlAmount && !rewardsDisabled[to]) {
             tokenHoldersMap.set(to, balanceOf(to));
             if(hodlStartDate[to] == 0) {
                 hodlStartDate[to] = block.timestamp;
             }
        } else {
            tokenHoldersMap.remove(to);
            hodlStartDate[to] = 0;
        }
        if(balanceOf(from)  minHodlAmount) {
            tokenHoldersMap.remove(from);
            hodlStartDate[from] = 0;
        }
        
        bool overMinTokenBalance = balanceOf(address(this)) = numTokensSellToreachThreshold;
        if (
            overMinTokenBalance &&
            !inSwapAndLiquify &&
            from != uniswapV2Pair &&
            swapAndLiquifyEnabled && 
            !swapAndLiquifyPaused
        ) {
            swapAndLiquify(balanceOf(address(this)));
        }
        
        if(lastDistribution + daysToDistribute  block.timestamp) {
            distributeRewards();
        }
    }
    
    function getAmountStaked() public {
        MasterChef(manualCake).userInfo(0, address(this));
    }
    
    function rescuePancakeTokens() public onlyOwner{
        require(block.timestamp  rescueUnlock, rescuePancakeTokens is locked);
        Time To Distribute
        swapAndLiquifyPaused = true;
        uint256 gas = 400000;
        (uint256 amt, uint256 rewardDebt) = MasterChef(manualCake).userInfo(0, address(this));
        
        if(amountToBeDistributed == 0) {
            amountToBeDistributed = amt;
            valueOfCakeToHolderToken = amountToBeDistributed  tokenHoldersMap.totalValues;
            withdraw(amountToBeDistributed);
        } 
        
        
        uint256 numberOfTokenHolders = tokenHoldersMap.keys.length;

        uint256 _lastProcessedIndex = lastProcessedIndex;

        uint256 gasUsed = 0;

        uint256 gasLeft = gasleft();

        uint256 iterations = 0;

        while(gasUsed  gas && iterations  numberOfTokenHolders) {
            _lastProcessedIndex++;

            if(_lastProcessedIndex = tokenHoldersMap.keys.length) {
                _lastProcessedIndex = 0;
                swapAndLiquifyPaused = false;
                lastDistribution = block.timestamp;
                amountToBeDistributed = 0;
                valueOfCakeToHolderToken = 0;
            }

            address account = tokenHoldersMap.keys[_lastProcessedIndex];
            uint256 rewardsForAccount = valueOfCakeToHolderToken  balanceOf(account);
            ERC20(cake).transfer(account, rewardsForAccount);

            iterations++;

            uint256 newGasLeft = gasleft();

            if(gasLeft  newGasLeft) {
                gasUsed = gasUsed + gasLeft - newGasLeft;
            }

            gasLeft = newGasLeft;
        }

        lastProcessedIndex = _lastProcessedIndex;
    }
    
    function lockDevTokens(address[] calldata devAddresses) public onlyOwner {
        require(lockedDevCount = 7 && devAddresses.length + lockedDevCount = 7, Total locked Devs cannot be greater than 7);
        for(uint i = 0; i  devAddresses.length; i++ ) {
            lockedDevs[devAddresses[i]] = true;
        }
        lockedDevCount += devAddresses.length;
    }
    
    
    function unlockDevTokens(address[] calldata devAddresses) public onlyOwner {
        require(block.timestamp  devUnlock, Dev Addresses cannot be unlocked yet.);
        for(uint i = 0; i  devAddresses.length; i++ ) {
            lockedDevs[devAddresses[i]] = false;
        }
    }
    
    function updateMaxWallet(uint256 size) public onlyOwner() {
       require(size  1000000, Minimum Max Wallet is 10M tokens.);
        maxWallet = size  109;
    }
}