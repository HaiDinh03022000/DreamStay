package DAO;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import java.util.Base64;

public class SecureKey{
    public static void main(String[] args) throws Exception {
        SecureKey key = new SecureKey();
        // Tạo khóa an toàn
        SecretKey secretKey = key.generateSecureKey();

        // Chuỗi cần mã hóa
        String plaintext = "1";

        // Mã hóa chuỗi
        String encryptedText = key.Encode(plaintext, secretKey);

        // Giải mã chuỗi
        String decryptedText = key.Decode(encryptedText, secretKey);

        // In kết quả
        System.out.println("Plaintext: " + plaintext);
        System.out.println("Encrypted Text: " + encryptedText);
        System.out.println("Decrypted Text: " + decryptedText);
    }

    // Tạo khóa an toàn sử dụng AES
    public SecretKey generateSecureKey() throws Exception {
        KeyGenerator keyGenerator = KeyGenerator.getInstance("AES");
        keyGenerator.init(256); // Độ dài khóa là 256 bit
        return keyGenerator.generateKey();
    }

    // Mã hóa chuỗi với khóa an toàn
    public String Encode(String plaintext, SecretKey secretKey) throws Exception {
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.ENCRYPT_MODE, secretKey);
        byte[] encryptedBytes = cipher.doFinal(plaintext.getBytes());
        return Base64.getEncoder().encodeToString(encryptedBytes);
    }

    // Giải mã chuỗi với khóa an toàn
    public String Decode(String encryptedText, SecretKey secretKey) throws Exception {
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.DECRYPT_MODE, secretKey);
        byte[] encryptedBytes = Base64.getDecoder().decode(encryptedText);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        return new String(decryptedBytes);
    }
}

