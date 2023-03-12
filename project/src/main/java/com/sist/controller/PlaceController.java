package com.sist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.sist.service.*;
import com.sist.vo.*;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PlaceController {
    @Autowired
    private PlaceService service;

    @GetMapping("place/place_list.do")
    @ResponseBody
    public List<PlaceVO> place_list() {

        List<PlaceVO> placeList = service.PlaceListData();

        for (PlaceVO vo : placeList) {
            String[] tokens = vo.getTitle().split(" ", 2);
            String title = tokens[0];
            String subtitle = tokens[1];
            vo.setTitle(title);
            vo.setSubtitle(subtitle);
            System.out.println(title);
            System.out.println(subtitle);

            String[] images = vo.getImage().split(",");
            String image = images[0];
            vo.setImage(image);
            System.out.println(image);
        }

        return placeList;
    }

    @GetMapping("place/place_detail.do")
    @ResponseBody
    public String place_detail(int pno, Model model) {
        List<PlaceVO> placeDetailData = service.placeDetailData(pno);

        for (PlaceVO vo : placeDetailData) {
            String[] tokens = vo.getTitle().split(" ", 2);
            String title = tokens[0];
            String subtitle = tokens[1];
            vo.setTitle(title);
            vo.setSubtitle(subtitle);
            System.out.println(title);
            System.out.println(subtitle);

            String[] images = vo.getImage().split(",");
            String image = images[0];
            vo.setImage(image);
            System.out.println(image);

            if (vo.getOpenHour() == null) {
                vo.setOpenHour("정보가 없습니다.");
            }
            System.out.println(vo.getOpenHour());
        }
        model.addAttribute("placeDetailData", placeDetailData);

        return "place/place_detail";
    }
}
