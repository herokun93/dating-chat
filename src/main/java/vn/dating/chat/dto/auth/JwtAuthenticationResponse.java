package vn.dating.chat.dto.auth;

public class JwtAuthenticationResponse {
    private String accessToken;
    private String refreshToken;
    private Long userId;
    private String email;
    private String avatar;

    private String tokenType = "Bearer";

//    private UserProfile user;

    public JwtAuthenticationResponse(String accessToken, String refreshToken,String avatar, UserProfile user) {
        this.email = user.getEmail();
        this.userId = user.getId();
        this.accessToken = accessToken;
        this.refreshToken = refreshToken;
        this.avatar = avatar;
    }

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    public String getRefreshToken() {
        return refreshToken;
    }

    public void setRefreshToken(String refreshToken) {
        this.refreshToken = refreshToken;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getTokenType() {
        return tokenType;
    }

    public void setTokenType(String tokenType) {
        this.tokenType = tokenType;
    }
}