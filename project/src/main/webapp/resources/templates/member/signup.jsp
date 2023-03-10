<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<jsp:include page="../fragments/head.jsp"/>
<body>
<jsp:include page="../fragments/header.jsp"/>
<div class="container" id="app">
    <div class="text-center mb-5">
        <div class="mb-3 mt-3">
            <h1>회원가입</h1>
        </div>
        <div class="m-auto" style="width: 400px;">
            <form>
                <div>
                    <input type="text" v-model="name" class="form-control form-control-lg" @blur="nameCheck()" placeholder="이름">
                    <div class="text-left">
                        <span class="text-success" v-if="isNameValid">
                            <small>{{ nameMessage }}</small>
                        </span>
                        <span class="text-danger" v-else>
                            <small>{{ nameMessage }}</small>
                        </span>
                    </div>
                </div>
                <div class="mt-4">
                    <input type="text" v-model="nickname" class="form-control form-control-lg" @blur="nicknameCheck()" placeholder="닉네임">
                    <div class="text-left">
                        <span class="text-success" v-if="isNicknameValid">
                            <small>{{ nicknameMessage }}</small>
                        </span>
                        <span class="text-danger" v-else>
                            <small>{{ nicknameMessage }}</small>
                        </span>
                    </div>
                </div>
                <div class="mt-4">
                    <input type="text" v-model="email" class="form-control form-control-lg" @blur="emailCheck()" placeholder="아이디(이메일)">
                    <div class="text-left">
                        <span class="text-success" v-if="isEmailValid">
                            <small>{{ emailMessage }}</small>
                        </span>
                        <span class="text-danger" v-else>
                            <small>{{ emailMessage }}</small>
                        </span>
                    </div>
                </div>
                <div class="mt-4">
                    <input type="password" v-model="password1" class="form-control form-control-lg" @blur="password1Check()" placeholder="비밀번호">
                    <div class="text-left">
                        <span class="text-success" v-if="isPassword1Valid">
                            <small>{{ password1Message }}</small>
                        </span>
                        <span class="text-danger" v-else>
                            <small>{{ password1Message }}</small>
                        </span>
                    </div>
                </div>
                <div class="mt-4">
                    <input type="password" v-model="password2" class="form-control form-control-lg" @blur="password2Check()" placeholder="비밀번호 확인">
                    <div class="text-left">
                        <span class="text-success" v-if="isPassword2Valid">
                            <small>{{ password2Message }}</small>
                        </span>
                        <span class="text-danger" v-else>
                            <small>{{ password2Message }}</small>
                        </span>
                    </div>
                </div>
                <div class="mt-4">
                    <button type="button" class="btn btn-lg btn-primary btn-block" v-on:click="signup()">가입하기</button>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="../fragments/footer.jsp"/>
<script>
    new Vue({
        el: '#app',
        data: {
            name: '',
            nickname: '',
            email: '',
            password1: '',
            password2: '',
            isNameValid: false,
            isNicknameValid: false,
            isEmailValid: false,
            isPassword1Valid: false,
            isPassword2Valid: false,
            nameMessage: '',
            nicknameMessage: '',
            emailMessage: '',
            password1Message: '',
            password2Message: ''
        },
        methods: {
            nameCheck: function () {
                let _this = this;
                let name = _this.name;
                const regexp = /[^가-힣a-zA-Z0-9]/gi;
                if (name === '') {
                    _this.nameMessage = '이름을 입력해주세요.';
                    _this.isNameValid = false;
                    return false;
                }
                if (name !== '' && regexp.test(name)) {
                    _this.nameMessage = '한글과 영문 대소문자를 사용하세요. (특수기호, 공백 사용 불가)';
                    _this.isNameValid = false;
                    return false;
                }
                _this.nameMessage = '멋진 이름이네요';
                _this.isNameValid = true;
                return true;
            },
            nicknameCheck: function () {
                let _this = this;
                let nickname = _this.nickname;
                const regexp = /^[가-힣a-zA-Z0-9][가-힣a-zA-Z0-9]{2,19}$/
                if (nickname === '') {
                    _this.nicknameMessage = '별명을 입력해주세요.';
                    _this.isNicknameValid = false;
                    return false;
                }
                if (!regexp.test(nickname)) {
                    _this.nicknameMessage = '3~20자의 한글, 영문 소문자, 숫자만 사용 가능합니다.';
                    _this.isNicknameValid = false;
                    return false;
                }
                if (!_this.isNicknameValid) {
                    axios.get('/member/nickname/duplicate-check', {
                        params: {
                            nickname: nickname
                        }
                    }).then(function (response) {
                        _this.isNicknameValid = true;
                        _this.nicknameMessage = response.data;
                    }).catch(function (error) {
                        _this.isNicknameValid = false;
                        _this.nicknameMessage = error.response.data.message;
                    })
                }
                _this.isNicknameValid = true;
                return true;
            },
            emailCheck: function () {
                let _this = this;
                let email = _this.email;
                const regexp = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                if (email === '') {
                    _this.emailMessage = '이메일을 입력해 주세요.';
                    _this.isEmailValid = false;
                    return false;
                }
                if (!regexp.test(email)) {
                    _this.emailMessage = '이메일을 다시 확인해 주세요.'
                    _this.isEmailValid = false;
                    return false;
                }
                if (!_this.isEmailValid) {
                    axios.get('/member/email/duplicate-check', {
                        params: {
                            email: email
                        }
                    }).then(function (response) {
                        _this.isEmailValid = true;
                        _this.emailMessage = response.data;
                    }).catch(function (error) {
                        _this.isEmailValid = false;
                        _this.emailMessage = error.response.data.message;
                    })
                }
                _this.isEmailValid = true;
                return true;
            },
            password1Check: function () {
                let _this = this;
                let password1 = _this.password1;
                const regexp = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{8,16}$/;
                if (password1 === '') {
                    _this.password1Message = '비밀번호를 입력해주세요.';
                    _this.isPassword1Valid = false;
                    return false;
                }
                if (!regexp.test(password1)) {
                    _this.password1Message = '8~16자 영문 대소문자, 숫자, 특수문자를 사용해 주세요.'
                    _this.isPassword1Valid = false;
                    return false;
                }
                _this.password1Message = '사용 가능한 비밀번호입니다.';
                _this.isPassword1Valid = true;
                return true;
            },
            password2Check: function () {
                let _this = this;
                let password1 = _this.password1;
                let password2 = _this.password2;
                if (password2 === '') {
                    _this.password2Message = '비밀번호를 한번 더 입력해주세요.';
                    _this.isPassword2Valid = false;
                    return false;
                }
                if (password1 !== password2) {
                    _this.password2Message = '비밀번호가 일치하지 않습니다.';
                    _this.isPassword2Valid = false;
                    return false;
                }
                _this.password2Message = '비밀번호가 일치합니다.';
                _this.isPassword2Valid = true;
                return true;

            },
            signup: function () {
                this.nameCheck();
                this.nicknameCheck();
                this.emailCheck();
                this.password1Check();
                this.password2Check();
                if (this.isNameValid && this.isNicknameValid && this.isEmailValid && this.isPassword1Valid && this.isPassword2Valid) {
                    let data = {
                        name: this.name,
                        nickname: this.nickname,
                        email: this.email,
                        password: this.password1
                    }
                    axios.post('/member/signup', JSON.stringify(data), {
                        headers: {
                            "content-type": 'application/json'
                        }
                    }).then(function (response) {
                        location.href = '/';
                    });
                }
            }
        }
    })
</script>
</body>
</html>
