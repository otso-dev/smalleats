package com.smalleats.service;

import com.smalleats.DTO.user.PasswordReqDto;
import com.smalleats.DTO.user.UserAddressReqDto;
import com.smalleats.DTO.user.UserAddressRespDto;
import com.smalleats.DTO.user.UserInfoRespDto;
import com.smalleats.entity.User;
import com.smalleats.entity.UserAddress;
import com.smalleats.repository.UserDAOImpl;
import com.smalleats.security.PrincipalUser;
import com.smalleats.service.exception.CustomException;
import com.smalleats.service.exception.ErrorMap;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserDAOImpl userDAO;

    public UserInfoRespDto getUserInfo(){
        PrincipalUser principalUser = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userDAO.findUserByEmail(principalUser.getEmail());
        if(user == null){
            throw new CustomException("사용자 정보 오류",ErrorMap.builder().put("userInfo","사용자 정보 오류").build());
        }
        return user.toUserInfoRespDto();
    }

    public int userLogout(HttpServletRequest request, HttpServletResponse response){
        Cookie jwtTokenDelete = new Cookie("JWT-TOKEN", null);
        jwtTokenDelete.setMaxAge(0);
        jwtTokenDelete.setPath("/");
        response.addCookie(jwtTokenDelete);
        return 1;
    }

    public int userPasswordchange(PasswordReqDto passwordReqDto){
        PrincipalUser principalUser = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Map<String,String> passwordMap = new HashMap<>();
        User user = userDAO.findUserByEmail(principalUser.getEmail());
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        if(!passwordEncoder.matches(passwordReqDto.getCurrentPassword(), user.getPassword())){
            throw new CustomException("비밀번호 변경 실패", ErrorMap.builder().put("password","현재 비밀번호가 일치하지 않습니다.").build());
        }
        if(!passwordReqDto.getChangePassword().equals(passwordReqDto.getCheckPassword())){
            throw new CustomException("비밀번호 변경 실패",ErrorMap.builder().put("password","비밀번호 확인과 변경할 비밀번호가 다릅니다.").build());
        }
        String encodePassword = passwordEncoder.encode(passwordReqDto.getChangePassword());

        passwordMap.put("userId", Integer.toString(user.getUserId()));
        passwordMap.put("changePassword", encodePassword);
        return userDAO.passwordUpdate(passwordMap);
    }
}