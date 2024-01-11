package com.fp.pet.admin.listener;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.scheduling.annotation.Scheduled;

@WebListener
public class CountManage implements HttpSessionListener {

	private static int currentCount;
	private static long toDayCount;
	private static long yesterDayCount;
	private static long totalCount;

	public static void init(long toDay, long yesterDay, long total) {
		toDayCount = toDay;
		yesterDayCount = yesterDay;
		totalCount = total;
	}

	@Scheduled(cron = "0 0 0 * * ?") // 매일 0시에 실행
	public static void resetDailyCount() {
		yesterDayCount = toDayCount;
		toDayCount = 0;
	}

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// 세션이 만들어질 때
		HttpSession session = se.getSession();
		ServletContext context = session.getServletContext();

		synchronized (se) { // 동기화 블럭
			currentCount++;
			toDayCount++;
			totalCount++;

			context.setAttribute("currentCount", currentCount);
			context.setAttribute("toDayCount", toDayCount);
			context.setAttribute("totalCount", totalCount);
			context.setAttribute("yesterDayCount", yesterDayCount);
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// 세션이 소멸되기 직전
		HttpSession session = se.getSession();
		ServletContext context = session.getServletContext();

		synchronized (se) { // 동기화 블럭
			currentCount--;
			if (currentCount < 0)
				currentCount = 0;
			context.setAttribute("currentCount", currentCount);
			context.setAttribute("toDayCount", toDayCount);
			context.setAttribute("totalCount", totalCount);
			context.setAttribute("yesterDayCount", yesterDayCount);
		}
	}

	public static int getCurrentCount() {
		return currentCount;
	}

	public static long getToDayCount() {
		return toDayCount;
	}

	public static long getYesterDayCount() {
		return yesterDayCount;
	}

	public static long getTotalCount() {
		return totalCount;
	}
}
