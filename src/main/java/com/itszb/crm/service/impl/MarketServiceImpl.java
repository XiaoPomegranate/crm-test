package com.itszb.crm.service.impl;

import com.itszb.crm.mapper.MarketMapper;
import com.itszb.crm.pojo.Market;
import com.itszb.crm.service.MarketService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MarketServiceImpl implements MarketService {
    @Resource
    private MarketMapper marketMapper;
    @Override
    public int insertMarket(Market market) {
        return marketMapper.insertMarket(market);
    }

    @Override
    public List<Market> selectAllMarket() {
        return marketMapper.selectAllMarket();
    }

    @Override
    public int updateMarket(Market market) {
        return marketMapper.updateMarket(market);
    }

    @Override
    public Market selectMarketById(String id) {
        return marketMapper.selectMarketById(id);
    }

    @Override
    public int deleteMarketById(String id) {
        return marketMapper.deleteMarket(id);
    }
}
