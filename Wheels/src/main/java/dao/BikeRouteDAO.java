package dao;

import common.JDBConnect;
import java.sql.*;
import java.util.*;

public class BikeRouteDAO extends JDBConnect {
    
    public List<String> getCoordinatesForRoute(int routeNumber) {
        List<String> coordinates = new ArrayList<>();
        String sql = "SELECT B_X AS latitude, B_Y AS longitude FROM bike_route WHERE B_Road = ? ORDER BY B_Order";
        try (PreparedStatement psmt = con.prepareStatement(sql)) {
            psmt.setInt(1, routeNumber);
            ResultSet rs = psmt.executeQuery();
            while (rs.next()) {
                String lat = rs.getString("latitude");
                String lon = rs.getString("longitude");
                coordinates.add(lat + "," + lon);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // 예외 발생 시 출력
        }
        return coordinates;
    }
}
