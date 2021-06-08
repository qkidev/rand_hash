## 随机哈希

一个公共随机数，每次调用后，下次结果都不一样，用户越多，随机性越大，降低可预测性。

## 调用演示

```
interface  rand_hash {
    function random() external returns (bytes32);
}

bytes32 rand = rand_hash("地址").random();

uint random = uint(rand)%100;
```