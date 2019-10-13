package kr.or.ksmart.dto;

public class NoteBook {
	private String nCode = null;
	private String hId = null;
	private String nName = null;
	private String nColor = null;
	private String nMade = null;
	private String nSday = null;
	private String nRday = null;
	private int nCount = 0;
	private String nNspec = null;
	private int nPrice = 0;
	private int nSale = 0;
	private float nSprice = 0;
	private String nImg = null;
	public String getnCode() {
		return nCode;
	}
	public void setnCode(String nCode) {
		this.nCode = nCode;
	}
	public String gethId() {
		return hId;
	}
	public void sethId(String hId) {
		this.hId = hId;
	}
	public String getnName() {
		return nName;
	}
	public void setnName(String nName) {
		this.nName = nName;
	}
	public String getnColor() {
		return nColor;
	}
	public void setnColor(String nColor) {
		this.nColor = nColor;
	}
	public String getnMade() {
		return nMade;
	}
	public void setnMade(String nMade) {
		this.nMade = nMade;
	}
	public String getnSday() {
		return nSday;
	}
	public void setnSday(String nSday) {
		this.nSday = nSday;
	}
	public String getnRday() {
		return nRday;
	}
	public void setnRday(String nRday) {
		this.nRday = nRday;
	}
	public int getnCount() {
		return nCount;
	}
	public void setnCount(int nCount) {
		this.nCount = nCount;
	}
	public String getnNspec() {
		return nNspec;
	}
	public void setnNspec(String nNspec) {
		this.nNspec = nNspec;
	}
	public int getnPrice() {
		return nPrice;
	}
	public void setnPrice(int nPrice) {
		this.nPrice = nPrice;
	}
	public int getnSale() {
		return nSale;
	}
	public void setnSale(int nSale) {
		this.nSale = nSale;
	}
	public float getnSprice() {
		return nSprice;
	}
	public void setnSprice(float nSprice) {
		this.nSprice = nSprice;
	}
	public String getnImg() {
		return nImg;
	}
	public void setnImg(String nImg) {
		this.nImg = nImg;
	}
	@Override
	public String toString() {
		return "NoteBook [nCode=" + nCode + ", hId=" + hId + ", nName=" + nName + ", nColor=" + nColor + ", nMade="
				+ nMade + ", nSday=" + nSday + ", nRday=" + nRday + ", nCount=" + nCount + ", nNspec=" + nNspec
				+ ", nPrice=" + nPrice + ", nSale=" + nSale + ", nSprice=" + nSprice + ", nImg=" + nImg + "]";
	}
	
	
	
}
