package com.pj.gabozago.common;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Random;
import java.util.UUID;

import lombok.extern.log4j.Log4j2;


@Log4j2
public class UUIDGenerator {

    private static final char[] hexArray = "0123456789ABCDEF".toCharArray();
    
    /***************************************************************
     * Type 1 UUID Generation
     * *************************************************************/
    public static UUID generateType1UUID() {
    	log.debug("generateType1UUID() invoked.");

        long most64SigBits = get64MostSignificantBitsForVersion1();
        long least64SigBits = get64LeastSignificantBitsForVersion1();

        return new UUID(most64SigBits, least64SigBits);
    } // generateType1UUID
    

    private static long get64LeastSignificantBitsForVersion1() {
    	log.debug("get64LeastSignificantBitsForVersion1() invoked.");
    	
        Random random = new Random();
        
        long random63BitLong = random.nextLong() & 0x3FFFFFFFFFFFFFFFL;
        long variant3BitFlag = 0x8000000000000000L;
        
        return random63BitLong + variant3BitFlag;
    } // get64LeastSignificantBitsForVersion1

    
    private static long get64MostSignificantBitsForVersion1() {
    	log.debug("get64MostSignificantBitsForVersion1() invoked.");
    	
        LocalDateTime start = LocalDateTime.of(1582, 10, 15, 0, 0, 0);
        
        Duration duration = Duration.between(start, LocalDateTime.now());
        
        long seconds = duration.getSeconds();
        long nanos = duration.getNano();
        
        long timeForUuidIn100Nanos = seconds * 10000000 + nanos * 100;
        long least12SignificatBitOfTime = (timeForUuidIn100Nanos & 0x000000000000FFFFL) >> 4;
        
        long version = 1 << 12;
        
        return (timeForUuidIn100Nanos & 0xFFFFFFFFFFFF0000L) + version + least12SignificatBitOfTime;
    } // get64MostSignificantBitsForVersion1
    

    /*************************************************************
     * Type 3 UUID Generation
     *************************************************************/
    public static UUID generateType3UUID(String namespace, String name)
			throws UnsupportedEncodingException {
    	log.debug("generateType3UUID(namespace, name) invoked.");

        byte[] nameSpaceBytes = bytesFromUUID(namespace);
        byte[] nameBytes = name.getBytes("UTF-8");
        byte[] result = joinBytes(nameSpaceBytes, nameBytes);

        return UUID.nameUUIDFromBytes(result);
    } // generateType3UUID
    

    /**************************************************************
     * Type 4 UUID Generation
     **************************************************************/
    public static UUID generateType4UUID() {
    	log.debug("generateType4UUID() invoked.");
    	
        UUID uuid = UUID.randomUUID();
        
        return uuid;
    } // generateType4UUID
    

    /**************************************************************
     * Type 5 UUID Generation
     **************************************************************/
    public static UUID generateType5UUID(String namespace, String name) 
    		throws UnsupportedEncodingException {
    	log.debug("generateType5UUID(namespace, name) invoked.");

        byte[] nameSpaceBytes = bytesFromUUID(namespace);
        byte[] nameBytes = name.getBytes("UTF-8");
        byte[] result = joinBytes(nameSpaceBytes, nameBytes);

        return type5UUIDFromBytes(result);
    } // generateType5UUID
    

    public static UUID type5UUIDFromBytes(byte[] name) {
    	log.debug("type5UUIDFromBytes(name) invoked.");
    	
        MessageDigest md;
        
        try {
            md = MessageDigest.getInstance("SHA-1");
        } catch (NoSuchAlgorithmException nsae) {
            throw new InternalError("SHA-1 not supported", nsae);
        } // try-catch
        
        byte[] bytes = Arrays.copyOfRange(md.digest(name), 0, 16);
        
        bytes[6] &= 0x0f; /* clear version        */
        bytes[6] |= 0x50; /* set to version 5     */
        bytes[8] &= 0x3f; /* clear variant        */
        bytes[8] |= 0x80; /* set to IETF variant  */
        
        return constructType5UUID(bytes);
    } // type5UUIDFromBytes

    
    private static UUID constructType5UUID(byte[] data) {
    	log.debug("constructType5UUID(data) invoked.");
    	
        long msb = 0;
        long lsb = 0;
        
        assert data.length == 16 : "data must be 16 bytes in length";

        for (int i = 0; i < 8; i++)
            msb = (msb << 8) | (data[i] & 0xff);

        for (int i = 8; i < 16; i++)
            lsb = (lsb << 8) | (data[i] & 0xff);
        
        return new UUID(msb, lsb);
    } // constructType5UUID
    

    /***************************************************************
     * Unique Keys Generation Using Message Digest and Type 4 UUID
     ***************************************************************/
    public static String generateUniqueKeysWithUUIDAndMessageDigest() 
    		throws NoSuchAlgorithmException, UnsupportedEncodingException {
    	log.debug("generateUniqueKeysWithUUIDAndMessageDigest() invoked.");
    	
        MessageDigest salt = MessageDigest.getInstance("SHA-256");
        
        salt.update(UUID.randomUUID().toString().getBytes("UTF-8"));
        
        String digest = bytesToHex(salt.digest());
        
        return digest;
    } // generateUniqueKeysWithUUIDAndMessageDigest
    

    private static String bytesToHex(byte[] bytes) {
    	log.debug("bytesToHex(bytes) invoked.");
    	
        char[] hexChars = new char[bytes.length * 2];
        
        for (int j = 0; j < bytes.length; j++) {
            int v = bytes[j] & 0xFF;
            
            hexChars[j * 2] = hexArray[v >>> 4];
            hexChars[j * 2 + 1] = hexArray[v & 0x0F];
        } // for
        
        return new String(hexChars);
    } // bytesToHex
    

    private static byte[] bytesFromUUID(String uuidHexString) {
    	log.debug("bytesFromUUID(uuidHexString) invoked.");
    	
        String normalizedUUIDHexString = uuidHexString.replace("-","");

        assert normalizedUUIDHexString.length() == 32;

        byte[] bytes = new byte[16];
        
        for (int i = 0; i < 16; i++) {
            byte b = hexToByte(normalizedUUIDHexString.substring(i*2, i*2+2));
            
            bytes[i] = b;
        } // for
        
        return bytes;
    } // bytesFromUUID

    
    public static byte hexToByte(String hexString) {
    	log.debug("hexToByte(hexString) invoked.");
    	
        int firstDigit = Character.digit(hexString.charAt(0),16);
        int secondDigit = Character.digit(hexString.charAt(1),16);
        
        return (byte) ((firstDigit << 4) + secondDigit);
    } // hexToByte

    public static byte[] joinBytes(byte[] byteArray1, byte[] byteArray2) {
    	log.debug("joinBytes(byteArray1, byteArray2) invoked.");
    	
        int finalLength = byteArray1.length + byteArray2.length;
        
        byte[] result = new byte[finalLength];

        for(int i = 0; i < byteArray1.length; i++) {
            result[i] = byteArray1[i];
        } // for

        for(int i = 0; i < byteArray2.length; i++) {
            result[byteArray1.length+i] = byteArray2[i];
        } // for

        return result;
    } // joinBytes
    
} // end class