package com.ispan6.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.AlipayConfig;
import com.alipay.api.DefaultAlipayClient;

@Configuration
public class AlipaySandboxConfig {

	@Bean
	public AlipayClient alipayClient() throws AlipayApiException {
		
		AlipayConfig alipayConfig = new AlipayConfig();
		//设置网关地址
		alipayConfig.setServerUrl("https://openapi.alipaydev.com/gateway.do");
		//设置应用APPID
		alipayConfig.setAppId("2021000121696936");
		//设置应用私钥
		alipayConfig.setPrivateKey("MIIEwAIBADANBgkqhkiG9w0BAQEFAASCBKowggSmAgEAAoIBAQCpOFxBJ7lAUtW2MOBb6GyArfezIjiau92Ib/pUzY/N1xJatWeSCaCeih9pjFPVtBOCb4yk7bSKXNVGVJuiJjEe9XXeF+ye0/AEtQ09BZu5j/wfOnbGRSpoHJqYdms35RXdHgR6MxRYzE6vn0u4ADhjWIjAIYwNe4CZN2Uf8PxqElCe9gDvFsGzmtU6qPf/RfSAn+AX+FFRrdQPoMsNNDaKWLNb9BlTXJBPyrJ5lP+T5sZUZ6JgFzBdpwqgW1IXUtvRzFkHTHC7hb5YpytbnzFqo5lfbCecZEemYw07KZyQ3WEMhyYEQhHaubgxac9z0pr4ubDpt3M+jWHhP5V5aK77AgMBAAECggEBAIewiNE6ECLTCUkhYhZwheidFv0OGMOClv4bhGjRuFj+91nDEnyYubHG4a9Z9bNrxSUXW3i4nsc/70iI+Y8I/uRrQQtItdUZ7uFnaGkhASDHowxLbghIV9vJ6/ELK6hTSrfWpRJzuQIHOaU7n5S4oH6Q9H7Tp6D8Aj9Zmv4E1/IY00cDz+8jCEjk8lyJD4MB7ZQ4zqGRZRyLhClyp80w8Hk7WHVDH0IByG0bcChNahG+RXV0XgzYrM5JnEryz/o/rdPs9Ta8qugeXOCD/mayrUergDOvKus/oOxQQLDRiQauMzHMJeMmwHsrilOP744kwaRoSc+qMmmjr48GD8mJnOECgYEA6w3swRBHrIpDVgvTko8xIH5md9ZmsGpx4X3HGcmHfvR8UMFcVgYlf9aNkYK3UBLMDRuEKfSJu/dm8yg/LOU5st4W2LXvYpZVenu0fDJTqbBJykjoYidfv4PUgycarLa9BSXvf2uBrS5a+gARjtS4VHpGsbKpnbJpQ8e6yC78ytECgYEAuEye9ZrvX54B2Hg0ltRGfqP5aV/uuoDIyuWRN/JBH3QrtqhuCA1IKTsan3j0mV4drLVynaCVp7DxQQjcJPnnHrbP2usva9HP7Vn4P3IWv3/jtzZHmxpE/rThQvbmzT6BrnyRfCtxURDquMyvPJKrTfnHvp/nA11B+ApXVShaeAsCgYEA4PrLCV+Tusn7+XgIYdc8pmVVno5Qa7r2lWXWFBCY6CMKeiEZSB1J9zpc9lGvM61KMaGMtruguZDrsQFstoQQ3etE4tgA8NQDrOCKt/VTrq9VcZCnHIujUaPU3FOpbHbcJPlSaxtzW1drLK60H4nrhLAkyiC/yHjj2ERruv9+ZoECgYEAksHY1uUgdnihKZpW7kBtPk0ev813kaYZvo/d+rn7J6vfX11x+RFyg/qfsZuk0zgB01TNxz1nzpf1FP+UJhGl/GxAyif7pBT4SR4as5MLEEUrtOoRTS43AMhSlHt9wLRkmehyBXmmi5I4Bx5e8JIuvTII3//++kvZy0WY06QFno8CgYEA5zcQxgeOfOnxlyUOsMWlhGVduj86eaXM2D+f9D9+Z+uZFleEy5otCPGOQj/VzLW505DQdzV628vG+tESzBVrvJDply4aBwMNjkSlxyVNyyrUXzfwesXkUrOGhx7nN+iTognuDby3MVi9TDugVXpOC9EZnKsD/KDs+A/WK/BsXDg=");
		//设置请求格式，固定值json
		alipayConfig.setFormat("json");
		//设置字符集
		alipayConfig.setCharset("utf-8");
		//设置支付宝公钥
		alipayConfig.setAlipayPublicKey("MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAh3AsGuAvJHB1OjqZ5UbaOHXlPwXsox42WrQpbdlkEPfEYOrEj4L6F6WKkJvphHkSjsY36FCU67t2dKk5ALOO5RXP+3Mzo8UgUlYUlaGdUcnQf+4fDUpTVkrz3XDzEgDyrENQp/4C6oLmoxx1B0wgOFs3xLt6TL9xruxZcCAsnM3Sxge+MzfjDYx3AH6+u0Kfrf/r5MI+zY7dRXX8gnFH5JCHk5t01cOWXI2DZ5Tl5ImdMqCIQwnWFol5ZUz7EPUST5fcXeY2Dl+g0Yuf2OjB80jfR93RQTTwQr/4vPYwQLvfSXNZPivSAS6/Qw9fdcmi/xyKRLQG2tHznA7F8e4rmQIDAQAB");
		//设置签名类型
		alipayConfig.setSignType("RSA2");
		//构造client
		AlipayClient alipayClient = new DefaultAlipayClient(alipayConfig);
		
		return alipayClient;
	}
}
