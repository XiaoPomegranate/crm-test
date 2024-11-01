package com.itszb.crm.pojo;

import lombok.Data;

@Data
public class Market {
    private String id;
    private String owner;
    private String name;
    private String startDate;
    private String endDate;
    private String cost;
    private String description;
    private String createBy;
    private String createTime;
    private String editBy;
    private String editTime;
}
