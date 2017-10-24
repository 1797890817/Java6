package com.ddbin.javaweb.listener;

import java.io.Serializable;

import javax.servlet.http.HttpSessionActivationListener;
import javax.servlet.http.HttpSessionEvent;

public class Person implements Serializable, HttpSessionActivationListener {
    private String name;

    public Person(String name) {
        super();
        this.name = name;
    }

    @Override
    public void sessionWillPassivate(HttpSessionEvent se) {
        System.out.println(this + "保存到硬盘了...");
    }

    @Override
    public void sessionDidActivate(HttpSessionEvent se) {
        System.out.println(this + "从硬盘读取并活化了...");
    }

    @Override
    public String toString() {
        return "Perosn [name=" + name + "]---"+super.toString();
    }

}