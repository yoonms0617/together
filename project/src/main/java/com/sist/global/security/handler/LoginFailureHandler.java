package com.sist.global.security.handler;

import com.fasterxml.jackson.databind.ObjectMapper;

import com.sist.global.error.dto.ErrorResponse;
import com.sist.global.error.exception.ErrorType;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

public class LoginFailureHandler implements AuthenticationFailureHandler {

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                        AuthenticationException exception) throws IOException {
        String path = request.getRequestURI();
        ErrorResponse errorResponse = ErrorResponse.of(ErrorType.WRONG_EMAIL_PASSWORD, path);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setStatus(errorResponse.getStatus());
        objectMapper.writeValue(response.getWriter(), errorResponse);
    }

}
