package com.example.springboot.web;


import com.example.springboot.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class HelloController {
//    @Value("${name}")
//    private String name;
//    @Value("${age}")
//    private Integer age;
    @Autowired
    RedisUtil redisUtil;

    @RequestMapping("/hello")
    public String hello(Model m) {

        redisUtil.set("date",new Date());
        redisUtil.set("name","朱磊");
        m.addAttribute("now", DateFormat.getDateTimeInstance().format(new Date()));
        m.addAttribute("redisdate",redisUtil.get("date"));
        m.addAttribute("name",redisUtil.get("name"));
        return "hello";
    }



}
