package servlet;

import java.sql.Date;

public class CustomerBean {

    public String name, gender, emp, marital, email, address, city, state, country, national, userid, password,uname,uemail,ugender;
    public long mobile,umobile,uid;
    public Date dob,udob;
    public boolean valid;

    public CustomerBean() {
    }

    public CustomerBean(String name, Date dob, String gender, String emp, String marital, String email, long mobile, String address, String city, String state, String country, String national, String userid, String password) {
        super();
        this.name = name;
        this.dob = dob;
        this.gender = gender;
        this.emp = emp;
        this.marital = marital;
        this.email = email;
        this.mobile = mobile;
        this.address = address;
        this.city = city;
        this.state = state;
        this.country = country;
        this.national = national;
        this.userid = userid;
        this.password = password;
    }
    public CustomerBean(String userid, String password) {
        super();
        this.userid = userid;
        this.password = password;
    }
    

    CustomerBean(Long uid, String uname, String uemail, Long umobile, Date udob, String ugender) {
        super();
        this.uname = uname;
        this.udob = udob;
        this.ugender = ugender;
        this.uemail = uemail;
        this.umobile=umobile;
        this.uid=uid;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail;
    }

    public String getUgender() {
        return ugender;
    }

    public void setUgender(String ugender) {
        this.ugender = ugender;
    }

    public long getUmobile() {
        return umobile;
    }

    public void setUmobile(long umobile) {
        this.umobile = umobile;
    }

    public Date getUdob() {
        return udob;
    }

    public void setUdob(Date udob) {
        this.udob = udob;
    }
     
    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public Date getDob() {
        return dob;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getGender() {
        return gender;
    }

    public void setEmp(String emp) {
        this.emp = emp;
    }

    public String getEmp() {
        return emp;
    }

    public void setMarital(String marital) {
        this.marital = marital;
    }

    public String getMarital() {
        return marital;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setMobile(long mobile) {
        this.mobile = mobile;
    }

    public long getMobile() {
        return mobile;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress() {
        return address;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCity() {
        return city;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getState() {
        return state;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCountry() {
        return country;
    }

    public void setNational(String national) {
        this.national = national;
    }

    public String getNational() {
        return national;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUserid() {
        return userid;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }
}
