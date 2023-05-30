# Axios

```TS

import axios, {AxiosRequestConfig, AxiosReponse}  from 'axios'

const defaultConfig = {
    timeout: 5000，
    baseUrl: ''
}


class BaseAPI {
    private static axiosInstance =  axios.create(defaultConfig)

    constructor(parameters) {
        this.httpInterceptorsReponse()
        this.httpInterceptorsRequest()
    }

    private httpInterceptorsRequest() {

        BaseAPI.axiosInstance.interceptors.request.use(config: AxiosRequestConfig => {
            return config
        }, err => {
            return Promise.reject(err)
        })
    }

    private httpInterceptorsReponse() {

        BaseAPI.axiosInstance.interceptors.response.use(config: AxiosReponse => {
            return config
        }, err => {
            return Promise.reject(err)
        });
    }
    /**
     * get
     */
    public httpRequestGet<T>(url:string, parmas: AxiosRequestConfig): Promise<T> {
        return BaseAPI.axiosInstance.get(url, parmas).then(res => res.data).catch()
    }
    /**
     * httpReponsePost<T>
     */

    public httpReponsePost<T>(url: string,  parmas: AxiosRequestConfig): Promise<T> {
        return BaseAPI.axiosInstance.post(url, parmas).then(res => res.data).catch()
    }
}

export const http = new BaseAPI()
```
