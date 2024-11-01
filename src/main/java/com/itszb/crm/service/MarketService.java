package com.itszb.crm.service;

import com.itszb.crm.pojo.Market;

import java.util.List;

public interface MarketService {
    //增加市场活动
    int insertMarket(Market market);

    //展示所有信息
    List<Market> selectAllMarket();

    //更新操作
    int updateMarket(Market market);

    //根据ID查询
    Market selectMarketById(String id);

    //根据ID删除
    int deleteMarketById(String id);
}
