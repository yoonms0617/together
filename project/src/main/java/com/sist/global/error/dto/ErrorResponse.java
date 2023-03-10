package com.sist.global.error.dto;

import com.sist.global.error.exception.ErrorType;

import lombok.Getter;

@Getter
public class ErrorResponse {

    private final String code;

    private final int status;

    private final String message;

    private final String path;

    private ErrorResponse(ErrorType errorType, String path) {
        this.code = errorType.getCode();
        this.status = errorType.getStatus();
        this.message = errorType.getMessage();
        this.path = path;
    }

    public static ErrorResponse of(ErrorType errorType, String path) {
        return new ErrorResponse(errorType, path);
    }

}
