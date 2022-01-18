function sendit() {
    const userpw = document.getElementById('userpw');
    const userpw_re = document.getElementById('userpw_re');
    const name = document.getElementById('name');
    const hp = document.getElementById('hp');
    const email = document.getElementById('email');
    const hobby = document.getElementsByName('hobby');

    //정규식
    const expNameText = /[가-힣]+$/;  //이름  가-힣범위 +: 몇글자든 상관 없고 한글만 나오고 $:끝냄
    const expHpText = /^\d{3}-\d{3,4}-\d{4}$/;//휴대폰\d데시멀 숫자로 시작(0~9 10진수 {세자리}){3,4}세자리 또는 네자리   
    //^:범위로 시작  +: 몇글자일지 모를때   .이나 -를 쓸땐 앞에 \붙이기
    const expEmailText = /^[A-Za-z0-9\-\.]+@[A-Za-z0-9\-\.]+\.[A-Za-z0-9]+$/;    //특수문자는 앞에 \ - \.       yoo0924

    if(userpw.value == '') {    //비밀번호를 입력하지 않았다면
        alert('비밀번호를 입력하세요');
        userpw.focus();
        return false;
    }
    

    if(userpw.value.length < 4 || userpw.value.length > 20){
        alert('비밀번호는 4자이상 20자 이하로 입력하세요');
        userpw.focus();
        return false;
    }

    if(userpw.value != userpw_re.value){    //비밀번호 비밀번호 확인 같은지 비교
        alert('비밀번호를 다시 확인해주세요');
        userpw.focus();
        return false;
    }

    if(name.value == '') {    //이름를 입력하지 않았다면
        alert('이름을 입력하세요');
        name.focus();
        return false;
    }

    if(!expNameText.test(name.value)){  //정규식 검사를 해서 false가 나오면
        alert('이름 형식을 확인하세요\n한글만 입력 가능합니다.');
        name.focus();
        return false;
    }

    if(hp.value == '') {    //휴대폰번호를 입력하지 않았다면
        alert('휴대폰번호를 입력하세요');
        hp.focus();
        return false;
    }

    if(!expHpText.test(hp.value)){
        alert('휴대폰번호 형식을 확인하세요\n하이픈(-)을 포함해야 합니다.');
        hp.focus();
        return false;
    }

    if(email.value == '') {    //이메일을 입력하지 않았다면
        alert('이메일을 입력하세요');
        email.focus();
        return false;
    }

    if(!expEmailText.test(email.value)){
        alert('이메일 형식을 확인하세요');
        email.focus();
        return false;
    }

    let count = 0;
    for (let i in hobby){
        if(hobby[i].checked){
            count++;
        }
    }
    if(count == 0){
        alert('취미는 적어도 하나이상 선택하세요');
        return false;
    }

    return true;
}