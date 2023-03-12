package com.sist.service;

import com.sist.mapper.PlaceMapper;
import com.sist.vo.PlaceVO;
import org.springframework.beans.factory.annotation.Autowired;
import com.sist.vo.*;
import org.springframework.stereotype.Service;

import java.util.*;
@Service
public class PlaceService {
    @Autowired
    private PlaceMapper mapper;
    public List<PlaceVO> PlaceListData() {
        return mapper.PlaceListData();
    }

    public List<PlaceVO> placeDetailData(int pno) {
        return mapper.placeDetailData(pno);
    }
}
