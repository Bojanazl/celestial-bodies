package application.view;

public class ZvijezdaDataModel {
	

	private String ImeZvijezde;
	private String SpektralnaKlasifikacija;
	private String ZvjezdaniSistem;
	private String ZvjezdanoJato;
	private String Galaksija;
	private String GalaktickoJato;
	private String Superjato;
	
	public ZvijezdaDataModel(String imeZvijezde, String spektralnaKlasifikacija, String zvjezdaniSistem,
			String zvjezdanoJato, String galaksija, String galaktickoJato, String superjato) {
		super();
		ImeZvijezde = imeZvijezde;
		SpektralnaKlasifikacija = spektralnaKlasifikacija;
		ZvjezdaniSistem = zvjezdaniSistem;
		ZvjezdanoJato = zvjezdanoJato;
		Galaksija = galaksija;
		GalaktickoJato = galaktickoJato;
		Superjato = superjato;
	}

	public String getImeZvijezde() {
		return ImeZvijezde;
	}

	public void setImeZvijezde(String imeZvijezde) {
		ImeZvijezde = imeZvijezde;
	}

	public String getSpektralnaKlasifikacija() {
		return SpektralnaKlasifikacija;
	}

	public void setSpektralnaKlasifikacija(String spektralnaKlasifikacija) {
		SpektralnaKlasifikacija = spektralnaKlasifikacija;
	}

	public String getZvjezdaniSistem() {
		return ZvjezdaniSistem;
	}

	public void setZvjezdaniSistem(String zvjezdaniSistem) {
		ZvjezdaniSistem = zvjezdaniSistem;
	}

	public String getZvjezdanoJato() {
		return ZvjezdanoJato;
	}

	public void setZvjezdanoJato(String zvjezdanoJato) {
		ZvjezdanoJato = zvjezdanoJato;
	}

	public String getGalaksija() {
		return Galaksija;
	}

	public void setGalaksija(String galaksija) {
		Galaksija = galaksija;
	}

	public String getGalaktickoJato() {
		return GalaktickoJato;
	}

	public void setGalaktickoJato(String galaktickoJato) {
		GalaktickoJato = galaktickoJato;
	}

	public String getSuperjato() {
		return Superjato;
	}

	public void setSuperjato(String superjato) {
		Superjato = superjato;
	}
	

}
