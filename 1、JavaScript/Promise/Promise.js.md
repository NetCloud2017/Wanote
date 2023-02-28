# Promise.js

pending 状态理解：代表等待的状态，pending 状态下，可能执行 resolve(）的方法，也可能执行
reject（）方法。创建好 Promise 对象后，但在执行 resolve（）或 reject（）前为 Pending 状态。

resolve 状态理解\*\*代表成功态，执行 resolve（）方法后的状态。

reject 状态理解，代表失败态，执行 reject（）方法后的状态。

状态特性：一旦成功了就不能失败，反过来也是一样。

then 方法：每个 promsie 都有一个 then 方法。

其他也执行 reject 的场景：正在执行 resolve（）方法报错了，也进入 reject 失败状态。

```ts
type ResolveType = (resolve: any) => any
type RejectType =(reject: any) => any

type Executor =(resolve: ResolveType, reject: RejectType) => any

class Promise <T=any> {
    public resolve!: ResolveType;
    public reject!: RejectType;
    public status!: string;
    constructor(executor:  Executor) {
        this.status= 'pending'

        this.reject = (value: any) any => {
            if(this.jugdeSsta('pending')) {
                this.status= 'fail'
            }

        }
        this.resolve = (value: any) : any=> {
            if(this.jugdeSsta('pending')) {
                this.status = 'success'
            }
        }

        executor(this.resolve,this.reject)

    }
    judgeStatus(status: string): boolean | string {
        if (status.length > 0) {
            if(status === 'pending' || status === 'success' || status === 'fail') {
                return true
            } else {
                return false
            }
        } else {
            return this.status
        }
    }
    then(resolveThen: ResolveType, rejectThen: RejectType) {

    }
}
```
