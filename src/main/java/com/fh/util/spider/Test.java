package com.fh.util.spider;

import java.sql.SQLException;

/**
 * @author liuyazhuang
 *
 */
public class Test {
	public static void main(String[] args) throws SQLException {
		String url = "http://weibo.com/2620648747/F86Bi4q4W?type=comment#_rnd1497842169010";

		UrlQueue.addElem(url);

		UrlDataHanding[] url_Handings = new UrlDataHanding[10];

		for (int i = 0; i < 10; i++) {
			url_Handings[i] = new UrlDataHanding();
			new Thread(url_Handings[i]).start();
		}

	}
}