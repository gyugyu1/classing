
  package com.cacao.classting.chat;
  
  
  import org.springframework.context.annotation.Configuration; import
  org.springframework.messaging.simp.config.MessageBrokerRegistry; import
  org.springframework.web.socket.config.annotation.
  EnableWebSocketMessageBroker; import
  org.springframework.web.socket.config.annotation.StompEndpointRegistry;
  import org.springframework.web.socket.config.annotation.
  WebSocketMessageBrokerConfigurer;
  
  @Configuration
  
  @EnableWebSocketMessageBroker public class WebSocketConfig implements
  WebSocketMessageBrokerConfigurer {
  
  @Override public void registerStompEndpoints(StompEndpointRegistry registry)
  { registry.addEndpoint("/ctChatServer").setAllowedOrigins("*").withSockJS();
  }
  
  @Override public void configureMessageBroker(MessageBrokerRegistry config) {
  config.enableSimpleBroker("/sub"); // /sub로시작하는 msg 주소값을 받아서 처리하는 broker를 활성화
  config.setApplicationDestinationPrefixes("/"); //클라이언트는 서버로 메세지를 보낼때 /를 붙여야함.
  }
  
  
  }
  
 