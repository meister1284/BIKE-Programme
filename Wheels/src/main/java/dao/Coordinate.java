package dao;

public class Coordinate {
    private double lat; // 위도
    private double lng; // 경도

    public Coordinate(double lat, double lng) {
        this.lat = lat;
        this.lng = lng;
    }

    public double getLat() {
        return lat;
    }

    public double getLng() {
        return lng;
    }
}
