package cn.believeus.model;

public class Well {
    public String parent;
    public String name;
    public String barcode;
    public long scantime;
    public String color;
    public String operator;
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBarcode() {
		return barcode;
	}
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	public long getScantime() {
		return scantime;
	}
	public void setScantime(long scantime) {
		this.scantime = scantime;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
    
}
