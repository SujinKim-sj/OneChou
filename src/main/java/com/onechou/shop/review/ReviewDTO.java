package com.onechou.shop.review;

import com.onechou.shop.writing.WritingDTO;

public class ReviewDTO extends WritingDTO {

	private Integer rating;

	public Integer getRating() {
		return rating;
	}
	public void setRating(Integer rating) {
		this.rating = rating;
	}

}
