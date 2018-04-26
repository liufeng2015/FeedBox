package com.fh.plugin;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<String> list = new ArrayList<String>();
        list.add("111");
        list.add("222");
        list.add("111");
        list.add("333");
        list.add("222");
        list.add("aaa");
        List<String> list2 = new ArrayList<String>();
        list2.add("bbb");
        list2.add("cccc");
        list2.add("111");
        list.addAll(list2);
        Set h = new HashSet(list);
        list.clear();
        list.addAll(h);
        System.out.println("==============="+list);
	}

}
