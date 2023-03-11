package com.sist.global.error;

import com.sist.global.error.dto.ErrorResponse;
import com.sist.global.error.exception.BaseException;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(BaseException.class)
    @ResponseBody
    public ResponseEntity<ErrorResponse> handleBaseException(BaseException e, HttpServletRequest request) {
        String path = getRequestURI(request);
        ErrorResponse response = ErrorResponse.of(e.getErrorType(), path);
        return ResponseEntity.status(response.getStatus()).body(response);
    }

    private String getRequestURI(HttpServletRequest request) {
        return request.getRequestURI();
    }

}
