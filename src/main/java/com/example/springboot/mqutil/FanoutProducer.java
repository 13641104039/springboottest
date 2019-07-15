package com.example.springboot.mqutil;

import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class FanoutProducer {
    @Autowired
    private AmqpTemplate amqpTemplate;

    public void send(String queueName) {
        System.out.println("queueName"+queueName);
        String mString="msg"+new Date();
        amqpTemplate.convertAndSend(queueName,mString);  //发送消息
    }

}
