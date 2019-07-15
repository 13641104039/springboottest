package com.example.springboot.web;

import com.example.springboot.mapper.StudentMapper;
import com.example.springboot.mqutil.FanoutProducer;
import com.example.springboot.pojo.Student;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.amqp.core.MessagePostProcessor;
import org.springframework.amqp.core.MessageProperties;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
import java.util.UUID;

@Controller
@Api(tags = "test公司Controller")
public class StudentController {

    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private FanoutProducer fanoutProducer;


    @ApiOperation(value = "添加一条test公司信息", notes = "添加一条test公司信息")
    @ApiImplicitParam(name = "students", value = "学生号", required = true, dataType = "String", paramType = "query")
    @RequestMapping(value = "/listStudent", method = RequestMethod.GET)
    public String listStudent(Model model) {
        List<Student> students = studentMapper.findAll();
        model.addAttribute("students", students);
        return "listStudent";
    }


    @RequestMapping("/sendMsg")
    public String  sendMsg(String queueName) {
        fanoutProducer.send(queueName);
        return "success";
    }


}
