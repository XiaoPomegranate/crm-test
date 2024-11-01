package com.itszb.crm.mapper;

import com.itszb.crm.pojo.Market;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MarketMapper {
    //增加市场活动
    int insertMarket(Market market);

    //查询所有信息
    List<Market> selectAllMarket();

    //更新操作
    int updateMarket(Market market);
    //根据ID查询
    Market selectMarketById(String id);

    //根据ID删除
    int deleteMarket(String id);

}
