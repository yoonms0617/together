package com.sist.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

import com.sist.vo.CustomerVO;

import com.sist.service.CustomerService;

@RestController
@RequestMapping("/customer")
public class CustomerRestController {

    @Autowired
    private CustomerService service;

    // VusJS에서 페이지 전송
    @GetMapping("/list_vue.do")
    public String cs_list(int page) {
        Map map = new HashMap();
        map.put("start", (page * 10) - 9);
        map.put("end", page * 10);

        List<CustomerVO> cslist = service.csBoardListData(map);
        int totalpage = service.csBoardTotalPage();

        // json변환
        JSONArray arr = new JSONArray();
        int i = 0;
        for (CustomerVO vo : cslist) {
            JSONObject obj = new JSONObject();
            obj.put("nno", vo.getNno());
            obj.put("subject", vo.getSubject());
            obj.put("name", vo.getName());
            obj.put("dbday", vo.getDbday());
            obj.put("hit", vo.getHit());

            if (i == 0) {
                obj.put("curpage", page);
                obj.put("totalpage", totalpage);
            }
            arr.add(obj);
            i++;
        }
        return arr.toJSONString();
    }

    @GetMapping("/insert_vue.do")
    public String cs_insert(CustomerVO vo) {
        service.csBoardInserst(vo);
        return "";
    }

    @GetMapping("/detail_vue.do")
    public String cs_detail(int nno) {
        CustomerVO vo = service.csBoardDetailData(nno);

        JSONObject obj = new JSONObject();
        obj.put("nno", vo.getNno());
        obj.put("subject", vo.getSubject());
        obj.put("name", vo.getName());
        obj.put("dbday", vo.getDbday());
        obj.put("hit", vo.getHit());
        obj.put("content", vo.getContent());

        return obj.toJSONString();
    }

    @GetMapping("/update_vue.do")
    public String cs_update(int nno) {
        CustomerVO vo = service.csBoardDetailData(nno);

        JSONObject obj = new JSONObject();
        obj.put("nno", vo.getNno());
        obj.put("subject", vo.getSubject());
        obj.put("name", vo.getName());
        //obj.put("dbday", vo.getDbday());
        //obj.put("hit", vo.getHit());
        obj.put("content", vo.getContent());

        return obj.toJSONString();
    }

    @GetMapping("/update_ok_vue.do")
    public String cs_update_ok(CustomerVO vo) {
        return service.csBoardUpdate(vo);
    }

    @GetMapping("/delete_vue.do")
    public String cs_delete_ok(int nno, String pwd) {
        return service.csBoardDelete(nno, pwd);
    }


}