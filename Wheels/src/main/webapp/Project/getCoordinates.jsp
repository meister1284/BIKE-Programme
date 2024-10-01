<%@ page language="java" contentType="application/json; charset=UTF-8" %>
<%@ page import="dao.BikeRouteDAO" %>
<%@ page import="java.util.*" %>
<%
    response.setContentType("application/json");
    String routeParam = request.getParameter("route");
    int routeNumber = 0; // 기본값 설정

    try {
        if (routeParam != null && !routeParam.isEmpty()) {
            routeNumber = Integer.parseInt(routeParam); // URL 파라미터에서 route 가져오기
        } else {
            throw new IllegalArgumentException("Route parameter is missing or invalid.");
        }

        BikeRouteDAO bikeRouteDAO = new BikeRouteDAO();
        List<String> coordinates = bikeRouteDAO.getCoordinatesForRoute(routeNumber);

        // JSON 형식으로 반환
        StringBuilder jsonResponse = new StringBuilder();
        jsonResponse.append("{\"coordinates\":[");

        for (int i = 0; i < coordinates.size(); i++) {
            jsonResponse.append("\"").append(coordinates.get(i)).append("\"");
            if (i < coordinates.size() - 1) {
                jsonResponse.append(",");
            }
        }
        jsonResponse.append("]}");
        
        response.getWriter().write(jsonResponse.toString());
    } catch (Exception e) {
        e.printStackTrace();
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        response.getWriter().write("{\"error\":\"" + e.getMessage() + "\"}");
    }
%>
