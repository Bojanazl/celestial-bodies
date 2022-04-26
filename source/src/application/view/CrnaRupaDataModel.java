package application.view;

public class CrnaRupaDataModel {

	private String Ime;
	private float GlavniPoluprecnik;
	private float EkvatorijalniPoluprecnik;
	private float Povrsina;
	private float Zapremina;
	private float Masa;
	private float PovrsinskaGravitacija;
	private float BrzinaOslobadjanja;
	private float RotacioniPeriod;
	private float Albedo;
	private float Obim;
	private int Rektascenzija_Aproksimacija;
	private int Deklinacija_Aproksimacija;
	
	public CrnaRupaDataModel(String Ime, float GlavniPoluprecnik, float EkvatorijalniPoluprecnik,  float Povrsina, 
							float Zapremina,float Masa, float PovrsinskaGravitacija, float BrzinaOslobadjanja, float RotacioniPeriod, 
							float Albedo, float Obim, int Rektascenzija_Aproksimacija,int Deklinacija_Aproksimacija ){
		

		this.Ime = Ime;
		this.GlavniPoluprecnik = GlavniPoluprecnik;
		this.EkvatorijalniPoluprecnik = EkvatorijalniPoluprecnik;
		this.Povrsina = Povrsina;
		this.Zapremina = Zapremina;
		this.Masa = Masa;
		this.PovrsinskaGravitacija = PovrsinskaGravitacija;
		this.BrzinaOslobadjanja = BrzinaOslobadjanja;
		this.RotacioniPeriod = RotacioniPeriod;
		this.Albedo = Albedo;
		this.Obim = Obim;
		this.Rektascenzija_Aproksimacija = Rektascenzija_Aproksimacija;
		this.Deklinacija_Aproksimacija =  Deklinacija_Aproksimacija;
	}
	
	//geteri i seteri
	public String getIme() {
		return Ime;
	}
	public void setIme(String ime) {
		Ime = ime;
	}
	public float getGlavniPoluprecnik() {
		return GlavniPoluprecnik;
	}
	public void setGlavniPoluprecnik(float glavniPoluprecnik) {
		GlavniPoluprecnik = glavniPoluprecnik;
	}
	public float getEkvatorijalniPoluprecnik() {
		return EkvatorijalniPoluprecnik;
	}
	public void setEkvatorijalniPoluprecnik(float ekvatorijalniPoluprecnik) {
		EkvatorijalniPoluprecnik = ekvatorijalniPoluprecnik;
	}
	public float getPovrsina() {
		return Povrsina;
	}
	public void setPovrsina(float povrsina) {
		Povrsina = povrsina;
	}
	public float getZapremina() {
		return Zapremina;
	}
	public void setZapremina(float zapremina) {
		Zapremina = zapremina;
	}
	public float getMasa() {
		return Masa;
	}
	public void setMasa(float masa) {
		Masa = masa;
	}
	public float getPovrsinskaGravitacija() {
		return PovrsinskaGravitacija;
	}
	public void setPovrsinskaGravitacija(float povrsinskaGravitacija) {
		PovrsinskaGravitacija = povrsinskaGravitacija;
	}
	public float getBrzinaOslobadjanja() {
		return BrzinaOslobadjanja;
	}
	public void setBrzinaOslobadjanja(float brzinaOslobadjanja) {
		BrzinaOslobadjanja = brzinaOslobadjanja;
	}
	public float getRotacioniPeriod() {
		return RotacioniPeriod;
	}
	public void setRotacioniPeriod(float rotacioniPeriod) {
		RotacioniPeriod = rotacioniPeriod;
	}
	public float getAlbedo() {
		return Albedo;
	}
	public void setAlbedo(float albedo) {
		Albedo = albedo;
	}
	public float getObim() {
		return Obim;
	}
	public void setObim(float obim) {
		Obim = obim;
	}
	public int getRektascenzija_Aproksimacija() {
		return Rektascenzija_Aproksimacija;
	}
	public void setRektascenzija_Aproksimacija(int rektascenzija_Aproksimacija) {
		Rektascenzija_Aproksimacija = rektascenzija_Aproksimacija;
	}
	public int getDeklinacija_Aproksimacija() {
		return Deklinacija_Aproksimacija;
	}
	public void setDeklinacija_Aproksimacija(int deklinacija_Aproksimacija) {
		Deklinacija_Aproksimacija = deklinacija_Aproksimacija;
	}
	
}
