package cn.believeus.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.CallbackException;
import org.hibernate.Session;
import org.hibernate.classic.Lifecycle;

//生物学年龄信息
@Table
@Entity
public class Plate implements Lifecycle {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String barcode;
	@Column(columnDefinition="text")
	private String data;
	private Long editTime;// 创建时间
	private Long uploadTime;// 上传barcode时间
	public Plate(){}
	public Plate(String barcode, String data) {
		this.barcode = barcode;
		this.data = data;
		this.uploadTime = System.currentTimeMillis();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Long getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Long uploadTime) {
		this.uploadTime = uploadTime;
	}

	public String getBarcode() {
		return barcode;
	}

	public Plate setBarcode(String barcode) {
		this.barcode = barcode;
		return this;
	}
	
	public String getData() {
		return data;
	}

	public Plate setData(String data) {
		this.data = data;
		return this;
	}

	public Long getEditTime() {
		return editTime;
	}

	public void setEditTime(Long editTime) {
		this.editTime = editTime;
	}

	@Override
	public boolean onDelete(Session arg0) throws CallbackException {
		return false;
	}

	@Override
	public void onLoad(Session session, Serializable serializable) {

	}

	@Override
	public boolean onSave(Session session) throws CallbackException {
		editTime = System.currentTimeMillis();
		return false;
	}

	@Override
	public boolean onUpdate(Session session) throws CallbackException {
		Plate entity = (Plate) session.get(this.getClass(), id);
		this.uploadTime = entity.uploadTime;
		this.editTime = System.currentTimeMillis();
		return false;
	}

}
