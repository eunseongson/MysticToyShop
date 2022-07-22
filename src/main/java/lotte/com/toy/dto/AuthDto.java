package lotte.com.toy.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor
public class AuthDto {
    private int auth_id;
    private char auth_type;
    private String auth_role;

//    @Override
//    public String toString() {
//        return "AuthDto{" +
//                "authId=" + authId +
//                ", authType='" + authType + '\'' +
//                ", authRole='" + authRole + '\'' +
//                '}';
//    }
}
