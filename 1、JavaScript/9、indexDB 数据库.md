# indexDB

IndexedDB 是一种底层 APl，用于在客户端存储大量的结构化数据(也包括文件/二进制大型对象（blobs)），该 APl 使用索引实现对数据的高性能搜索。IndexedDB 是一个事务型数据库系统，也是一个基于 JavaScript 的面向对象数据库，它提供了类似数据库风格的数据储存和使用方式，我们只需要指定数据库模式，打开与数据库的连接，然后检索和更新一系列事务。

基于以上，这章学习 IndexedDB 仅围绕如何“自建前端 Mock 体系”，学习 IndexedDB 一些基本的概念和 APl，大致包括：

数据库：存储数据的地方，每个域名可以创建多个数据库

对象仓库：也就是 objectStore,每个数据库包含若干个对象仓库

索引：可以为对象仓库中的属性创建对应的索引，并且根据索引来查询数据，一般索引和索引属性一致

事务：数据库里的增删改查操作都是通过事务(transaction)来完成

数据记录：每一条数据都是一条记录，有对应的 key、value、主键、索引等属性

## indexDB 操作

```javascript

export default class DB {
    private dbName:string //数据库名称
    constructor(dbName:string){
        this.dbName = dbName
    }
    //打开数据库
    public openstore(storeName: string, keyPath: string, indexs?: Array<string>) {

        const request =window.indexedDB.open(this.dbName, 1) // 1 是数据库版本号， 不写， 默认也是1, 数字只能增不能减
        request.onsuccess = (event) => {
            console.log('数据库打开成功'）// 再调用这个。
            console.log(event)
        }
        request.onerror =(event) =>{
            console.log（'数据库打开失败'）
            console.log(event)
        }
        request.onupgradeneeded =(event) =>{
            console.log('数据库升级成功'）// 先调用这个
            console.log(event)
            const { result }: any = event.target
            const store = result.createobjectStore(storeName, { autoIncrement: true, keyPath })


            if (indexs && indexs.length > 0) {
                indexs.map((v: string) => {
                    store.createIndex(v, v, { unique: true })
                }）
            }
            store.transaction.oncomplete = (event: any) => {
                console.log('创建对象仓库');
            }
        }
    }


    //新增/修改数据库数据
    updateItem(storeName: string, data: any){

        const store = this.db.transaction([storeName], 'readwrite').objectStore(storeName)

        // 只添加不修改就用 add
        const request = store.put({
            .….data,
            // put 相同的数据会报错
            updateTime: new Date().getTime()
        }）
        request.onsuccess =(event: any) => {
            console.log（'数据写入成功'）
            console.log(event)
        }
        request.onerror =(event: any) => {
            console.log('数据写入失败'）
            console.log(event)
        }
    }

    //删除数据

    //删除数据
    deleteItem(storeName: string, key: number | string) {
        const store = this.db.transaction([storeName], 'readwrite').objectStore(storeName);

        const request = store.delete(key)
        request.onsuccess =(event:any)=>{
            console.log('数据删除成功'）
            console.log(event)
        }
        request.onerror = (event: any)=>{
            console.log（'数据删除失败'）
            console.log(event)
        }
    }


}
```
