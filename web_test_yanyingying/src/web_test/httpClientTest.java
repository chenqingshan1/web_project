package web_test;

import java.net.URLDecoder;  

import org.apache.commons.httpclient.HttpClient;  
import org.apache.commons.httpclient.methods.PostMethod;  
  
  
/** 
 * @title 
 * @descriptor 
 * @author zy 
 * @version 2013-8-26 
 */  
public class httpClientTest {  
      
    @SuppressWarnings("deprecation")
	public static void main(String[] args) throws Exception {  
          
        int responseCode = 0;  
        try {  
            String url = "http://192.168.1.166:28080/dealdata/resetExpireTime.json";  
            HttpClient client = new HttpClient();  
            PostMethod postMethod = new PostMethod(url);  
            postMethod.addParameter("jid","5691693");
            postMethod.addParameter("date","2017-08-15");
  
            responseCode = client.executeMethod(postMethod);  
            if (responseCode == 200) {  
                String callBackString = postMethod.getResponseBodyAsString();  
                System.out.println("请求返回结果为:" + URLDecoder.decode(callBackString));  
  
            } else {  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        System.out.println("网页代码" + responseCode);  
  
    }  
}
