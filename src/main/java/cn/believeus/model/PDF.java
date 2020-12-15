package cn.believeus.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table
@Entity
public class PDF {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	public String barcode;
	public String email;
	public String wellname;
	@Column(columnDefinition = "text")
	public String note;
	public String pdf;
	public String parent;
	public String patientname;
	public byte positive;
	public String labdirector;
	public long createtime;

	public long getCreatetime() {
		return createtime;
	}

	public void setCreatetime(long createtime) {
		this.createtime = createtime;
	}

	public String getLabdirector() {
		return labdirector;
	}

	public void setLabdirector(String labdirector) {
		this.labdirector = labdirector;
	}

	public int getId() {
		return id;
	}

	public PDF setId(int id) {
		this.id = id;
		return this;
	}

	public String getEmail() {
		return email;
	}

	public PDF setEmail(String email) {
		this.email = email;
		return this;
	}

	public String getWellname() {
		return wellname;
	}

	public PDF setWellname(String wellname) {
		this.wellname = wellname;
		return this;
	}

	public String getNote() {
		return note;
	}

	public PDF setNote(String note) {
		this.note = note;
		return this;
	}

	public String getPdf() {
		return pdf;
	}

	public PDF setPdf(String pdf) {
		this.pdf = pdf;
		return this;
	}

	public String getParent() {
		return parent;
	}

	public PDF setParent(String parent) {
		this.parent = parent;
		return this;
	}

	public byte getPositive() {
		return positive;
	}

	public PDF setPositive(byte positive) {
		this.positive = positive;
		return this;
	}

	public String getPatientname() {
		return patientname;
	}

	public PDF setPatientname(String patientname) {
		this.patientname = patientname;
		return this;
	}

	public String getBarcode() {
		return barcode;
	}

	public PDF setBarcode(String barcode) {
		this.barcode = barcode;
		return this;
	}

}
