package application.view;

public class PlanetaDataModel {
	private String ime;
	private String tipPlanete;
	private float glavniPoluprecnik;
	private float ekvatorijalniPoluprecnik;
	private float povrsina;
	private float zapremina;
	private float masa;
	private float povrsinskaGravitacija;
	private float brzinaOslobadjanja;
	private float rotacioniPeriod;
	private float albedo;
	private float obim;
	private float povrsinskiPritisak;
	private float povrsinskaTemperatura;
	private float nagibOse;
	
	public PlanetaDataModel(String ime, float glavniPoluprecnik, float ekvatorijalniPoluprecnik, float povrsina, float zapremina, 
							float masa, float povrsinskaGravitacija, float brzinaOslobadjanja, float rotacioniPeriod, float albedo, float obim, String tipPlanete,
							float povrsinskiPritisak,float povrsinskaTemperatura, float nagibOse) {
		this.ime = ime;
		this.tipPlanete = tipPlanete;
		this.glavniPoluprecnik = glavniPoluprecnik;
		this.ekvatorijalniPoluprecnik = ekvatorijalniPoluprecnik;
		this.povrsina = povrsina;
		this.zapremina = zapremina;
		this.masa = masa;
		this.povrsinskaGravitacija = povrsinskaGravitacija;
		this.brzinaOslobadjanja = brzinaOslobadjanja;
		this.rotacioniPeriod = rotacioniPeriod;
		this.albedo = albedo;
		this.obim = obim;
		this.povrsinskiPritisak = povrsinskiPritisak;
		this.povrsinskaTemperatura = povrsinskaTemperatura;
		this.nagibOse = nagibOse;
	}
	
	
	//geteri i seteri
	public String getIme() {
		return ime;
	}
	public void setIme(String ime) {
		this.ime = ime;
	}
	public float getGlavniPoluprecnik() {
		return glavniPoluprecnik;
	}
	public void setGlavniPoluprecnik(float glavniPoluprecnik) {
		this.glavniPoluprecnik = glavniPoluprecnik;
	}
	public float getEkvatorijalniPoluprecnik() {
		return ekvatorijalniPoluprecnik;
	}
	public void setEkvatorijalniPoluprecnik(float ekvatorijalniPoluprecnik) {
		this.ekvatorijalniPoluprecnik = ekvatorijalniPoluprecnik;
	}
	public float getPovrsina() {
		return povrsina;
	}
	public void setPovrsina(float povrsina) {
		this.povrsina = povrsina;
	}
	public float getZapremina() {
		return zapremina;
	}
	public void setZapremina(float zapremina) {
		this.zapremina = zapremina;
	}
	public float getMasa() {
		return masa;
	}
	public void setMasa(float masa) {
		this.masa = masa;
	}
	public float getPovrsinskaGravitacija() {
		return povrsinskaGravitacija;
	}
	public void setPovrsinskaGravitacija(float povrsinskaGravitacija) {
		this.povrsinskaGravitacija = povrsinskaGravitacija;
	}
	public float getBrzinaOslobadjanja() {
		return brzinaOslobadjanja;
	}
	public void setBrzinaOslobadjanja(float brzinaOslobadjanja) {
		this.brzinaOslobadjanja = brzinaOslobadjanja;
	}
	public float getRotacioniPeriod() {
		return rotacioniPeriod;
	}
	public void setRotacioniPeriod(float rotacioniPeriod) {
		this.rotacioniPeriod = rotacioniPeriod;
	}
	public float getAlbedo() {
		return albedo;
	}
	public void setAlbedo(float albedo) {
		this.albedo = albedo;
	}
	public float getObim() {
		return obim;
	}
	public void setObim(float obim) {
		this.obim = obim;
	}
	public String getTipPlanete() {
		return tipPlanete;
	}
	public void setTipPlanete(String tipPlanete) {
		this.tipPlanete = tipPlanete;
	}
	public float getPovrsinskiPritisak() {
		return povrsinskiPritisak;
	}
	public void setPovrsinskiPritisak(float povrsinskiPritisak) {
		this.povrsinskiPritisak = povrsinskiPritisak;
	}
	public float getPovrsinskaTemperatura() {
		return povrsinskaTemperatura;
	}
	public void setPovrsinskaTemperatura(float povrsinskaTemperatura) {
		this.povrsinskaTemperatura = povrsinskaTemperatura;
	}
	public float getNagibOse() {
		return nagibOse;
	}
	public void setNagibOse(float nagibOse) {
		this.nagibOse = nagibOse;
	}

}
