```javascript
{

    devServer:{
        proxy:{
            '/api':{
                target: 'http://localhost:3000',
                changeorigin: false
            }
        }
    }
}

```

参考地址:

[changeorigin 解析](https://blog.csdn.net/Old_Soldier/article/details/127204618)
