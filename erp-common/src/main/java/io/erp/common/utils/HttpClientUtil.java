package io.erp.common.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.NoHttpResponseException;
import org.apache.commons.httpclient.*;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.apache.commons.httpclient.methods.multipart.*;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.commons.lang.StringUtils;
import org.apache.http.Header;
import org.apache.http.*;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.config.SocketConfig;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.LayeredConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import javax.net.ssl.*;
import java.io.*;
import java.net.*;
import java.nio.charset.Charset;
import java.security.cert.X509Certificate;
import java.util.HashMap;
import java.util.Map;

@Component
public class HttpClientUtil {
	private static final Logger logger = Logger.getLogger(HttpClientUtil.class);
	public static int CONNECTION_TIMEOUT_DEF = 60*1000;
	public static int RETRY_COUNT_DEF = 3;
	private final static int CONNECT_TIMEOUT = 8000;            // 连接超时毫秒
    private final static int SOCKET_TIMEOUT = 20000;            // 传输超时毫秒
    private final static int REQUEST_CONNECT_TIMEOUT = 6000;    // 获取请求超时毫秒
    private final static int CONNECT_TOTAL = 200;               // 最大连接数
    private final static int CONNECT_ROUTE = 20;                // 每个路由基础的连接数
    public final static String RESP_CONTENT = "通信失败";
    private static PoolingHttpClientConnectionManager connManager = null;
    private static CloseableHttpClient httpClient = null;
    static {
        ConnectionSocketFactory plainsf = PlainConnectionSocketFactory.getSocketFactory();
        LayeredConnectionSocketFactory sslsf = createSSLConnSocketFactory();
        Registry<ConnectionSocketFactory> registry = RegistryBuilder.<ConnectionSocketFactory>create().register("http", plainsf).register("https", sslsf).build();
        connManager = new PoolingHttpClientConnectionManager(registry);
        // 将最大连接数增加到200
        connManager.setMaxTotal(CONNECT_TOTAL);
        // 将每个路由基础的连接增加到20
        connManager.setDefaultMaxPerRoute(CONNECT_ROUTE);
        // 可用空闲连接过期时间,重用空闲连接时会先检查是否空闲时间超过这个时间，如果超过，释放socket重新建立
        connManager.setValidateAfterInactivity(30000);
        // 设置socket超时时间
        SocketConfig socketConfig = SocketConfig.custom().setSoTimeout(SOCKET_TIMEOUT).build();
        connManager.setDefaultSocketConfig(socketConfig);
        RequestConfig requestConfig = RequestConfig.custom().setConnectionRequestTimeout(REQUEST_CONNECT_TIMEOUT).setConnectTimeout(CONNECT_TIMEOUT).setSocketTimeout(SOCKET_TIMEOUT).build();
        HttpRequestRetryHandler httpRequestRetryHandler = (exception, executionCount, context) -> {
            if (executionCount >= 1) {
                // 如果已经重试了3次，就放弃
                return false;
            }
            if (exception instanceof NoHttpResponseException) {
                // 如果服务器丢掉了连接，那么就重试
                return true;
            }
            if (exception instanceof SSLHandshakeException) {
                // 不要重试SSL握手异常
                return false;
            }
            if (exception instanceof InterruptedIOException) {
                // 超时
                return true;
            }
            if (exception instanceof UnknownHostException) {
                // 目标服务器不可达
                return false;
            }
            if (exception instanceof SSLException) {
                // ssl握手异常
                return false;
            }
            HttpClientContext clientContext = HttpClientContext.adapt(context);
            HttpRequest request = clientContext.getRequest();
            // 如果请求是幂等的，就再次尝试
            return !(request instanceof HttpEntityEnclosingRequest);
        };
        httpClient = HttpClients.custom().setConnectionManager(connManager).setDefaultRequestConfig(requestConfig).setRetryHandler(httpRequestRetryHandler).build();
        if (connManager != null && connManager.getTotalStats() != null) {
        		logger.info("now client pool " + connManager.getTotalStats().toString());
        }
    }
    
  //SSL的socket工厂创建
    private static SSLConnectionSocketFactory createSSLConnSocketFactory() {
        SSLConnectionSocketFactory sslsf = null;
        // 创建TrustManager() 用于解决javax.net.ssl.SSLPeerUnverifiedException: peer not authenticated
        X509TrustManager trustManager = new X509TrustManager() {
            @Override
            public X509Certificate[] getAcceptedIssuers() {
                return null;
            }

            @Override
            public void checkClientTrusted(X509Certificate[] arg0, String authType) {
            }

            @Override
            public void checkServerTrusted(X509Certificate[] arg0, String authType) {
            	
            }
        };
        SSLContext sslContext;
        try {
            sslContext = SSLContext.getInstance(SSLConnectionSocketFactory.TLS);
            sslContext.init(null, new TrustManager[]{(TrustManager) trustManager}, null);
            // 创建SSLSocketFactory , // 不校验域名 ,取代以前验证规则
            sslsf = new SSLConnectionSocketFactory(sslContext, NoopHostnameVerifier.INSTANCE);
        } catch (Exception e) {
            logger.error(e);
        }
        return sslsf;
    }
    
    /**
     * 发送HTTP_GET请求
     *
     * @param requestURL 请求地址
     * @param paramMap   请求参数
     * @return 远程主机响应正文
     * @see 1)该方法会自动关闭连接,释放资源
     * @see 2)方法内设置了连接和读取超时时间,单位为毫秒,超时或发生其它异常时方法会自动返回"通信失败"字符串
     * @see 3)请求参数含中文时,经测试可直接传入中文,HttpClient会自动编码发给Server,应用时应根据实际效果决定传入前是否转码
     * @see 4)该方法会自动获取到响应消息头中[Content-Type:text/html; charset=GBK]的charset值作为响应报文的解码字符集
     * @see 5)若响应消息头中无Content-Type属性,则会使用HttpClient内部默认的ISO-8859-1作为响应报文的解码字符集
     */
    public String sendGetRequest(String requestURL, Map<String, String> paramMap) {
        String respContent = RESP_CONTENT; // 响应内容
        StringBuilder paramStr = new StringBuilder();
        CloseableHttpResponse response = null;
        HttpGet httpget = null;
        try {
            for (Map.Entry<String, String> entry : paramMap.entrySet()) {
                paramStr.append(entry.getKey()).append("=").append(URLEncoder.encode(entry.getValue(), "UTF-8")).append("&");
            }
            String param = paramStr.toString().substring(0, paramStr.toString().length() - 1);
            httpget = new HttpGet(requestURL + "?" + param);
            //logger.info("开始执行请求:" + requestURL + "?" + param);
            response = httpClient.execute(httpget, HttpClientContext.create()); // 执行GET请求
            HttpEntity entity = response.getEntity(); // 获取响应实体
            if (null != entity) {
                Charset respCharset = ContentType.getOrDefault(entity).getCharset();
                respContent = EntityUtils.toString(entity, respCharset);
                //logger.info("执行请求完毕:" + respContent);
                EntityUtils.consume(entity);
            }
        } catch (ConnectTimeoutException cte) {
            logger.error("请求通信[" + requestURL + "]时连接超时,堆栈轨迹如下 {}", cte);
        } catch (SocketTimeoutException ste) {
            logger.error("请求通信[" + requestURL + "]时读取超时,堆栈轨迹如下 {}", ste);
        } catch (ClientProtocolException cpe) {
            // 该异常通常是协议错误导致:比如构造HttpGet对象时传入协议不对(将'http'写成'htp')or响应内容不符合HTTP协议要求等
            logger.error("请求通信[" + requestURL + "]时协议异常,堆栈轨迹如下 {}", cpe);
        } catch (ParseException pe) {
            logger.error("请求通信[" + requestURL + "]时解析异常,堆栈轨迹如下 {}", pe);
        } catch (IOException ioe) {
            // 该异常通常是网络原因引起的,如HTTP服务器未启动等
            logger.error("请求通信[" + requestURL + "]时网络异常,堆栈轨迹如下 {}", ioe);
        } catch (Exception e) {
            logger.error("请求通信[" + requestURL + "]时偶遇异常,堆栈轨迹如下 {}", e);
        } finally {
            try {
                if (response != null) response.close();
            } catch (IOException e) {
                logger.error(e);
            }
            if (httpget != null) {
                httpget.releaseConnection();
            }
        }
        return respContent;
    }

    /**
     * 发送HTTP_POST请求
     *
     * @param requestURL  请求地址
     * @param paramMap    请求参数,map
     * @param contentType contentType
     * @return 远程主机响应正文
     * @see 1)该方法允许自定义任何格式和内容的HTTP请求报文体
     * @see 2)该方法会自动关闭连接,释放资源
     * @see 3)方法内设置了连接和读取超时时间,单位为毫秒,超时或发生其它异常时方法会自动返回"通信失败"字符串
     * @see 4)请求参数含中文等特殊字符时,可直接传入本方法,并指明其编码字符集encodeCharset参数,方法内部会自动对其转码
     * @see 5)该方法在解码响应报文时所采用的编码,取自响应消息头中的[Content-Type:text/html; charset=GBK]的charset值
     * @see 6)若响应消息头中未指定Content-Type属性,则会使用HttpClient内部默认的ISO-8859-1
     */
    public String sendPostRequest(String requestURL, Map<String, String> paramMap, ContentType contentType) {
        String result = RESP_CONTENT;
        // 设置请求和传输超时时间
        HttpPost httpPost = new HttpPost(requestURL);
        CloseableHttpResponse response = null;
        if (contentType == null) {
            contentType = ContentType.APPLICATION_FORM_URLENCODED;
        }
        //设置contentType
        httpPost.setHeader(HTTP.CONTENT_TYPE, contentType.toString());
        try {
            String param = "";
            if (paramMap != null && paramMap.size() > 0) {
                StringBuilder paramStr = new StringBuilder();
                for (Map.Entry<String, String> entry : paramMap.entrySet()) {
                    paramStr.append(entry.getKey()).append("=").append(URLEncoder.encode(entry.getValue(), "UTF-8")).append("&");
                }
                param = paramStr.toString().substring(0, paramStr.toString().length() - 1);
                StringEntity entity = new StringEntity(param, "UTF-8");
                httpPost.setEntity(entity);
            }
            logger.info("开始执行请求：" + requestURL);
            logger.info("param:" + param);
            response = httpClient.execute(httpPost, HttpClientContext.create());
            HttpEntity entity = response.getEntity();
            if (null != entity) {
                result = EntityUtils.toString(entity, ContentType.getOrDefault(entity).getCharset());
                logger.info("执行请求完毕：" + result);
                EntityUtils.consume(entity);
            }
        } catch (ConnectTimeoutException cte) {
            logger.error("请求通信[" + requestURL + "]时连接超时,堆栈轨迹如下", cte);
        } catch (SocketTimeoutException ste) {
            logger.error("请求通信[" + requestURL + "]时读取超时,堆栈轨迹如下", ste);
        } catch (ClientProtocolException cpe) {
            logger.error("请求通信[" + requestURL + "]时协议异常,堆栈轨迹如下", cpe);
        } catch (ParseException pe) {
            logger.error("请求通信[" + requestURL + "]时解析异常,堆栈轨迹如下", pe);
        } catch (IOException ioe) {
            logger.error("请求通信[" + requestURL + "]时网络异常,堆栈轨迹如下", ioe);
        } catch (Exception e) {
            logger.error("请求通信[" + requestURL + "]时偶遇异常,堆栈轨迹如下", e);
        } finally {
            try {
                if (response != null)
                    response.close();
            } catch (IOException e) {
                logger.error(e);
            }
            if (httpPost != null) {
                httpPost.releaseConnection();
            }
        }
        return result;
    }

    /**
     * 发送HTTP_POST请求
     *
     * @param requestURL  请求地址
     * @param paramStr    请求参数,string
     * @param contentType contentType
     * @return 远程主机响应正文
     * @see 1)该方法允许自定义任何格式和内容的HTTP请求报文体
     * @see 2)该方法会自动关闭连接,释放资源
     * @see 3)方法内设置了连接和读取超时时间,单位为毫秒,超时或发生其它异常时方法会自动返回"通信失败"字符串
     * @see 4)请求参数含中文等特殊字符时,可直接传入本方法,并指明其编码字符集encodeCharset参数,方法内部会自动对其转码
     * @see 5)该方法在解码响应报文时所采用的编码,取自响应消息头中的[Content-Type:text/html; charset=GBK]的charset值
     * @see 6)若响应消息头中未指定Content-Type属性,则会使用HttpClient内部默认的ISO-8859-1
     */
    public String sendPostRequest(String requestURL, String paramStr, ContentType contentType) {
        String result = RESP_CONTENT;
        // 设置请求和传输超时时间
        HttpPost httpPost = new HttpPost(requestURL);
        CloseableHttpResponse response = null;
        if (contentType == null) {
            contentType = ContentType.APPLICATION_FORM_URLENCODED;
        }
        //设置contentType
        httpPost.setHeader(HTTP.CONTENT_TYPE, contentType.toString());
        try {
            StringEntity stringEntity = new StringEntity(paramStr, "UTF-8");
            httpPost.setEntity(stringEntity);
            logger.info("开始执行请求：" + requestURL);
            logger.info("paramStr:" + paramStr);
            response = httpClient.execute(httpPost, HttpClientContext.create());
            HttpEntity entity = response.getEntity();
            if (null != entity) {
                result = EntityUtils.toString(entity, ContentType.getOrDefault(entity).getCharset());
                logger.info("执行请求完毕：" + result);
                EntityUtils.consume(entity);
            }
        } catch (ConnectTimeoutException cte) {
            logger.error("请求通信[" + requestURL + "]时连接超时,堆栈轨迹如下", cte);
        } catch (SocketTimeoutException ste) {
            logger.error("请求通信[" + requestURL + "]时读取超时,堆栈轨迹如下", ste);
        } catch (ClientProtocolException cpe) {
            logger.error("请求通信[" + requestURL + "]时协议异常,堆栈轨迹如下", cpe);
        } catch (ParseException pe) {
            logger.error("请求通信[" + requestURL + "]时解析异常,堆栈轨迹如下", pe);
        } catch (IOException ioe) {
            logger.error("请求通信[" + requestURL + "]时网络异常,堆栈轨迹如下", ioe);
        } catch (Exception e) {
            logger.error("请求通信[" + requestURL + "]时偶遇异常,堆栈轨迹如下", e);
        } finally {
            try {
                if (response != null)
                    response.close();
            } catch (IOException e) {
                logger.error(e);
            }
            if (httpPost != null) {
                httpPost.releaseConnection();
            }
        }
        return result;
    }

    /**
     * 全能post请求方法
     *
     * @param requestURL  请求地址
     * @param headerMap   headerMap,treeMap          //请求头
     * @param paramMap    paramMap,treeMap           //请求参数map
     * @param paramStr    paramStr,paramStr          //请求参数字符串
     * @param contentType ContentType,contentType    //ContentType
     */
    public String sendPostRequest(String requestURL, Map<String, String> headerMap, Map<String, String> paramMap, String paramStr, ContentType contentType) {
        String result = "";
        HttpPost httpPost = new HttpPost(requestURL);
        CloseableHttpResponse response = null;
        if (contentType == null) {
            contentType = ContentType.APPLICATION_FORM_URLENCODED;
        }
        //设置contentType
        httpPost.setHeader(HTTP.CONTENT_TYPE, contentType.toString());
        //设置header
        if (null != headerMap) {
            for (Map.Entry<String, String> entry : headerMap.entrySet()) {
                String key = entry.getKey();
                String value = entry.getValue();
                httpPost.setHeader(key, value);
            }
        }
        try {
            //设置参数
            String stringEntity = "";
            if (null != paramMap) {
                //当请求参数map不为空的话,使用该map的值作为参数
                if (contentType.toString().equals(ContentType.APPLICATION_JSON.toString())) {
                    //如果ContentType为json,参数转为json格式
                    stringEntity = JSON.toJSONString(paramMap);
                } else {
                    //如果ContentType不为json,参数转为from表单提交格式
                    for (Map.Entry<String, String> entry : paramMap.entrySet()) {
                        stringEntity = stringEntity + entry.getKey() + "=" + URLEncoder.encode(entry.getValue(), "UTF-8") + "&";
                    }
                    stringEntity = stringEntity.substring(0, stringEntity.length() - 1);
                }
            } else {
                //当请求参数map为空时,使用请求参数字符串的值
                stringEntity = paramStr;
            }
            httpPost.setEntity(new StringEntity(stringEntity, "UTF-8"));
            logger.warn("开始执行请求:" + requestURL);
            logger.warn("headerMap:" + JSON.toJSONString(headerMap));
            logger.warn("paramMap:" + (null != paramMap ? JSON.toJSONString(paramMap) : ""));
            logger.warn("paramStr:" + paramStr);
            response = httpClient.execute(httpPost, HttpClientContext.create());
            HttpEntity entity = response.getEntity();
            if (null != entity) {
                result = EntityUtils.toString(entity, ContentType.getOrDefault(entity).getCharset());
                logger.warn("执行请求完毕：" + result);
                EntityUtils.consume(entity);
            }
        } catch (ConnectTimeoutException cte) {
            logger.error("请求通信[" + requestURL + "]时连接超时,堆栈轨迹如下", cte);
        } catch (SocketTimeoutException ste) {
            logger.error("请求通信[" + requestURL + "]时读取超时,堆栈轨迹如下", ste);
        } catch (ClientProtocolException cpe) {
            logger.error("请求通信[" + requestURL + "]时协议异常,堆栈轨迹如下", cpe);
        } catch (ParseException pe) {
            logger.error("请求通信[" + requestURL + "]时解析异常,堆栈轨迹如下", pe);
        } catch (IOException ioe) {
            logger.error("请求通信[" + requestURL + "]时网络异常,堆栈轨迹如下", ioe);
        } catch (Exception e) {
            logger.error("请求通信[" + requestURL + "]时偶遇异常,堆栈轨迹如下", e);
        } finally {
            try {
                if (response != null)
                    response.close();
            } catch (IOException e) {
                logger.error(e);
            }
            if (httpPost != null) {
                httpPost.releaseConnection();
            }
        }
        return result;
    }

    /**
     * 全能post请求方法(针对AK47)
     *
     * @param requestURL  请求地址
     * @param headerMap   headerMap,treeMap          //请求头
     * @param paramMap    paramMap,treeMap           //请求参数map
     * @param paramStr    paramStr,paramStr          //请求参数字符串
     * @param contentType ContentType,contentType    //ContentType
     */
    public Map<String, String> sendPostRequestMap(String requestURL, Map<String, String> headerMap, Map<String, String> paramMap, String paramStr, ContentType contentType) {
        Map<String, String> result = new HashMap<>();
        String body;
        HttpPost httpPost = new HttpPost(requestURL);
        CloseableHttpResponse response = null;
        if (contentType == null) {
            contentType = ContentType.APPLICATION_FORM_URLENCODED;
        }
        //设置contentType
        httpPost.setHeader(HTTP.CONTENT_TYPE, contentType.toString());
        //设置header
        if (null != headerMap) {
            for (Map.Entry<String, String> entry : headerMap.entrySet()) {
                String key = entry.getKey();
                String value = entry.getValue();
                httpPost.setHeader(key, value);
            }
        }
        try {
            //设置参数
            String stringEntity = "";
            if (paramMap != null) {
                //当请求参数map不为空的话,使用该map的值作为参数
                if (contentType.toString().equals(ContentType.APPLICATION_JSON.toString())) {
                    //如果ContentType为json,参数转为json格式
                    stringEntity = JSON.toJSONString(paramMap);
                } else {
                    //如果ContentType不为json,参数转为from表单提交格式
                    for (Map.Entry<String, String> entry : paramMap.entrySet()) {
                        stringEntity = stringEntity + entry.getKey() + "=" + URLEncoder.encode(entry.getValue(), "UTF-8") + "&";
                    }
                    stringEntity = stringEntity.substring(0, stringEntity.length() - 1);
                }
            } else {
                //当请求参数map为空时,使用请求参数字符串的值
                stringEntity = paramStr;
            }
            httpPost.setEntity(new StringEntity(stringEntity, "UTF-8"));
            logger.warn("开始执行请求:" + requestURL);
            logger.warn("headerMap:" + JSON.toJSONString(headerMap));
            logger.warn("paramMap:" + (null != paramMap ? JSON.toJSONString(paramMap) : ""));
            logger.warn("paramStr:" + paramStr);
            response = httpClient.execute(httpPost, HttpClientContext.create());
            Header[] headers = response.getAllHeaders();
            for (Header header : headers) {
                result.put(header.getName(), header.getValue());
            }
            HttpEntity entity = response.getEntity();
            if (null != entity) {
                body = EntityUtils.toString(entity, ContentType.getOrDefault(entity).getCharset());
                result.put("body", body);
                logger.warn("执行请求完毕：" + JSON.toJSONString(result));
                EntityUtils.consume(entity);
            }
        } catch (ConnectTimeoutException cte) {
            logger.error("请求通信[" + requestURL + "]时连接超时,堆栈轨迹如下", cte);
        } catch (SocketTimeoutException ste) {
            logger.error("请求通信[" + requestURL + "]时读取超时,堆栈轨迹如下", ste);
        } catch (ClientProtocolException cpe) {
            logger.error("请求通信[" + requestURL + "]时协议异常,堆栈轨迹如下", cpe);
        } catch (ParseException pe) {
            logger.error("请求通信[" + requestURL + "]时解析异常,堆栈轨迹如下", pe);
        } catch (IOException ioe) {
            logger.error("请求通信[" + requestURL + "]时网络异常,堆栈轨迹如下", ioe);
        } catch (Exception e) {
            logger.error("请求通信[" + requestURL + "]时偶遇异常,堆栈轨迹如下", e);
        } finally {
            try {
                if (response != null)
                    response.close();
            } catch (IOException e) {
                logger.error(e);
            }
            if (httpPost != null) {
                httpPost.releaseConnection();
            }
        }
        return result;
    }

    /**
     * 向指定 URL 发送POST方法的请求
     *
     * @param url     发送请求的 URL
     * @param param   请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return 所代表远程资源的响应结果
     */
    public String sendPostRequestMap(String url, String param) {
        OutputStreamWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            HttpURLConnection conn = null;
            conn = (HttpURLConnection) realUrl.openConnection();
            // 打开和URL之间的连接

            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setRequestMethod("POST");    // POST方法


            // 设置通用的请求属性

            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

            conn.connect();

            // 获取URLConnection对象对应的输出流
            out = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
            // 发送请求参数
            out.write(param);
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            logger.error(e);
        }
        //使用finally块来关闭输出流、输入流
        finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (Exception ex) {
                logger.error(ex);
            }
        }
        return result;
    }

    public static String getResponseBodyAsStringWithHeader(String url, int connectionTimeout, int retryCount,Map<String,String> header)throws Exception{
        logger.debug("请求URL："+url);
        GetMethod getMethod = new GetMethod(url);
        getMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler(retryCount, false));
        getMethod.addRequestHeader("Content-Type","text/html;charset=UTF-8");

        if(header != null){
            for(String key : header.keySet()) {
                getMethod.addRequestHeader(key,header.get(key));
            }
        }

        BufferedReader br =  null;
        HttpClient httpClient = new HttpClient();
        // 设置连接超时时间(单位毫秒)
        httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(connectionTimeout);
        logger.debug(httpClient.getHttpConnectionManager().getParams().getDefaultMaxConnectionsPerHost());
        logger.debug(httpClient.getHttpConnectionManager().getParams().getMaxTotalConnections());
        int statusCode = -1;
        try {
            statusCode = httpClient.executeMethod(getMethod);
            if (statusCode == HttpStatus.SC_OK) {
                // Because of the WARNING "getResponseBody Going to buffer response body of large or unknown size. Using getResponseBodyAsStream instead is recommended."
                // use the getResponseBodyAsStream() instead of getResponseBodyAsString()
                // by Lionheart 2013.8.16
                br = new BufferedReader(new InputStreamReader(getMethod.getResponseBodyAsStream(),"UTF-8"));
                StringBuffer sb = new StringBuffer();
                String str= "";
                while((str = br.readLine()) != null){
                    sb .append(str);
                }
                return sb.toString();
//				return getMethod.getResponseBodyAsString();
            }
            else{
                throw new Exception(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url));
            }
        }
        catch(ConnectTimeoutException e) {
            logger.error(String.format("HTTP请求超时[statusCode:%s][url:%s]", statusCode, url), e);
            logger.error(e);
            throw e;
        }
        catch (UnknownHostException e) {
            logger.error(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url), e);
            logger.error(e);
            throw e;
        }
        catch (HttpException e) {
            // 发生致命的异常，可能是协议不对或者返回的内容有问题
            logger.error(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url), e);
            logger.error(e);
            throw new Exception(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url));
        }
        catch (IOException e) {
            // 发生网络异常
            logger.error(String.format("HTTP请求失败，IO异常，[statusCode:%s][url:%s]", statusCode, url), e);
            logger.error(e);
            throw new Exception(String.format("HTTP请求失败，IO异常，[statusCode:%s][url:%s]", statusCode, url));
        }
        catch (Exception e) {
            logger.error(String.format("HTTP请求失败，未知异常，[statusCode:%s][url:%s]", statusCode, url), e);
            logger.error(e);
            throw new Exception(String.format("HTTP请求失败，未知异常，[statusCode:%s][url:%s]", statusCode, url));
        }
        finally {
            // 释放连接
            if(br != null)br.close();
            getMethod.releaseConnection();
            ((SimpleHttpConnectionManager)httpClient.getHttpConnectionManager()).shutdown();
        }
    }
    
	/**
	 * GET请求
	 * @param url
	 * @param connectionTimeout	连接超时时间(单位毫秒)
	 * @param retryCount		重试失败次数
	 * @return
	 * @throws Exception
	 */
	public static String getResponseBodyAsString(String url, int connectionTimeout, int retryCount)throws Exception{
        return getResponseBodyAsStringWithHeader(url,connectionTimeout,retryCount,null);
	}
	/**
	 * Https请求
	 * @param url
	 * @param connectionTimeout	连接超时时间(单位毫秒)
	 * @param retryCount		重试失败次数
	 * @return
	 * @throws Exception
	 */
	public static String HttpsgetResponseBodyAsString(String url, int connectionTimeout, int retryCount)throws Exception{
		logger.debug("请求URL："+url);
		GetMethod getMethod = new GetMethod(url);
		getMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler(retryCount, false)); 
		getMethod.addRequestHeader("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
		
		HttpClient httpClient = new HttpClient();
		// 设置连接超时时间(单位毫秒)
		httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(connectionTimeout);
		logger.debug(httpClient.getHttpConnectionManager().getParams().getDefaultMaxConnectionsPerHost());
		logger.debug(httpClient.getHttpConnectionManager().getParams().getMaxTotalConnections());
		int statusCode = -1;
		BufferedReader br = null;
		try {
			statusCode = httpClient.executeMethod(getMethod);
			if (statusCode == HttpStatus.SC_OK) {
				// Because of the WARNING "getResponseBody Going to buffer response body of large or unknown size. Using getResponseBodyAsStream instead is recommended."
				// use the getResponseBodyAsStream() instead of getResponseBodyAsString()
				// by Lionheart 2013.8.16
				br = new BufferedReader(new InputStreamReader(getMethod.getResponseBodyAsStream(),"UTF-8"));
				StringBuffer sb = new StringBuffer();  
				String str= "";  
				while((str = br.readLine()) != null){  
					sb .append(str);  
				}
				return sb.toString();
//				return getMethod.getResponseBodyAsString();
			}
			else{
				throw new Exception(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url));
			}
		}
		catch(ConnectTimeoutException e) {
			logger.error(String.format("HTTP请求超时[statusCode:%s][url:%s]", statusCode, url), e);
            logger.error(e);
			throw e;
		}
		catch (UnknownHostException e) {
			logger.error(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url), e);
            logger.error(e);
			throw e;
		}
		catch (HttpException e) {
			// 发生致命的异常，可能是协议不对或者返回的内容有问题
			logger.error(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url), e);
            logger.error(e);
			throw new Exception(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url));
		} 
		catch (IOException e) {
			// 发生网络异常
			logger.error(String.format("HTTP请求失败，IO异常，[statusCode:%s][url:%s]", statusCode, url), e);
            logger.error(e);
			throw new Exception(String.format("HTTP请求失败，IO异常，[statusCode:%s][url:%s]", statusCode, url));
		}  
		catch (Exception e) {
			logger.error(String.format("HTTP请求失败，未知异常，[statusCode:%s][url:%s]", statusCode, url), e);
            logger.error(e);
			throw new Exception(String.format("HTTP请求失败，未知异常，[statusCode:%s][url:%s]", statusCode, url));
		} 
		finally {
			// 释放连接
			if(br != null)br.close();
			getMethod.releaseConnection();
			((SimpleHttpConnectionManager)httpClient.getHttpConnectionManager()).shutdown(); 
		}
	}
	public static String getResponseBodyAsString(String url, int connectionTimeout, int retryCount, Map<String, String> params)throws Exception{
		StringBuffer sb = new StringBuffer(url);
		if(params!=null && params.size()>0){
			for (Map.Entry<String, String> entry : params.entrySet()) { 
				if (sb.indexOf("?") != -1) {
					if(sb.lastIndexOf("&")==sb.length()-1){
						sb = new StringBuffer(url.substring(0, url.length()-1));
					}
					sb.append("&").append(entry.getKey()).append("=").append(URLEncoder.encode(entry.getValue(), "utf-8"));
				} 
				else {
					sb.append("?").append(entry.getKey()).append("=").append(URLEncoder.encode(entry.getValue(), "utf-8"));
				}
            }  
		}
		
		return getResponseBodyAsString(sb.toString(), connectionTimeout, retryCount);
	}
	public static String getResponseBodyAsString(String url)throws Exception{
		return getResponseBodyAsString(url, CONNECTION_TIMEOUT_DEF, RETRY_COUNT_DEF);
	}
	public static String getResponseBodyAsString(String url, Map<String, String> params)throws Exception{
		return getResponseBodyAsString(url, CONNECTION_TIMEOUT_DEF, RETRY_COUNT_DEF, params);
	}
	/**
	 * POST请求
	 * @param url
	 * @param connectionTimeout	连接超时时间(单位毫秒)
	 * @param retryCount
	 * @param postData
	 * @return
	 * @throws Exception
	 */
	public static String postResponseBodyAsString(String url, int connectionTimeout, int retryCount, 
			Map<String,String> postData)throws Exception{
	    PostMethod postMethod = new PostMethod(url);
	    postMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler(retryCount, false)); 
	    postMethod.addRequestHeader("Content-Type","text/html;charset=UTF-8");
	    HttpClient httpClient = new HttpClient();    
	    // 设置连接超时时间(单位毫秒)
		httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(connectionTimeout);
		
	    //post请求参数
	    NameValuePair[] parametersBody = new NameValuePair[postData.size()];
	    int i = 0;
	    for(Map.Entry<String, String> entry: postData.entrySet()){
	    	parametersBody[i++] = new NameValuePair(entry.getKey(), entry.getValue());
	    }
	    postMethod.setRequestBody(parametersBody);
	    logger.debug("post content:\n"+postMethod.getResponseBodyAsString());
	    BufferedReader br = null;
	    int statusCode = -1;
		try {
			statusCode = httpClient.executeMethod(postMethod);
			if (statusCode == HttpStatus.SC_OK) {
				// Because of the WARNING "getResponseBody Going to buffer response body of large or unknown size. Using getResponseBodyAsStream instead is recommended."
				// use the getResponseBodyAsStream() instead of getResponseBodyAsString()
				// by Lionheart 2013.8.16
				br = new BufferedReader(new InputStreamReader(postMethod.getResponseBodyAsStream(),"UTF-8"));
				StringBuffer sb = new StringBuffer();  
				String str= "";  
				while((str = br.readLine()) != null){  
					sb .append(str);  
				}
				return sb.toString();
//				return postMethod.getResponseBodyAsString();
			}
			else{
				throw new Exception(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url));
			}
		}
		catch (HttpException e) {
			// 发生致命的异常，可能是协议不对或者返回的内容有问题
            logger.error(e);
			logger.error(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url), e);
			throw new Exception(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url));
		} 
		catch (IOException e) {
			// 发生网络异常
            logger.error(e);
			logger.error(String.format("HTTP请求失败，IO异常，[statusCode:%s][url:%s]", statusCode, url), e);
			throw new Exception(String.format("HTTP请求失败，IO异常，[statusCode:%s][url:%s]", statusCode, url));
		} 
		catch (Exception e) {
            logger.error(e);
			logger.error(String.format("HTTP请求失败，未知异常，[statusCode:%s][url:%s]", statusCode, url), e);
			throw new Exception(String.format("HTTP请求失败，未知异常，[statusCode:%s][url:%s]", statusCode, url));
		} 
		finally {
			// 释放连接
			if(br != null)br.close();
			postMethod.releaseConnection();
			((SimpleHttpConnectionManager)httpClient.getHttpConnectionManager()).shutdown(); 
		}
	}public static String postJsonResponseToString(String url, int connectionTimeout, int retryCount,
                                                   JSONObject jsonObject,Map<String,String> headers)throws Exception{
        PostMethod postMethod = new PostMethod(url);
        postMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler(retryCount, false));
        postMethod.addRequestHeader("Content-Type","application/json;charset=UTF-8");
        headers.entrySet().stream().forEach(entry -> postMethod.addRequestHeader(entry.getKey(),entry.getValue()));
        HttpClient httpClient = new HttpClient();
        // 设置连接超时时间(单位毫秒)
        httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(connectionTimeout);

        //post请求参数
        postMethod.setRequestEntity(new StringRequestEntity(jsonObject.toJSONString(),"application/json" ,"UTF-8"));

        BufferedReader br = null;
        int statusCode = -1;
        try {
            statusCode = httpClient.executeMethod(postMethod);
            if (statusCode == HttpStatus.SC_OK) {
                // Because of the WARNING "getResponseBody Going to buffer response body of large or unknown size. Using getResponseBodyAsStream instead is recommended."
                // use the getResponseBodyAsStream() instead of getResponseBodyAsString()
                // by Lionheart 2013.8.16
                br = new BufferedReader(new InputStreamReader(postMethod.getResponseBodyAsStream(),"UTF-8"));
                StringBuffer sb = new StringBuffer();
                String str= "";
                while((str = br.readLine()) != null){
                    sb .append(str);
                }
                return sb.toString();
//				return postMethod.getResponseBodyAsString();
            }
            else{
                throw new Exception(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url));
            }
        }
        catch (HttpException e) {
            // 发生致命的异常，可能是协议不对或者返回的内容有问题
            logger.error(e);
            logger.error(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url), e);
            throw new Exception(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url));
        }
        catch (IOException e) {
            // 发生网络异常
            logger.error(e);
            logger.error(String.format("HTTP请求失败，IO异常，[statusCode:%s][url:%s]", statusCode, url), e);
            throw new Exception(String.format("HTTP请求失败，IO异常，[statusCode:%s][url:%s]", statusCode, url));
        }
        catch (Exception e) {
            logger.error(e);
            logger.error(String.format("HTTP请求失败，未知异常，[statusCode:%s][url:%s]", statusCode, url), e);
            throw new Exception(String.format("HTTP请求失败，未知异常，[statusCode:%s][url:%s]", statusCode, url));
        }
        finally {
            // 释放连接
            if(br != null)br.close();
            postMethod.releaseConnection();
            ((SimpleHttpConnectionManager)httpClient.getHttpConnectionManager()).shutdown();
        }
    }
	/**
	 * POST请求
	 * @param url
	 * @param connectionTimeout	连接超时时间(单位毫秒)
	 * @param retryCount
	 * @param postData
	 * @return
	 * @throws Exception
	 */
	public static String postResponseBodyAsString(String url, int connectionTimeout, int retryCount, 
			Map<String,String> postData,String contentType)throws Exception{
	    PostMethod postMethod = new PostMethod(url);
	    postMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler(retryCount, false)); 
	    if(StringUtils.isBlank(contentType)) {
	    	postMethod.addRequestHeader("Content-Type","application/x-www-form-urlencoded");
	    }else {
	    	postMethod.addRequestHeader("Content-Type",contentType);
	    }
	    HttpClient httpClient = new HttpClient();    
	    // 设置连接超时时间(单位毫秒)
		httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(connectionTimeout);
		
	    //post请求参数
	    NameValuePair[] parametersBody = new NameValuePair[postData.size()];
	    int i = 0;
	    for(Map.Entry<String, String> entry: postData.entrySet()){
	    	parametersBody[i++] = new NameValuePair(entry.getKey(), entry.getValue());
	    }
	    postMethod.setRequestBody(parametersBody);
	    logger.debug("post content:\n"+postMethod.getResponseBodyAsString());
	    BufferedReader br = null;
	    int statusCode = -1;
		try {
			statusCode = httpClient.executeMethod(postMethod);
			if (statusCode == HttpStatus.SC_OK) {
				// Because of the WARNING "getResponseBody Going to buffer response body of large or unknown size. Using getResponseBodyAsStream instead is recommended."
				// use the getResponseBodyAsStream() instead of getResponseBodyAsString()
				// by Lionheart 2013.8.16
				br = new BufferedReader(new InputStreamReader(postMethod.getResponseBodyAsStream(),"UTF-8"));
				StringBuffer sb = new StringBuffer();  
				String str= "";  
				while((str = br.readLine()) != null){  
					sb .append(str);  
				}
				return sb.toString();
//				return postMethod.getResponseBodyAsString();
			}
			else{
				throw new Exception(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url));
			}
		}
		catch (HttpException e) {
			// 发生致命的异常，可能是协议不对或者返回的内容有问题
            logger.error(e);
			logger.error(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url), e);
			throw new Exception(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url));
		} 
		catch (IOException e) {
			// 发生网络异常
            logger.error(e);
			logger.error(String.format("HTTP请求失败，IO异常，[statusCode:%s][url:%s]", statusCode, url), e);
			throw new Exception(String.format("HTTP请求失败，IO异常，[statusCode:%s][url:%s]", statusCode, url));
		} 
		catch (Exception e) {
            logger.error(e);
			logger.error(String.format("HTTP请求失败，未知异常，[statusCode:%s][url:%s]", statusCode, url), e);
			throw new Exception(String.format("HTTP请求失败，未知异常，[statusCode:%s][url:%s]", statusCode, url));
		} 
		finally {
			// 释放连接
			if(br != null)br.close();
			postMethod.releaseConnection();
			((SimpleHttpConnectionManager)httpClient.getHttpConnectionManager()).shutdown(); 
		}
	}
	/**
	 * post 文件上传
	 * @param url
	 * @param connectionTimeout
	 * @param retryCount
	 * @param datas	键值对
	 * @param files	文件名-文件流
	 * @return
	 * @throws Exception
	 */
	public static String postResponseBodyAsString(String url, int connectionTimeout, int retryCount, 
			Map<String,String> datas, Map<String,byte[]> files)throws Exception{
		PostMethod postMethod = new PostMethod(url);
		postMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler(retryCount, false)); 
//		postMethod.addRequestHeader("Content-Type","text/html;charset=UTF-8");
		HttpClient httpClient = new HttpClient();    
		// 设置连接超时时间(单位毫秒)
		httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(connectionTimeout);
		int paramsLen = 0;
		if(datas!=null) paramsLen = datas.size();
		if(files!=null) paramsLen += files.size();
		Part[] parts = new Part[paramsLen];
		int index = 0;
		//加入键值对
		for(Map.Entry<String, String> entry: datas.entrySet()){
			parts[index++] = new StringPart(entry.getKey(), entry.getValue(), "UTF-8");
	    }
		//加入文件
		for(Map.Entry<String, byte[]> entry: files.entrySet()){
			String fileName = entry.getKey();
//			InputStream is = entry.getValue();
//			ByteArrayOutputStream baos = new ByteArrayOutputStream();  
//			int len = 0;  
//			byte[] b = new byte[1024];  
//			while ((len = is.read(b, 0, b.length)) != -1) {  
//			    baos.write(b, 0, len);  
//			}
//			byte[] buffer =  baos.toByteArray();  
			FilePart filePart = new FilePart(fileName, new ByteArrayPartSource(fileName, entry.getValue()));
//			FilePart filePart = new FilePart("file", new ByteArrayPartSource(fileName, entry.getValue()));
			parts[index++] = filePart;
	    }
		postMethod.setRequestEntity(new MultipartRequestEntity(parts, postMethod.getParams()));  
		logger.debug("post content:\n"+postMethod.getResponseBodyAsString());
		BufferedReader br = null;
		int statusCode = -1;
		try {
			statusCode = httpClient.executeMethod(postMethod);
			if (statusCode == HttpStatus.SC_OK) {
				br = new BufferedReader(new InputStreamReader(postMethod.getResponseBodyAsStream(),"UTF-8"));
				StringBuffer sb = new StringBuffer();  
				String str= "";  
				while((str = br.readLine()) != null){  
					sb .append(str);  
				}
				return sb.toString();
			}
			else{
				throw new Exception(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url));
			}
		}
		catch (HttpException e) {
			// 发生致命的异常，可能是协议不对或者返回的内容有问题
            logger.error(e);
			logger.error(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url), e);
			throw new Exception(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url));
		} 
		catch (IOException e) {
			// 发生网络异常
            logger.error(e);
			logger.error(String.format("HTTP请求失败，IO异常，[statusCode:%s][url:%s]", statusCode, url), e);
			throw new Exception(String.format("HTTP请求失败，IO异常，[statusCode:%s][url:%s]", statusCode, url));
		} 
		catch (Exception e) {
			logger.error(e);
			logger.error(String.format("HTTP请求失败，未知异常，[statusCode:%s][url:%s]", statusCode, url), e);
			throw new Exception(String.format("HTTP请求失败，未知异常，[statusCode:%s][url:%s]", statusCode, url));
		} 
		finally {
			// 释放连接
			if(br != null)br.close();
			postMethod.releaseConnection();
			((SimpleHttpConnectionManager)httpClient.getHttpConnectionManager()).shutdown(); 
		}
	}
	public static String postResponseBodyAsString(String url, Map<String,String> datas, Map<String,byte[]> files)throws Exception{
		return postResponseBodyAsString(url, CONNECTION_TIMEOUT_DEF, RETRY_COUNT_DEF, datas, files);
	}
	public static String postResponseBodyAsString(String url, int connectionTimeout, int retryCount, 
			String jsonStr)throws Exception{
		logger.debug("请求URL："+url);
		PostMethod postMethod = new PostMethod(url);
		postMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler(retryCount, false)); 
	    postMethod.addRequestHeader("Content-Type","application/json;charset=UTF-8");
		HttpClient httpClient = new HttpClient();    
		// 设置连接超时时间(单位毫秒)
		httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(connectionTimeout);
		
		//post请求参数
//		postMethod.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, "UTF-8");
//		InputStream is = new ByteArrayInputStream(content.getBytes());  
		postMethod.setRequestBody(jsonStr);
		BufferedReader br = null;
		int statusCode = -1;
		try {
			statusCode = httpClient.executeMethod(postMethod);
			if (statusCode == HttpStatus.SC_OK) {
				// Because of the WARNING "getResponseBody Going to buffer response body of large or unknown size. Using getResponseBodyAsStream instead is recommended."
				// use the getResponseBodyAsStream() instead of getResponseBodyAsString()
				// by Lionheart 2013.8.16
				br = new BufferedReader(new InputStreamReader(postMethod.getResponseBodyAsStream(),"UTF-8"));
				StringBuffer sb = new StringBuffer();  
				String str= "";  
				while((str = br.readLine()) != null){  
					sb .append(str);  
				}
				return sb.toString();
//				return postMethod.getResponseBodyAsString();
			}
			else{
				throw new Exception(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url));
			}
		}
		catch (HttpException e) {
			// 发生致命的异常，可能是协议不对或者返回的内容有问题
            logger.error(e);
			logger.error(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url), e);
			throw new Exception(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url));
		} 
		catch (IOException e) {
			// 发生网络异常
            logger.error(e);
			logger.error(String.format("HTTP请求失败，IO异常，[statusCode:%s][url:%s]", statusCode, url), e);
			throw new Exception(String.format("HTTP请求失败，IO异常，[statusCode:%s][url:%s]", statusCode, url));
		} 
		catch (Exception e) {
            logger.error(e);
			logger.error(String.format("HTTP请求失败，未知异常，[statusCode:%s][url:%s]", statusCode, url), e);
			throw new Exception(String.format("HTTP请求失败，未知异常，[statusCode:%s][url:%s]", statusCode, url));
		} 
		finally {
			// 释放连接
			if(br != null)br.close();
			postMethod.releaseConnection();
			((SimpleHttpConnectionManager)httpClient.getHttpConnectionManager()).shutdown(); 
		}
	}
	public static String postResponseBodyAsString(String url, String content)throws Exception{
		return postResponseBodyAsString(url, CONNECTION_TIMEOUT_DEF, RETRY_COUNT_DEF, content);
	}
	public static String postResponseBodyAsString(String url, int connectionTimeout, int soTimeOut, int retryCount, 
			Map<String,String> postData)throws Exception{
		PostMethod postMethod = new PostMethod(url);
		postMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler(retryCount, false)); 
	    postMethod.addRequestHeader("Content-Type","text/html;charset=UTF-8");
		HttpClient httpClient = new HttpClient();    
		// 设置连接超时时间(单位毫秒)
		httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(connectionTimeout);
		httpClient.getHttpConnectionManager().getParams().setSoTimeout(soTimeOut);
		
		//post请求参数
		NameValuePair[] parametersBody = new NameValuePair[postData.size()];
		int i = 0;
		for(Map.Entry<String, String> entry: postData.entrySet()){
			parametersBody[i++] = new NameValuePair(entry.getKey(), entry.getValue());
		}
		postMethod.setRequestBody(parametersBody);
		BufferedReader br = null;
		int statusCode = -1;
		try {
			statusCode = httpClient.executeMethod(postMethod);
			if (statusCode == HttpStatus.SC_OK) {
				// Because of the WARNING "getResponseBody Going to buffer response body of large or unknown size. Using getResponseBodyAsStream instead is recommended."
				// use the getResponseBodyAsStream() instead of getResponseBodyAsString()
				// by Lionheart 2013.8.16
				br = new BufferedReader(new InputStreamReader(postMethod.getResponseBodyAsStream(),"UTF-8"));
				StringBuffer sb = new StringBuffer();  
				String str= "";  
				while((str = br.readLine()) != null){  
					sb .append(str);  
				}
				return sb.toString();
//				return postMethod.getResponseBodyAsString();
			}
			else{
				throw new Exception(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url));
			}
		}
		catch (HttpException e) {
			// 发生致命的异常，可能是协议不对或者返回的内容有问题
            logger.error(e);
			logger.error(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url), e);
			throw new Exception(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url));
		} 
		catch (IOException e) {
			// 发生网络异常
            logger.error(e);
			logger.error(String.format("HTTP请求失败，IO异常，[statusCode:%s][url:%s]", statusCode, url), e);
			throw new Exception(String.format("HTTP请求失败，IO异常，[statusCode:%s][url:%s]", statusCode, url));
		} 
		catch (Exception e) {
            logger.error(e);
			logger.error(String.format("HTTP请求失败，未知异常，[statusCode:%s][url:%s]", statusCode, url), e);
			throw new Exception(String.format("HTTP请求失败，未知异常，[statusCode:%s][url:%s]", statusCode, url));
		} 
		finally {
			// 释放连接
			if(br != null)br.close();
			postMethod.releaseConnection();
			((SimpleHttpConnectionManager)httpClient.getHttpConnectionManager()).shutdown(); 
		}
	}
	public static String postResponseBodyAsString(String url, Map<String,String> postData)throws Exception{
		return postResponseBodyAsString(url, CONNECTION_TIMEOUT_DEF, RETRY_COUNT_DEF, postData);
	}
	
	private static void testPostFile()throws Exception{
		String url = "http://127.0.0.1/cjcloud/sys/file/upload";
		Map<String,String> datas = new HashMap<String, String>();
		datas.put("name", "三是了看没看");
		Map<String,byte[]> files = new HashMap<String, byte[]>();
		files.put("服务.json", fileToByteArr(new File("C:/yyzz.jpg")));
//		files.put("服务.json", fileToByteArr(new File("C:/服务.json")));
		String result = postResponseBodyAsString(url, datas, files);
		System.out.println(result);
	}
	
	private static byte[] fileToByteArr(File file)throws Exception{
		InputStream is = null;
		try {
			is = new FileInputStream(file);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();  
			int len = 0;  
			byte[] b = new byte[1024];  
			while ((len = is.read(b, 0, b.length)) != -1) {  
				baos.write(b, 0, len);  
			}
			byte[] buffer =  baos.toByteArray();  
			return buffer;
		} finally {
			if(is != null)is.close();
		}
	}

	/**
	 * 接口使用
	 * 
	 * @param url
	 * @param jsonParam
	 * @param headerParams:请求头参数
	 * @return
	 */
	public static String postResponseBodyAsString(String url, String jsonParam, Map<String, String> headerParams) {
		PostMethod postMethod = null;
		String result = null;
		BufferedReader br = null;
		try {
			postMethod = new PostMethod(url);
			// 设置编码，防止中文乱码
			postMethod.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, "UTF-8");
		    postMethod.addRequestHeader("Content-Type","application/json;charset=UTF-8");
			if (jsonParam != null && jsonParam.length() > 0) {
				postMethod.setRequestBody(jsonParam);
			}
			if (headerParams != null) {
				for (String key : headerParams.keySet()) {
					postMethod.setRequestHeader(key, headerParams.get(key));
				}
			}
			HttpClient client = new HttpClient();
			// 设置连接超时时间(单位毫秒)
			client.getHttpConnectionManager().getParams().setConnectionTimeout(CONNECTION_TIMEOUT_DEF);
			
			int statusCode = client.executeMethod(postMethod);
			if (statusCode == HttpStatus.SC_OK) {
//				result = postMethod.getResponseBodyAsString();
				br = new BufferedReader(new InputStreamReader(postMethod.getResponseBodyAsStream(),"UTF-8"));
				StringBuffer sb = new StringBuffer();  
				String str= "";  
				while((str = br.readLine()) != null){  
					sb .append(str);  
				}
				return sb.toString();
			} else {
				throw new Exception(String.format("HTTP请求失败[statusCode:%s][url:%s]", statusCode, url));
			}
		} catch (Exception e) {
            logger.error(e);
		} finally {
			try {
				if(br != null)br.close();
			} catch (IOException e) {
                logger.error(e);
			}
			if (postMethod != null) {
				postMethod.releaseConnection();
			}
		}
		return result;
	}
}
