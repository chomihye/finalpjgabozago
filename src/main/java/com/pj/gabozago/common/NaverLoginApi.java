package com.pj.gabozago.common;

import com.github.scribejava.core.builder.api.DefaultApi20;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class NaverLoginApi extends DefaultApi20{
 
    private static class InstanceHolder{
        private static final NaverLoginApi INSTANCE = new NaverLoginApi();
    }// InstanceHolder
 
    public static NaverLoginApi instance(){
        return InstanceHolder.INSTANCE;
    }// instance
 
    @Override
    public String getAccessTokenEndpoint() {
        return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
    }// getAccessTokenEndpoint           
 
    @Override
    protected String getAuthorizationBaseUrl() {
        return "https://nid.naver.com/oauth2.0/authorize";
    }// getAuthorizationBaseUrl
    
}// end class