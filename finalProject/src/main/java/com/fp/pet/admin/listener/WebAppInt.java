package com.fp.pet.admin.listener;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class WebAppInt implements ServletContextListener {

    private String pathname = "/WEB-INF/user.properties";
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // 서버가 시작되는 시점에 호출
        // 다른 초기화 로직 수행
    	pathname = sce.getServletContext().getRealPath(pathname);
        loadFile();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // 서버가 종료되는 시점에 호출
        // 다른 소멸 로직 수행
        saveFile();
    }

    protected void loadFile() {
        // 서버에 저장된 접속자 수 불러오기
        long toDay, yesterDay, total;
        Properties p = new Properties();

        File f = new File(pathname);
        if (!f.exists()) {
            return;
        }

        try (FileInputStream fis = new FileInputStream(f)) {
            // 파일의 내용을 읽어 프로퍼티에 담기
            p.load(fis);

            toDay = Long.parseLong(p.getProperty("toDay"));
            yesterDay = Long.parseLong(p.getProperty("yesterDay"));
            total = Long.parseLong(p.getProperty("total"));

            CountManage.init(toDay, yesterDay, total);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void saveFile() {
        // 서버에 접속자 수를 프로퍼티 파일로 저장하기
        long toDay, yesterDay, total;
        Properties p = new Properties();

        try (FileOutputStream fos = new FileOutputStream(pathname)) {
            toDay = CountManage.getToDayCount();
            yesterDay = CountManage.getYesterDayCount();
            total = CountManage.getTotalCount();

            p.setProperty("toDay", Long.toString(toDay));
            p.setProperty("yesterDay", Long.toString(yesterDay));
            p.setProperty("total", Long.toString(total));

            // 프로퍼티 내용을 파일에 저장
            p.store(fos, "count");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}