package application.view;

public class SatelitDataModel {


	private String ime;
	private Integer id_roditelja;
	private String vrsta;
	private Integer g_poluprecnik;
	private Integer e_poluprecnik;
	private float p;
	private float v;
	private float m;
	private float g;
	private float brzina_oslobadjanja;
	private float rot_period;
	private float albedo;
	private float o;
	private float ekscentricitet;
	private float o_period;
	private float brzina;
	private float anomalija;
	private float inklinacija;
	private float ulazni_cvor;
	private float perihel;
	

public SatelitDataModel(String ime, Integer id_roditelja, String vrsta, Integer g_poluprecnik,
		Integer e_poluprecnik, float p, float v, float m, float g, float brzina_oslobadjanja, float rot_period,
		float albedo, float o, float ekscentricitet, float o_period, float brzina, float anomalija,
		float inklinacija, float ulazni_cvor, float perihel) {
	
	this.ime = ime;
	this.id_roditelja = id_roditelja;
	this.vrsta = vrsta;
	this.g_poluprecnik = g_poluprecnik;
	this.e_poluprecnik = e_poluprecnik;
	this.p = p;
	this.v = v;
	this.m = m;
	this.g = g;
	this.brzina_oslobadjanja = brzina_oslobadjanja;
	this.rot_period = rot_period;
	this.albedo = albedo;
	this.o = o;
	this.ekscentricitet = ekscentricitet;
	this.o_period = o_period;
	this.brzina = brzina;
	this.anomalija = anomalija;
	this.inklinacija = inklinacija;
	this.ulazni_cvor = ulazni_cvor;
	this.perihel = perihel;
}


public String getIme() {
	return ime;
}


public void setIme(String ime) {
	this.ime = ime;
}


public Integer getId_roditelja() {
	return id_roditelja;
}


public void setId_roditelja(Integer id_roditelja) {
	this.id_roditelja = id_roditelja;
}


public String getVrsta() {
	return vrsta;
}


public void setVrsta(String vrsta) {
	this.vrsta = vrsta;
}


public Integer getG_poluprecnik() {
	return g_poluprecnik;
}


public void setG_poluprecnik(Integer g_poluprecnik) {
	this.g_poluprecnik = g_poluprecnik;
}


public Integer getE_poluprecnik() {
	return e_poluprecnik;
}


public void setE_poluprecnik(Integer e_poluprecnik) {
	this.e_poluprecnik = e_poluprecnik;
}


public float getP() {
	return p;
}


public void setP(float p) {
	this.p = p;
}


public float getV() {
	return v;
}


public void setV(float v) {
	this.v = v;
}


public float getM() {
	return m;
}


public void setM(float m) {
	this.m = m;
}


public float getG() {
	return g;
}


public void setG(float g) {
	this.g = g;
}


public float getBrzina_oslobadjanja() {
	return brzina_oslobadjanja;
}


public void setBrzina_oslobadjanja(float brzina_oslobadjanja) {
	this.brzina_oslobadjanja = brzina_oslobadjanja;
}


public float getRot_period() {
	return rot_period;
}


public void setRot_period(float rot_period) {
	this.rot_period = rot_period;
}


public float getAlbedo() {
	return albedo;
}


public void setAlbedo(float albedo) {
	this.albedo = albedo;
}


public float getO() {
	return o;
}


public void setO(float o) {
	this.o = o;
}


public float getEkscentricitet() {
	return ekscentricitet;
}


public void setEkscentricitet(float ekscentricitet) {
	this.ekscentricitet = ekscentricitet;
}


public float getO_period() {
	return o_period;
}


public void setO_period(float o_period) {
	this.o_period = o_period;
}


public float getBrzina() {
	return brzina;
}


public void setBrzina(float brzina) {
	this.brzina = brzina;
}


public float getAnomalija() {
	return anomalija;
}


public void setAnomalija(float anomalija) {
	this.anomalija = anomalija;
}


public float getInklinacija() {
	return inklinacija;
}


public void setInklinacija(float inklinacija) {
	this.inklinacija = inklinacija;
}


public float getUlazni_cvor() {
	return ulazni_cvor;
}


public void setUlazni_cvor(float ulazni_cvor) {
	this.ulazni_cvor = ulazni_cvor;
}


public float getPerihel() {
	return perihel;
}


public void setPerihel(float perihel) {
	this.perihel = perihel;
}

}
