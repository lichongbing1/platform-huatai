package com.platform.dto;

import com.platform.util.CommonUtil;

import java.math.BigDecimal;

/**
 * @author zhouzhengde(CN)
 * @date 2017/12/28.
 */
public class GeometryMarker {
    //
    private Long id;
    //
    private String iconPath;
    //
    private BigDecimal latitude;
    //
    private BigDecimal longitude;
    //
    private Integer width;
    //
    private Integer height;
    //
    private GeometryMarkerCallout callout;

    class GeometryMarkerCallout {
        //
        private String content;
        //
        private String color;
        //
        private String display;
        //
        private Integer padding;
        //
        private Integer borderRadius;

        public String getContent() {
            return content;
        }

        public void setContent(String content) {
            this.content = content;
        }

        public String getColor() {
            return color;
        }

        public void setColor(String color) {
            this.color = color;
        }

        public String getDisplay() {
            return display;
        }

        public void setDisplay(String display) {
            this.display = display;
        }

        public Integer getPadding() {
            return padding;
        }

        public void setPadding(Integer padding) {
            this.padding = padding;
        }

        public Integer getBorderRadius() {
            return borderRadius;
        }

        public void setBorderRadius(Integer borderRadius) {
            this.borderRadius = borderRadius;
        }
    }

    public String getIconPath() {
        return iconPath;
    }

    public void setIconPath(String iconPath) {
        this.iconPath = iconPath;
    }

    public BigDecimal getLatitude() {
        return latitude;
    }

    public void setLatitude(BigDecimal latitude) {
        this.latitude = latitude;
    }

    public BigDecimal getLongitude() {
        return longitude;
    }

    public void setLongitude(BigDecimal longitude) {
        this.longitude = longitude;
    }

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public GeometryMarkerCallout getCallout() {
        return callout;
    }

    public void setCallout(GeometryMarkerCallout callout) {
        this.callout = callout;
    }

    /**
     * 配送中的订单骑手初始化
     *
     * @param id
     * @param latitude
     * @param longitude
     * @param targetLatitude
     * @param targetLongitude
     */
    public GeometryMarker(Long id, BigDecimal latitude, BigDecimal longitude, BigDecimal targetLatitude, BigDecimal targetLongitude) {
        this.id = id;
        this.iconPath = "/static/images/rider.png";
        this.width = 40;
        this.height = 40;
        this.latitude = latitude;
        this.longitude = longitude;
        double distance = CommonUtil.getDistance(latitude.doubleValue(), longitude.doubleValue(),
                targetLatitude.doubleValue(), targetLongitude.doubleValue());
        this.callout = new GeometryMarkerCallout();
        callout.setContent("距离你" + distance + "km");
        callout.setColor("#fe7200");
        callout.setDisplay("ALWAYS");
        callout.setBorderRadius(30);
    }
}
