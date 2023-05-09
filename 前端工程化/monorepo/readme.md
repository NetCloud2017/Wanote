# monorepo

是以 `package.json` 的 workspaces 管理包的一种工具， 会将 workspaces 里的目录在初始化的时候以 `npm link` 的形式注册到 .bin 中 ，在使用时， 也是使用 workspaces 目录里的包， 而不是 node_modules 里面的包。
