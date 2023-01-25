package vn.dating.chat.configs.socket;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.messaging.simp.stomp.StompCommand;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptor;
import org.springframework.messaging.support.MessageHeaderAccessor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

import java.security.Principal;
import java.util.List;

@Configuration
@EnableWebSocketMessageBroker
@Slf4j
public class WebSocketBrokerConfig implements WebSocketMessageBrokerConfigurer {


    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        config.enableSimpleBroker("/topic");
        config.setApplicationDestinationPrefixes("/ws");
        config.setUserDestinationPrefix("/user/{username}");

    }

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/ws")
                .setHandshakeHandler(new UserHandSakeHandler())
                .setAllowedOriginPatterns("*").withSockJS();
    }

    @Override
    public void configureClientInboundChannel(ChannelRegistration registration) {
        registration.interceptors(new ChannelInterceptor() {
            @Override
            public Message<?> preSend(Message<?> message, MessageChannel channel) {
                StompHeaderAccessor accessor =
                        MessageHeaderAccessor.getAccessor(message, StompHeaderAccessor.class);
                if (StompCommand.CONNECT.equals(accessor.getCommand())) {

                    Principal principal = accessor.getUser();
                    log.info("principal {}",principal);

                    List<String> authorization = accessor.getNativeHeader("Authorization");

                    if(authorization !=null){
                        String token = "";
                        for(int i=0;i<authorization.size();i++){
                            if(authorization.get(0).indexOf("Bearer ")>-1) token = authorization.get(i);
                        }






                        log.info(token);
                    }

                }

                return message;
            }
        });


    }



}



    //    @Override
//    public void configureClientInboundChannel(ChannelRegistration registration) {
//
//
//        registration.interceptors(new ChannelInterceptor() {
//            @Override
//            public Message<?> preSend(Message<?> message, MessageChannel channel) {
//                log.info("test new");
//                StompHeaderAccessor accessor =
//                        MessageHeaderAccessor.getAccessor(message, StompHeaderAccessor.class);
//                if (StompCommand.CONNECT.equals(accessor.getCommand())) {
//                    Authentication user = null;
//                    accessor.setUser(user);
//                }
//                return message;
//            }
//        });
//    }

//    @Override
//    public void configureClientOutboundChannel(ChannelRegistration registration) {
//                registration.interceptors(new ChannelInterceptor() {
//            @Override
//            public Message<?> preSend(Message<?> message, MessageChannel channel) {
//                log.info("test new");
//
//                StompHeaderAccessor accessor =
//                        MessageHeaderAccessor.getAccessor(message, StompHeaderAccessor.class);
//                log.info("accessor {}",accessor.toString());
//                if (StompCommand.CONNECT.equals(accessor.getCommand())) {
//                    Authentication user = null;
//                    accessor.setUser(user);
//                }
//                return message;
//            }
//        });
//    }


    //    @Override
//    protected boolean sameOriginDisabled() {
//        return true;
//    }