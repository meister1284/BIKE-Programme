package common;

import java.security.MessageDigest;

public class HashUtil {
    public static String hashPassword(String password) {
        try {
            // SHA-256 해시 생성
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedPassword = md.digest(password.getBytes("UTF-8"));
            
            // 바이트 배열을 16진수 문자열로 변환
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedPassword) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString(); // 해시된 비밀번호 반환
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}