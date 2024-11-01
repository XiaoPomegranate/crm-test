package com.itszb.crm.web.controller;

import com.itszb.crm.constant.MyConstants;
import com.itszb.crm.pojo.Market;
import com.itszb.crm.pojo.Users;
import com.itszb.crm.service.MarketService;
import com.itszb.crm.utils.UUIDUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/market")
public class MarketController {
    @Resource
    private MarketService marketService;
    @Resource
    private HttpSession session;

    @PostMapping("/saveMarket")
    @ResponseBody
    public Map saveMarket(Market market) {
        market.setId(UUIDUtils.getUUID());
        Users loginUser = (Users) session.getAttribute(MyConstants.LOGIN_USER);
        market.setCreateBy(loginUser.getLoginAct());
        market.setCreateTime(MyConstants.sdf19.format(new Date()));
        market.setEditBy(loginUser.getLoginAct());
        market.setEditTime(MyConstants.sdf19.format(new Date()));
        int i = marketService.insertMarket(market);

        return new HashMap() {{
            put("success", i > 0);
        }};
    }

    @GetMapping("/selectAllMarket")
    @ResponseBody
    public List<Market> selectAllMarket() {
        List<Market> markets = marketService.selectAllMarket();
        //网页展示10位日期格式
        for (Market market : markets) {
            market.setStartDate(market.getStartDate().substring(0, 10));
            market.setEndDate(market.getEndDate().substring(0, 10));
        }
        return markets;
    }

    @PutMapping("/updateMarket")
    @ResponseBody
    public Map updateMarket(Market market) {
        System.out.println(market);
        int i = marketService.updateMarket(market);

        return new HashMap() {{
            put("success", i > 0);
        }};
    }

    @GetMapping("/selectMarketById")
    @ResponseBody
    public Market selectMarketById(String id) {
        return marketService.selectMarketById(id);
    }

    @DeleteMapping("/deleteMarketById")
    @ResponseBody
    public Map deleteMarketById(@RequestParam("ids[]") List<String> ids){
        int i = 0;
        Map map = new HashMap();
        for (String id : ids) {
            marketService.deleteMarketById(id);
            i++;
        }
        map.put("success",i > 0);
        return map;
    }
}
