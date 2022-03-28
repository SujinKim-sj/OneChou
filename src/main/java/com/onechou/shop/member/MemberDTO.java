package com.onechou.shop.member;

import com.onechou.shop.favorite.FavoriteDTO;
import com.onechou.shop.roastery.RoasteryDTO;

public class MemberDTO {

	private String id;
	private String pw;
	private String name;
	private String email;
	private String phone;
	private String nickname;
	private String address;
	private Long kind;
	private FavoriteDTO favoriteDTO;
	private RoasteryDTO roasteryDTO;
	
	public RoasteryDTO getRoasteryDTO() {
		return roasteryDTO;
	}

	public void setRoasteryDTO(RoasteryDTO roasteryDTO) {
		this.roasteryDTO = roasteryDTO;
	}

	public FavoriteDTO getFavoriteDTO() {
		return favoriteDTO;
	}

	public void setFavoriteDTO(FavoriteDTO favoriteDTO) {
		this.favoriteDTO = favoriteDTO;
	}

	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Long getKind() {
		return kind;
	}
	public void setKind(Long kind) {
		this.kind = kind;
	}
	
}
