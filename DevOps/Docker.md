# .Dockerfile 的五个技巧

1. COPY 和 ADD 的区别
    
    COPY 不会将压缩内容解压，ADD 会解压压缩内容

2. CMD 和 ENTRYPOINT 的区别
    
3. 使用多阶段构建 `as` 字符

4. 使用 `alpine` linux 最小版本

5. 使用 ARG 定义参数

    ```bash

        FROM node:18-alpine3.14

        ARG aaa
        ARG bbb

        WORKDIR /app

        COPY ./test.js .

        ENV aaa=${aaa} \
            bbb=${bbb}

        CMD ["node", "/app/test.js"]
    ```

